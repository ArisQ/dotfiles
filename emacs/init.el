

; C-x C-e to execute sexp

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
;; (menu-bar-mode -1)
;; (setq visible-bell t)


;; (set-face-attribute 'default nil :font "Fira Code Retina" :height 280)
;; (set-face-attribute 'default nil :font "WenQuanYi Zen Hei Mono" :height 160)
;; (add-to-list 'default-frame-alist '(font . "Yahei Consolas Hybrid-12"))
;; (add-to-list 'default-frame-alist '(font . "WenQuanYi Zen Hei"))
(add-to-list 'default-frame-alist '(font . "WenQuanYi Zen Hei Mono-16"))
;; (add-to-list 'default-frame-alist '(font . "YaHei Consolas Hybrid-16"))

;; Themes
;; https://emacsthemes.com/
;;
;; (load-theme 'tango-dark)
;; (load-theme 'doom-solarized-dark)
;; (load-theme 'doom-tomorrow-night)
;; (load-theme 'doom-monokai-classic) ;; 背景偏黄
;; (load-theme 'doom-monokai-octagon) ;; 太蓝
;; (load-theme 'doom-monokai-pro) ;; 太黄
;; (load-theme 'doom-monokai-ristretto) ;; 比pro更黄
;; (load-theme 'doom-monokai-machine t) ;; 还行 有点蓝
;; (load-theme 'doom-monokai-spectrum) ;; 还行 偏暗


;; vim style C-g
;; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)


; MELPA community packages

;; Initialize package sources
(require 'package)

;;			 ("melpa-stable" . "https://stable.melpa.org/packages/")
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; 某些mode下禁用line numbers
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshel-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; display command line history
;; M-x global-command-log-mode
;; M-x clm/toggle-command-log-buffer
(use-package command-log-mode)


;; C-h f describe-function


;; ivy buffer completion
(use-package ivy
  :diminish
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

;; 首次安装需要运行 M-x all-the-icons-install-fonts
(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))
(use-package doom-themes
  :init (load-theme 'doom-monokai-machine t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  ;; :init (which-key-mode)
  ;; :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config (setq ivy-initial-inputs-alist nil))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))


(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" default))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(all-the-icons doom-themes helpful counsel ivy-rich which-key rainbow-delimiters doom-modeline ivy command-log-mode use-package))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
