;;; Make emacs startup faster
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)
 
(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
 
(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))
 
(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
    gc-cons-percentage 0.1))
 
(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;

;; Initialize melpa repo
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
        '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Initialize use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Load Witchmacs theme
(load-theme 'Witchmacs t)

;; Load config.org for init.el configuration
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("acb636fb88d15c6dd4432e7f197600a67a48fd35b54e82ea435d7cd52620c96d" "f9860813741f589bccc0339d82e1aa04b51a393895c5cee0ae176bb653bc2b8b" "06dd05d1f972a0bbffee7b6eac8455875227b13e4fadd44c9b3957721b1cf722" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit default :extend t :stipple nil :background "peach puff" :foreground "medium orchid" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "ADBO" :family "SourceCodeVF")))))
