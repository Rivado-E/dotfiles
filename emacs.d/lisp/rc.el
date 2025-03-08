;;; rc.el --- Core functions and macros

;; Function to require packages safely
(defun rc/require (&rest packages)
  "Ensure PACKAGES are loaded."
  (dolist (pkg packages)
    (unless (require pkg nil 'noerror)
      (message "Could not load package: %s" pkg))))

;; Function to load themes safely
(defun rc/require-theme (theme)
  "Load THEME safely."
  (when (rc/require theme)
    (load-theme theme t)))

(provide 'rc)

