(setq auth-sources '("~/.authinfo"))
(setq mac-command-modifier 'meta)

;; C-x C-e to execute sexp

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
;; (menu-bar-mode -1)
;; (setq visible-bell t)


;; (set-face-attribute 'default nil :font "Fira Code Retina" :height 280)
;; (set-face-attribute 'default nil :font "WenQuanYi Zen Hei Mono" :height 160)
(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 150)
;; (add-to-list 'default-frame-alist '(font . "Yahei Consolas Hybrid-12"))
;; (add-to-list 'default-frame-alist '(font . "WenQuanYi Zen Hei"))
;; (add-to-list 'default-frame-alist '(font . "WenQuanYi Zen Hei Mono-16"))
;; (add-to-list 'default-frame-alist '(font . "YaHei Consolas Hybrid-16"))

;; enable by `M-x variable-pitch-mode`
(set-face-attribute 'fixed-pitch nil :font "FiraCode Nerd Font" :height 180)
(set-face-attribute 'variable-pitch nil :font "YaHei Consolas Hybrid" :height 200 :weight 'regular)


; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Themes
;; https://emacsthemes.com/
;;
;; (load-theme 'tango-dark)
;; (load-theme 'wombat)
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
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package counsel
  ; :bind (("M-x" . counsel-M-x)
  :bind (
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

(use-package general)
(general-create-definer leader-key :prefix "C-c")


(use-package evil
  :init (evil-mode 0))
;; (use-package evil-collection
;;   :after evil
;;   :config (evil-collection-init))

(use-package hydra)
(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))
(leader-key "ts" '(hydra-text-scale/body :which-key "scale test"))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Projects")
	(setq projectile-project-search-path '("~/Projects")))
  (setq projectile-switch-project-action #'projectile-dired))
(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))
;; (use-package evil-magit
;;  :after magit)

;; https://magit.vc/manual/ghub/Getting-Started.html
;; https://magit.vc/manual/forge
(use-package forge
  :after magit
  :config
  (add-to-list 'forge-alist '("git.bilibili.co" "git.bilibili.co/api/v4" "git.bilibili.co" forge-gitlab-repository)))

(defun aq/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))
;;  (setq evil-auto-indent nil))
;;  (auto-fill-mode 0)


(use-package org
;;  :hook (org-mode . aq/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq	org-hide-emphasis-markers t)

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-todo-keywords
       '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
	 (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))
  ;; https://github.com/daviwil/emacs-from-scratch/blob/5e1f99448e32852277e2d274ce2057d55b8c7aaf/init.el#L300

  (setq org-agenda-files '("~/Nextcloud/OrgMode/wiki/editors/emacs/emacs-from-scratch.org")))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; org mode heading font size
(dolist (face '((org-level-1 . 1.2)
		(org-level-2 . 1.1)
		(org-level-3 . 1.05)
		(org-level-4 . 1.0)
		(org-level-5 . 1.1)
		(org-level-6 . 1.1)
		(org-level-7 . 1.1)
		(org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "FiraCode Nerd Font" :weight 'regular :height (cdr face)))

;; Ensure that anything that should be fixed-pitch in Org files appears that way
(set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
(set-face-attribute 'line-number nil :inherit 'fixed-pitch)
(set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch)

;; org mode 居中显示
(defun aq/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode))
(use-package visual-fill-column
  :defer t
  :hook (org-mode . aq/org-mode-visual-fill))


(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

;; org mode (Refer: org mode guide)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; move customize to seperate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

