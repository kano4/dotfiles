;; don't make backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
;; dont't show startup screen
(setq inhibit-startup-screen t)

;; remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; remove tool bar
(tool-bar-mode 0)