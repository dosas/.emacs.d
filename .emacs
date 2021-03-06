
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; my changes ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; add .emacs.d/ to load path
(add-to-list 'load-path "~/.emacs.d/")

;;; make backspace behave as usual  (http://www.gnu.org/software/emacs/manual/html_node/emacs/DEL-Does-Not-Delete.html)
;(normal-erase-is-backspace-mode 0)

;;; set frame size
(if window-system
    (set-frame-size (selected-frame) 150 50))

;;; C-h does same thing as in bash
(global-set-key (kbd "C-h") 'delete-backward-char)

;;; yasnippet (git clone https://github.com/capitaomorte/yasnippet.git)
;;; =====================================================================
;; place snippets in ~/.emacs.d/snippets
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;; auto-complete-mode (git clone https://github.com/auto-complete/auto-complete.git)
;; =====================================================================================
;; documentation http://cx4a.org/software/auto-complete/manual.html
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/auto-complete/lib/popup")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict") 
(ac-config-default) 
(ac-flyspell-workaround)
(add-hook 'LaTeX-mode-hook 'auto-complete-mode)

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

;; php mode (http://php-mode.sourceforge.net/)
;; ================================================
(add-to-list 'load-path "~/.emacs.d/php-mode-1.5.0")
(require 'php-mode)

;; tramp (editing remote files over ssh scp rsync
;; ==============================================
(require 'tramp)
(setq tramp-default-method "ssh")

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


;; color theme (wget http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.zip)
;; ===============================================================================================
;; required for solarized pre emacs24
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))


;; color theme solarized (git clone https://github.com/sellout/emacs-color-theme-solarized.git)
;; ============================================================================================
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(color-theme-initialize)
(color-theme-solarized-dark)


;; set font size (in 1/10pt)
;; =========================
(set-face-attribute 'default nil :height 110)


;; LaTex (wget http://ftp.gnu.org/pub/gnu/auctex/auctex-11.87.zip)
;; ===============================================================

;; use latest auctex 
;(add-to-list 'load-path "~/.emacs.d/auctex-11.87")
;(require 'auctex)
;(add-to-list 'load-path "~/.emacs.d/auctex-11.87/preview")
;(require 'preview-latex)
(load "~/.emacs.d/auctex-11.87/auctex.el" nil t t)
(load "~/.emacs.d/auctex-11.87/preview/preview-latex.el" nil t t)

;; not working
(setq TeX-engine 'pdflatex)

;; reload doc view after latex compilation
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(setq TeX-PDF-mode t) ;; use .pdf instead of .dvi

;; recommended
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil) ;; support for multi-file document structure
;(setq TeX-view-program-list '(("Evince" "evince %q")))
;(setq TeX-view-program-selection '((output-pdf "Evince")))

;; TODO fix this
;(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; include reftex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; enable synctex with evince (http://emacswiki.org/emacs/AUCTeX#toc20)
;; ====================================================================

;; predictive mode (git clone http://www.dr-qubit.org/git/predictive.git)
;; makes problems in latex
;; ======================================================================
;; documentation http://www.dr-qubit.org/download.php?file=predictive/predictive-user-manual/predictive-user-manual.pdf
;(add-to-list 'load-path "~/.emacs.d/predictive")
;; dictionary locations
;(add-to-list 'load-path "~/.emacs.d/predictive/latex/")
;(add-to-list 'load-path "~/.emacs.d/predictive/texinfo/")
;(add-to-list 'load-path "~/.emacs.d/predictive/html/")
;(require 'predictive)
;(add-hook 'text-mode-hook 'predictive-mode)
;(add-hook 'LaTeX-mode-hook 'predictive-mode)


;; compilation mode M-x compile
;; ============================
(setq compilation-auto-jump-to-first-error t)
(setq compilation-command "make -C .")


;; cedet 
;; wget http://downloads.sourceforge.net/project/cedet/cedet/cedet-1.1.tar.gz
;; http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html
;; ===========================================================
;(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu
;(when window-system          ; start speedbar if we're using a window system
;    (speedbar t))


;; differnet buffer switching
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
;; =======================
;(require 'ido)
;(ido-mode t)


;; fill column indicator 
;; wget http://www.emacswiki.org/emacs/download/fill-column-indicator.el
;; =====================
;(add-to-list 'load-path "~/.emacs.d/fill-column-indicator.el")
;(require 'fill-column-indicator)
;(define-globalized-minor-mode
; global-fci-mode fci-mode (lambda () (fci-mode 1)))
;(global-fci-mode t)


;; pyhton-mode
;; wget https://launchpad.net/python-mode/trunk/6.1.2/+download/python-mode.el-6.1.2.tar.gz
;; ========================================================================================
;(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.2")
;(add-to-list 'load-path py-install-directory)
;(require 'python-mode)

; use IPython
;(setq-default py-shell-name "ipython")
;(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
;(setq py-python-command-args
;  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
;(setq py-shell-switch-buffers-on-execute-p t)
;(setq py-switch-buffers-on-execute-p t)
; don't split windows
;(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
;(setq py-smart-indentation t)


;; pymacs
;; git clone https://github.com/pinard/Pymacs.git pymacs-git
;; =========================================================
;(add-to-list 'load-path "~/.emacs.d/pymacs-git")
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)
;(autoload 'pymacs-autoload "pymacs")


;; ropemacs (requires pymacs)
;; sudo aptitude install python-rope
;; hg clone https://bitbucket.org/agr/ropemacs ropemacs-hg
;; ========================
;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)