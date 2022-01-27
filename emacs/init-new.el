;; chrisPmacs
;; remove default fluff
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; font
(defvar efs/default-font-size 130)
(defvar efs/default-variable-font-size 130)

;; later used to configure UI elements
(set-face-attribute 'default nil :font "Iosevka Nerd Font Mono" :height efs/default-font-size)
(set-face-attribute 'fixed-pitch nil :font "Iosevka Nerd Font Mono" :height efs/default-font-size)
(set-face-attribute 'variable-pitch nil :font "Iosevka" :height efs/default-variable-font-size :weight 'medium)

;; Initialize package repos
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

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

(with-eval-after-load 'org
  (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
      (python . t)))
  (push '("conf-unix" . conf-unix) org-src-lang-modes))

;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

;; Automatically tangle our Emacs.org config file when we save it
(defun efs/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/dotfiles/emacs/Emacs.org"))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'efs/org-babel-tangle-config)))
