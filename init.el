;;; package -- Summary
;;; Commentary:
;;; Code:

(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; Personal UI cusomizations
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

;;; Personal keybindings
(global-set-key (kbd "M-o") 'other-window)

;;; Backup file behavior
(setq backup-directory-alist '(("." . "~/.emacs.backup.d")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config (exec-path-from-shell-initialize))

(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula t))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package ido
  :init
  (ido-mode 1)
  :config
  (progn
    (setq ido-case-fold t)
    (setq ido-enable-prefix nil)
    (setq ido-enable-flex-matching t)
    (setq ido-create-new-buffer 'always)
    (setq ido-max-prospects 10)
    (setq ido-use-faces nil)))

(use-package ido-vertical-mode
  :ensure t
  :init (ido-vertical-mode 1)
  :config (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package ido-ubiquitous
  :ensure t
  :init (ido-ubiquitous-mode 1))

(use-package flx-ido
  :ensure t
  :init (flx-ido-mode 1))

(use-package evil-mc
  :ensure t
  :init (global-evil-mc-mode 1))

;; (use-package multiple-cursors
;;   :ensure t
;;   :bind (("C->" . mc/mark-next-like-this)
;; 	 ("C-<" . mc/mark-previous-like-this)
;; 	 ("C-c C-<" . mc/mark-all-like-this)))

(use-package company
  :ensure t
  :config (global-company-mode))

(use-package sml-mode
  :ensure t)

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

(use-package evil
  :ensure t
  :config (evil-mode 1))

(use-package key-chord
  :ensure t
  :config (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-mc key-chord evil flycheck sml-mode company multiple-cursors flx-ido ido-ubiquitous ido-vertical-mode magit exec-path-from-shell use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
