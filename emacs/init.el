;; chrisPmacs
;; remove default fluff
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq visible-bell t)

;; font
(set-face-attribute 'default nil :font "Iosevka Nerd Font Mono" :height 130)

;; Initialize package repos
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package command-log-mode)
 
(use-package counsel
  :diminish
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 ("C-s" . swiper)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done))
  :demand
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap t))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; NOTE: The fist time you load this on a new machine, be sure to run:
;; M-x all-the-icons-install-fonts
(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package doom-themes
  ;;:init (load-theme 'doom-snazzy t)
  ;;:init (load-theme 'doom-gruvbox t)
  ;;:init (load-theme 'doom-horizon t)
  :init (load-theme 'doom-palenight t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1.2))

(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package general
  :config
  (general-create-definer efs/leader-key
    :prefix "C-c")

  (efs/leader-key
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("n" text-scale-increase "up")
  ("p" text-scale-decrease "down")
  ("q" nil "finish and exit" :exit t))

(efs/leader-key
  "ts"  '(hydra-text-scale/body :which-key "scale text"))
