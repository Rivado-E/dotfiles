;;; ui.el --- UI enhancements

;; Default font selection
(set-frame-font "Iosevka Term Nerd Font Mono-20" t t)

;; Enable visual features
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)

(setq inhibit-startup-message t) ;; Disable startup message

;; UI Optimizations
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Load theme correctly
(use-package gruber-darker-theme
  :ensure t
  :config
  (mapc #'disable-theme custom-enabled-themes) ;; Disable old themes
  (load-theme 'gruber-darker t))

(provide 'ui)

