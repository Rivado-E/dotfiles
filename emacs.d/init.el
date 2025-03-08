;;; init.el --- Main Emacs configuration

;; Set custom-file (GUI customizations)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Package management setup
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)  ;; Auto-install packages

;; Load modular configurations
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "rc")             ;; Core functions and macros
(load "ui")             ;; UI settings
(load "evil-config")    ;; Vim emulation with Evil Mode
(load "keybindings")    ;; Custom keybindings
;; (load "dev-tools")      ;; IDE features (LSP, completion, syntax checking)
(load "languages")      ;; Language-specific configurations
(load "org-config")     ;; Org Mode customization
(load "dired-config")   ;; File manager (Dired) enhancements
(load "misc")           ;; Miscellaneous settings

(provide 'init)

