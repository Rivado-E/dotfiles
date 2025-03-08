;;; misc.el -- Miscellaneous settings

;; Auto-delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enable word wrap in Markdown
(add-hook 'markdown-mode-hook 'toggle-word-wrap)

;; Enable Paredit in Lisp modes
(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode . paredit-mode)
         (lisp-mode . paredit-mode)
         (scheme-mode . paredit-mode)))

(evil-leader/set-key
  "sg" 'grep)


(provide 'misc)

