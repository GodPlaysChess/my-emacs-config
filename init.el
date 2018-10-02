(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade.ferrier.me.uk/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

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
 '(initial-buffer-choice "D:/dev/prj/TODO.org")
 '(package-selected-packages
   (quote
    (scala-mode zenburn-theme zenburn use-package color-theme-monokai))))
(custom-set-faces)
(split-window-vertically)
(split-window-horizontally)

;;Neotree
(require 'neotree)
(require 'all-the-icons)
(global-set-key [f8] 'neotree-toggle)

;;Navigating
(ido-mode 1)
;(global-set-key (kbd "C-TAB") 'other-window)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-l") 'find-tag)


;; Haskell
(load-file "D:/dev/emacs/vendors/intero/elisp/intero.el")
(add-hook 'haskell-mode-hook 'intero-mode)
(custom-set-variables
 '(haskell-stylish-on-save t))

(custom-set-variables
 '(haskell-tags-on-save t))

(require 'hindent)
(add-hook 'haskell-mode-hook #'hindent-mode)

;(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)


;(require 'speedbar)
;  (speedbar-add-supported-extension ".hs")

;;(require 'engine-mode)
;;(engine-mode t)
;;(setq engine/browser-function 'eww-browse-url)
;;(defengine hoogle
;; "https://www.haskell.org/hoogle/?hoogle="
;;  :browser 'eww-browse-url)


(require 'helm-config)
(helm-mode 1)

;; Projectile
(setq projectile-project-search-path '("d:/dev/prj/haskell" "d:/dev/prj/purescript"))
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(global-set-key (kbd "M-9") 'kill-whole-line)

;; Yaml
 (require 'yaml-mode)
   (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
