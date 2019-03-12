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
(load-theme 'wilson t)

(set-frame-font "Hack 12")
;; (set-frame-font "Consolas 12")
(prefer-coding-system 'utf-8)
(setq global-linum-mode t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (custom-set-variables
;;  '(initial-buffer-choice "D:/dev/prj/TODO.org"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(split-window-vertically)
(split-window-horizontally)

;; reload where you left
(desktop-save-mode 1)

;; All purpose bindings
(global-set-key (kbd "M-i") 'imenu)


;;Neotree
(require 'neotree)
(setq neo-smart-open t)
;; (require 'all-the-icons)

(global-set-key [f8] 'neotree-toggle)
;;(setq neo-theme 'icons ) ;; too slow on windows

;;Navigating
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
;; (global-set-key (kbd "C-TAB") 'other-window)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-l") 'find-tag)

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; Haskell
(load-file "D:/dev/emacs/vendors/intero/elisp/intero.el")
(add-hook 'haskell-mode-hook 'intero-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default)))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(package-selected-packages
   (quote
    (highlight-symbol alect-themes zenburn-theme zenburn yaml-mode sublime-themes purescript-mode psc-ide projectile neotree intero hindent helm expand-region all-the-icons))))



(require 'hindent)
(add-hook 'haskell-mode-hook #'hindent-mode)

;; hoogle
(require 'haskell-mode)
(define-key haskell-mode-map "\C-ch" 'haskell-hoogle)
(setq haskell-hoogle-command "hoogle")
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)


;(require 'speedbar)
;  (speedbar-add-supported-extension ".hs")

;;(require 'engine-mode)
;;(engine-mode t)
;;(setq engine/browser-function 'eww-browse-url)
;;(defengine hoogle
;; "https://www.haskell.org/hoogle/?hoogle="
;;  :browser 'eww-browse-url)

;;(load-file "D:/dev/emacs/vendors/helm/helm-config.el")
;;(mapc 'load (file-expand-wildcards "D:/dev/emacs/vendors/helm/*.el"))
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

;; Purescript
(require 'psc-ide)

(add-hook 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)))

(global-set-key (kbd "C-SPC") 'company-complete)

;; Navigation
