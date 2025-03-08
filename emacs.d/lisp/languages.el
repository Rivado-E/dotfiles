;;; languages.el -- Programming language configurations

(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode))

(use-package rust-mode
  :ensure t)

(use-package typescript-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)


(use-package python
  :ensure nil  ;; Built-in package
  :mode ("\\.py\\'" . python-mode)
  :config
  (setq python-shell-interpreter "python3"))  ;; Set default Python interpreter

(provide 'languages)

