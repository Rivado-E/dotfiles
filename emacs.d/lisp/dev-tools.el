;;; dev-tools.el --- IDE-like enhancements

(use-package company
  :config
  (global-company-mode))

(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package lsp-mode
  :commands lsp
  :hook ((python-mode .
::contentReference[oaicite:27]{index=27}

