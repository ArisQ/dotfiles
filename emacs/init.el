

; C-x C-e to execute sexp

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
;(menu-bar-mode -1)
;(setq visible-bell t)


; (set-face-attribute 'default nil :font "Fira Code Retina" :height 280)
; (set-face-attribute 'default nil :font "WenQuanYi Zen Hei Mono" :height 160)
; (add-to-list 'default-frame-alist '(font . "Yahei Consolas Hybrid-12"))
; (add-to-list 'default-frame-alist '(font . "WenQuanYi Zen Hei"))
(add-to-list 'default-frame-alist '(font . "WenQuanYi Zen Hei Mono-16"))


(load-theme 'tango-dark)

; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)


; MELPA community packages

;; Initialize package sources
(require 'package)

;			 ("melpa-stable" . "https://stable.melpa.org/packages/")
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

; initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; display command line history
;; M-x global-command-log-mode
;; M-x clm/toggle-command-log-buffer
(use-package command-log-mode)

;; C-h f describe-function


;; ivy buffer completion
(use-package ivy
;  :diminishg
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . iv-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))  


(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(doom-modeline ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
