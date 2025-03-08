;;; dired-config.el -- Improve Dired file manager

(use-package dired
  :ensure nil ;; Already built-in
  :config
  (setq dired-listing-switches "-alh"))

(use-package dired-x
  :ensure nil)

(provide 'dired-config)

