
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; my changes ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; add .emacs.d/ to load path
(add-to-list 'load-path "~/.emacs.d/")

;;; yasnippet
;;; =========
;; place snippets in ~/.emacs.d/snippets
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;; auto-complete-mode
;; ==================
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict") 
(ac-config-default) 


;; nice latex autocomplete mode
;; ============================
;(require 'auto-complete-auctex)


;; predictive mode
;; ================
;(add-to-list 'load-path "~/.emacs.d/predictive")


;;; no startup screen?
;;; ==================
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; tramp (editing remote files over ssh scp rsync
;; ==============================================
;(add-to-list 'load-path "~/emacs/tramp/lisp/")
;;(add-to-list 'load-path "~/emacs/tramp/contrib/")
;(require 'tramp)
;(setq tramp-verbose 10)
;(setq tramp-default-method "scp") ;; use sssh instead of scp
;(add-to-list 'backup-directory-alist
;	     (cons tramp-file-name-regexp nil))


;; set autosave #filesthatlooklikethis# to /tmp
;; ============================================
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(put 'upcase-region 'disabled nil)


;; flo says this makes spaces instead of tabs
;; ============================================
;; (setq-default 'indent-tabs-mode nil)


;; Emacs should always ask for confirmation on exit
;; =================================================
(setq confirm-kill-emacs 'yes-or-no-p)


;; colorize all buffers
;; ====================
(global-font-lock-mode t)


;; better scrolling
;; ==================
(setq scroll-step 1)
(setq scroll-conservatively 5)


;; flyspell
;; ==========
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
      (add-hook hook (lambda () (flyspell-mode -1))))


;; color theme
;; =============
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))


;; color theme solarized 
;; ======================
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(color-theme-initialize)
(color-theme-solarized-dark)










