;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;;
(setq doom-font (font-spec :family "Iosevka Nerd Font Mono" :weight 'Regular :size 18)
        doom-variable-pitch-font (font-spec :family "Iosevka Etoile" :weight 'Thin :size 18)
        doom-big-font (font-spec :family "Iosevka Etoile" :weight 'Regular :size 24))
;;(setq doom-font (font-spec :family "UbuntuMono Nerd Font Mono" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-gruvbox)
;;(setq doom-theme 'doom-nord)
;;(setq doom-theme 'doom-solarized-dark)
(setq doom-theme 'doom-one)
;;(setq doom-theme 'doom-tomorrow-night)
;;(setq doom-theme 'doom-twilight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/"
      org-log-done 'time)

;; Org-journal settings
(setq org-journal-file-format "%Y-%m-%d.org"
      org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d")

;; Org-roam settings
(setq org-roam-directory "~/roam")

;; Org-pretty (for purdyness)
;; set basic title font
;;(set-face-attribute 'org-level-8 nil :weight 'bold :inherit 'default)
;; Low levels are unimportant => no scaling
;;(set-face-attribute 'org-level-7 nil :inherit 'org-level-8)
;;(set-face-attribute 'org-level-6 nil :inherit 'org-level-8)
;;(set-face-attribute 'org-level-5 nil :inherit 'org-level-8)
;;(set-face-attribute 'org-level-4 nil :inherit 'org-level-8)
;; Top ones get scaled the same as in LaTeX (\large, \Large, \LARGE)
;;(set-face-attribute 'org-level-3 nil :height 1.2) ;\large
;;(set-face-attribute 'org-level-2 nil :height 1.41) ;\Large
;;(set-face-attribute 'org-level-1 nil :height 1.528) ;\LARGE
;; Only use the first 4 styles and do not cycle.
;;(setq org-cycle-level-faces nil)
;;(setq org-n-level-faces 4)
;;;; Document Title, (\huge)
;;(set-face-attribute 'org-document-title nil
;;                    :height 2.074
;;                    :foreground 'unspecified
;;                    :inherit 'org-level-8)
(setq org-superstar-headline-bullets-list '("⁖" "●" "◉" "○"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(map! :ne "M-/" #'comment-or-uncomment-region)

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup))
