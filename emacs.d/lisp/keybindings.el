;;; keybindings.el --- Custom keybindings

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Magit keybindings
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

(define-key evil-insert-state-map (kbd "jk") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "kj") 'evil-normal-state)
(global-set-key (kbd "M-x") 'execute-extended-command)


(provide 'keybindings)

