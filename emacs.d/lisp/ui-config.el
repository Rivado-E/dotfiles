(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

(set-frame-font "IosevkaTerm Mono-14" t t)

;;; Appearance
(defun rc/get-default-font ()
  (cond
   ((eq system-type 'gnu/linux) "Iosevka-20")))
