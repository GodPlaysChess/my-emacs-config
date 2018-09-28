(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade.ferrier.me.uk/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(unless (package-installed-p 'scala-mode)
(package-refresh-contents) (package-install 'scala-mode))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(delete-selection-mode 1)
(fset `yes-or-no-p `y-or-n-p)
(load-theme 'zenburn t)
(set-frame-font "Consolas 12")
(prefer-coding-system 'utf-8)
(setq global-linum-mode t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(custom-set-variables
 '(initial-buffer-choice "e:/dev/prj/TODO.org")
 '(package-selected-packages
   (quote
    (scala-mode zenburn-theme zenburn use-package color-theme-monokai))))
(custom-set-faces)
(split-window-vertically)
(split-window-horizontally)




;;Navigating
(ido-mode 1)

;; Haskell
(add-hook 'haskell-mode-hook #'hindent-mode)
(load-file "e:/dev/emacs/vendors/intero/elisp/intero.el")
(add-hook 'haskell-mode-hook 'intero-mode)

;;(require 'engine-mode)
;;(engine-mode t)
;;(setq engine/browser-function 'eww-browse-url)
;;(defengine hoogle
;; "https://www.haskell.org/hoogle/?hoogle="
;;  :browser 'eww-browse-url)

;;Neotree
(require 'neotree)
(require 'all-the-icons)
(global-set-key [f8] 'neotree-toggle)

(require 'helm-config)
(helm-mode 1)

;; Projectile
(setq projectile-project-search-path '("e:/dev/prj/haskell" "e:/dev/prj/purescript"))
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Bash
(setq explicit-shell-file-name "E:\dev\Git\usr\bin\bash.exe")
(setq shell-file-name "bash")
(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(global-set-key [f2] 'shell)
(global-set-key (kbd "M-9") 'kill-whole-line)

;; Open split shell on launch
(add-hook 'emacs-startup-hook
  (lambda ()
    (let ((w (split-window-below 2)))
      (select-window w)
      (sh))
      (switch-to-buffer "*shell*")))

;; Yaml
 (require 'yaml-mode)
   (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
