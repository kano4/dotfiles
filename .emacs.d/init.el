;; dont't show startup screen
(setq inhibit-startup-screen t)

;; remove menu bar
(menu-bar-mode 0)
;; remove tool bar
(tool-bar-mode 0)

;; don't make backup files
(setq make-backup-files nil)
;; don't make auto save files
(setq auto-save-default nil)

;; remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; remove whole line with C-k
(setq kill-whole-line t)

;; show paren
(show-paren-mode 1)