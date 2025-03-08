;;; evil-config.el --- Vim keybindings with Evil Mode

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; Enable Evil Collection (Vim bindings for built-in Emacs modes)
(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

;; Set Space (`SPC`) as Leader Key
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")  ;; Set Space as leader

  ;; Leader Keybindings (SPC)
  (evil-leader/set-key
    "b" 'switch-to-buffer      ;; Switch buffer
    "f" 'find-file            ;; Open file
    "k" 'kill-buffer          ;; Kill buffer
    "r" 'recentf-open-files   ;; Open recent files
    "tt" 'vterm-toggle        ;; Toggle terminal
    "se" 'balance-windows     ;; Equalize window sizes
    "xs" 'delete-window       ;; Close split window
    "tp" 'tab-previous        ;; Previous tab
    "tn" 'tab-next            ;; Next tab
    "td" 'tab-close           ;; Close tab
    "tt" 'tab-new))           ;; New tab

;; Grep and Jump to Files
(use-package consult
  :ensure t)

(use-package consult-ripgrep
  :ensure t
  :after consult
  :config
  (evil-leader/set-key
    "sg" 'consult-ripgrep))  ;; Bind SPC sg to ripgrep

;; Zoom In/Out
(define-key evil-normal-state-map (kbd "C-=") 'text-scale-increase)
(define-key evil-normal-state-map (kbd "C--") 'text-scale-decrease)
(define-key evil-normal-state-map (kbd "C-0") 'text-scale-set)

;; Use ESC to quit prompts and return to Normal Mode
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)

;; Window Navigation (Vim-like)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)

;; Split Management (like Neovim)
(evil-leader/set-key
  "v" 'split-window-right    ;; Vertical split
  "h" 'split-window-below    ;; Horizontal split
  "se" 'balance-windows      ;; Equalize split sizes
  "xs" 'delete-window)       ;; Close split

;; Better Scrolling (Centering)
(evil-leader/set-key
  "d" (lambda () (interactive) (evil-scroll-down 0) (evil-scroll-line-to-center (line-number-at-pos)))
  "u" (lambda () (interactive) (evil-scroll-up 0) (evil-scroll-line-to-center (line-number-at-pos)))
  "f" (lambda () (interactive) (evil-scroll-page-down 0) (evil-scroll-line-to-center (line-number-at-pos)))
  "b" (lambda () (interactive) (evil-scroll-page-up 0) (evil-scroll-line-to-center (line-number-at-pos))))

;; Exit Insert Mode with `jk` or `kj`
(define-key evil-insert-state-map (kbd "jk") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "kj") 'evil-normal-state)

(define-key evil-motion-state-map (kbd "SPC") nil)

(provide 'evil-config)

