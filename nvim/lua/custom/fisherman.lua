local Fisherman = {}
Fisherman.store_path = vim.fn.stdpath("data") .. "/fisherman.json"
Fisherman.items = {}
Fisherman.max_items = 10

local function realpath(p)
	local ok, rp = pcall(vim.loop.fs_realpath, p)
	return (ok and rp) or vim.fn.fnamemodify(p, ":p")
end

local function trim_to_cap()
	while #Fisherman.items > Fisherman.max_items do
		table.remove(Fisherman.items, 1)
	end
end

function Fisherman.load()
	local f = io.open(Fisherman.store_path, "r")
	if not f then return end
	local ok, decoded = pcall(vim.json.decode, f:read("*a"))
	f:close()
	if ok and type(decoded) == "table" then Fisherman.items = decoded end
	trim_to_cap()
end

function Fisherman.save()
	trim_to_cap()
	vim.fn.mkdir(vim.fn.fnamemodify(Fisherman.store_path, ":h"), "p")
	local f = assert(io.open(Fisherman.store_path, "w"))
	f:write(vim.json.encode(Fisherman.items))
	f:close()
end

local function index_by_path(path)
	for i, it in ipairs(Fisherman.items) do
		if it.path == path then return i end
	end
	return nil
end

local function upsert_by_path(item, move_to_end)
	local i = index_by_path(item.path)
	if i then
		Fisherman.items[i].lnum = item.lnum or 1
		Fisherman.items[i].col  = item.col or 0
		if move_to_end then
			local kept = table.remove(Fisherman.items, i)
			table.insert(Fisherman.items, kept)
		end
	else
		table.insert(Fisherman.items, {
			path = item.path, lnum = item.lnum or 1, col = item.col or 0
		})
	end
	trim_to_cap()
end

function Fisherman.add_here()
	local buf = vim.api.nvim_get_current_buf()
	local path = vim.api.nvim_buf_get_name(buf)
	if path == "" then
		vim.notify("fisherman: buffer has no file", vim.log.levels.WARN)
		return
	end
	path = realpath(path)
	local pos = vim.api.nvim_win_get_cursor(0)
	local lnum, col = pos[1], pos[2]

	upsert_by_path({ path = path, lnum = lnum, col = col }, true)
	Fisherman.save()
	local slot = index_by_path(path) or #Fisherman.items
	vim.notify(("fisherman: saved [%d] %s:%d"):format(slot, path, lnum))
end

function Fisherman.jump(i)
	local it = Fisherman.items[i]
	if not it then
		vim.notify("fisherman: empty slot " .. i, vim.log.levels.WARN)
		return
	end
	vim.cmd.edit(it.path)
	pcall(vim.api.nvim_win_set_cursor, 0, { it.lnum, it.col })
end

function Fisherman.clear()
	Fisherman.items = {}
	Fisherman.save()
end

local function item_to_line(it)
	local short = vim.fn.fnamemodify(it.path, ":~:.")
	return ("%s:%d:%d"):format(short, it.lnum or 1, it.col or 0)
end

local function parse_line(line)
	if line:match("^%s*$") or line:match("^%s*#") then return nil end
	local path, lnum, col =
			line:match("^%s*(.-):(%d+):(%d+)%s*$") or
			(function()
				local p, n = line:match("^%s*(.-):(%d+)%s*$")
				if p then return p, n, nil end
				return line:match("^%s*(.-)%s*$"), nil, nil
			end)()
	if not path or path == "" then return nil end
	path = realpath(path)
	return { path = path, lnum = tonumber(lnum) or 1, col = tonumber(col) or 0 }
end

local function items_from_buffer(buf)
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	local new_items = {}
	for _, line in ipairs(lines) do
		local it = parse_line(line)
		if it then table.insert(new_items, it) end
	end
	return new_items
end

local function apply_from_buffer(buf, opts)
	Fisherman.items = items_from_buffer(buf)
	trim_to_cap()
	Fisherman.save()
	if not (opts and opts.silent) then
		vim.notify(("fisherman: %d item(s) saved"):format(#Fisherman.items))
	end
end

function Fisherman.menu_popup()
	if Fisherman._popup and Fisherman._popup.win and vim.api.nvim_win_is_valid(Fisherman._popup.win) then
		vim.api.nvim_set_current_win(Fisherman._popup.win)
		return
	end

	local buf = vim.api.nvim_create_buf(true, false)
	vim.api.nvim_buf_set_name(buf, "fisherman://menu")
	vim.bo[buf].filetype = "fisherman"
	vim.bo[buf].buflisted = true
	vim.bo[buf].buftype = ""
	vim.bo[buf].swapfile = false
	vim.bo[buf].modifiable = true

	local lines = {}
	for _, it in ipairs(Fisherman.items) do
		table.insert(lines, item_to_line(it))
	end
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	local entries = math.min(#Fisherman.items, Fisherman.max_items)
	local height = math.max(6, entries + 2)
	local width = math.min(55, math.floor(vim.o.columns * 0.55))
	local row = math.floor((vim.o.lines - height) / 2 - 1)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		row = row,
		col = col,
		width = width,
		height = height,
		style = "minimal",
		border = "rounded",
		noautocmd = true,
	})
	Fisherman._popup = { buf = buf, win = win }

	vim.wo[win].wrap = true
	vim.wo[win].linebreak = true
	vim.wo[win].breakindent = true
	vim.wo[win].showbreak = "↳ "
	vim.wo[win].number = true

	vim.api.nvim_create_autocmd("BufWriteCmd", {
		buffer = buf,
		callback = function()
			apply_from_buffer(buf)
			vim.bo[buf].modified = false
		end,
	})
	vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
		once = true,
		buffer = buf,
		callback = function()
			if vim.api.nvim_buf_is_valid(buf) then
				apply_from_buffer(buf, { silent = true })
			end
			if Fisherman._popup then
				if Fisherman._popup.win and vim.api.nvim_win_is_valid(Fisherman._popup.win) then
					pcall(vim.api.nvim_win_close, Fisherman._popup.win, true)
				end
				if Fisherman._popup.buf and vim.api.nvim_buf_is_valid(Fisherman._popup.buf) then
					pcall(vim.api.nvim_buf_delete, Fisherman._popup.buf, { force = true })
				end
				Fisherman._popup = nil
			end
		end,
	})

	vim.keymap.set("n", "q", function()
		if vim.api.nvim_buf_is_valid(buf) then
			apply_from_buffer(buf, { silent = true })
			vim.cmd("bd!")
		end
		Fisherman._popup = nil
	end, { buffer = buf, silent = true, desc = "Save and quit Fisherman menu" })

	for n = 1, 9 do
		vim.keymap.set("n", tostring(n), function()
			if Fisherman.items[n] then
				Fisherman.jump(n)
			end
			vim.cmd("bd!")
			Fisherman._popup = nil
		end, { buffer = buf, silent = true, desc = "Jump to Fisherman slot " .. n })
	end

	vim.keymap.set("n", "<CR>", function()
		local lnum = vim.api.nvim_win_get_cursor(win)[1]
		local line = vim.api.nvim_buf_get_lines(buf, lnum - 1, lnum, false)[1] or ""
		local it = parse_line(line)
		if it then
			for i, v in ipairs(Fisherman.items) do
				if v.path == it.path and v.lnum == it.lnum and v.col == it.col then
					Fisherman.jump(i)
					return
				end
			end
			table.insert(Fisherman.items, it)
			trim_to_cap()
			Fisherman.save()
			Fisherman.jump(#Fisherman.items)
		end
	end, { buffer = buf, silent = true })
end

vim.api.nvim_create_user_command("FishermanAdd", Fisherman.add_here, {})
vim.api.nvim_create_user_command("FishermanMenu", Fisherman.menu_popup, {})
vim.api.nvim_create_user_command("FishermanClear", Fisherman.clear, {})
for i = 1, Fisherman.max_items do
	vim.keymap.set("n", ("<leader>%d"):format(i), function() Fisherman.jump(i) end,
		{ desc = ("Fisherman jump %d"):format(i) })
end
vim.keymap.set("n", "<leader>a", Fisherman.add_here, { desc = "Fisherman add" })
vim.keymap.set("n", "<leader>h", Fisherman.menu_popup, { desc = "Fisherman menu" })

Fisherman.load()
vim.api.nvim_create_autocmd("VimLeavePre", { callback = function() Fisherman.save() end })

return Fisherman
