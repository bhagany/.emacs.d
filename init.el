(when (eq system-type 'darwin)
  ;; Suppress error resulting from OS X ls not supporting --dired flag
  (setq dired-use-ls-dired nil)
  ;; Start maximized
  (custom-set-variables '(initial-frame-alist (quote ((fullscreen . maximized))))))

;; No splash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; No scroll bars!
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq-default scroll-step 1)

;;Show me line and column numbers
(line-number-mode 1)
(column-number-mode 1)

;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

;; Package stuff
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages '(clojure-mode
                      cider
                      gist
                      rainbow-mode
                      web-mode))
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; My preferred theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'hagany t)

;; Save backups to ~/.emacs.d/backups
(setq
   backup-by-copying-when-linked t
   backup-directory-alist
   '(("." . "~/.emacs.d/backups"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 0
   version-control t
   vc-make-backup-files t)

;; OMFG BLINKING CURSOR GO AWAY
(blink-cursor-mode 0)

;; Remembers what files you have open and persists them across sessions
(desktop-save-mode 1)

;; Don't make me type "yes" or "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Put the cursor in an intelligent place when searching
(add-hook 'isearch-mode-end-hook 'custom-goto-match-beginning)
(defun custom-goto-match-beginning ()
  "Use with isearch hook to end search at first char of match"
  (when isearch-forward (goto-char isearch-other-end)))

;; do not confirm file creation
(setq confirm-nonexistent-file-or-buffer nil)

;; destroy all trailing whitespace
(add-hook 'before-save-hook 'destroy_all_trailing_whitespace)
(defun destroy_all_trailing_whitespace ()
  (if (not buffer-read-only)
      (delete-trailing-whitespace)))

;; I like downcase-region
(put 'downcase-region 'disabled nil)

;; Allows use of set-goal-column C-x C-n
(put 'set-goal-column 'disabled nil)

;; My preferred key bindings
(global-set-key "\C-w"     'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-xg"    'goto-line)
(global-set-key "\C-cc"    'comment-or-uncomment-region)
(global-set-key "\C-x\C-j" 'join-line)
(global-set-key "\C-x\C-g" 'gist-list)
(global-set-key "\C-cg"    'gist-region-or-buffer)

;; Larger split-height-threshold for preference of vertical splits
(setq split-height-threshold 160)

;; Settings for tabs and scrolling
(setq-default standard-indent 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Don't echo out passwords
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;;; Special mode stuff
;; zsh config files
(add-to-list 'auto-mode-alist '("zsh" . shell-script-mode))

;; packages and configs
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator ":")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(require 'helm-config)
(helm-mode 1)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jinja\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(setq web-mode-engines-alist '(("jinja2" . "\\.jinja\\'")))
