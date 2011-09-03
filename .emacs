(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

(custom-set-variables '(column-number-mode t) '(line-number-mode t))
(setq frame-title-format (format "%%f" (system-name)))
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-set-key "\C-m" 'newline-and-indent)
(setq read-file-name-completion-ignore-case t)
(global-font-lock-mode t)
(auto-compression-mode t)
(setq inhibit-startup-message t)
(show-paren-mode 1)
(setq-default tab-width 2 indent-tabs-mode nil)
(setq visible-bell t)
(setq warning-suppress-types nil)

;; ruby-mode
(add-to-list 'load-path "~/.emacs.d/ruby-mode")
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-compatibility-setup)
(require 'anything)
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(require 'jaspace)
(setq jaspace-alternate-jaspace-string "□")
(setq jaspace-highlight-tabs t)
(setq jaspace-highlight-tabs ?^ )

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)
