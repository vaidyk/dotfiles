;;; package --- Summary
;;; Commentary:
;; Lots of miscellaneous tweaks and features

;;; Code:

(eval-when-compile
  (defvar my-free-variable))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (setq package-enable-at-startup nil)
  (package-initialize)
  )

;; Simpler undo with Ctrl+z
(global-unset-key "\C-z")
(global-set-key "\C-z" 'advertised-undo)

(delete-selection-mode t)

;; make indentation commands use space only (never tab char)
(setq-default indent-tabs-mode nil)

;; set default tab char's display width to 4 spaces
(setq-default tab-width 4)

;; Setup file backups

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

(defvar c-default-style "linux")
(defvar c-basic-offset 4)

;; Allow toggling between source and header file
(add-hook 'cc-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; (add-to-list 'load-path "~/.emacs.d/")

(load-theme 'zenburn t)
;; Hide Show mode for code folding
(add-hook 'c-mode-common-hook
          (lambda()
            
            (local-set-key (kbd "C-c <right>") 'hs-show-block)
            (local-set-key (kbd "C-c <left>")  'hs-hide-block)
            (local-set-key (kbd "C-c <up>")    'hs-hide-all)
            (local-set-key (kbd "C-c <down>")  'hs-show-all)

            (hs-minor-mode t)
            (hs-hide-all)
            )
          )

(add-hook 'perl-mode-hook
          (lambda()
            (local-set-key (kbd "C-c <right>") 'hs-show-block)
            (local-set-key (kbd "C-c <left>")  'hs-hide-block)
            (local-set-key (kbd "C-c <up>")    'hs-hide-all)
            (local-set-key (kbd "C-c <down>")  'hs-show-all)

            (hs-minor-mode t)
            (hs-hide-all)
            )
          )

(add-hook 'cperl-mode-hook
          (lambda()
            (local-set-key (kbd "C-c <right>") 'hs-show-block)
            (local-set-key (kbd "C-c <left>")  'hs-hide-block)
            (local-set-key (kbd "C-c <up>")    'hs-hide-all)
            (local-set-key (kbd "C-c <down>")  'hs-show-all)

            (hs-minor-mode t)
            (hs-hide-all)
            )
          )

(add-hook 'sh-mode-hook
          (lambda()
            (local-set-key (kbd "C-c <right>") 'hs-show-block)
            (local-set-key (kbd "C-c <left>")  'hs-hide-block)
            (local-set-key (kbd "C-c <up>")    'hs-hide-all)
            (local-set-key (kbd "C-c <down>")  'hs-show-all)

            (hs-minor-mode t)
            (hs-hide-all)
            )
          )

(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-line-column 79)
(setq whitespace-style
      '(faces lines-tail))
(setq whitespace-style '(trailing tabs newline tab-mark newline-mark))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("943bff6eada8e1796f8192a7124c1129d6ff9fbd1a0aed7b57ad2bf14201fdd4" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(fci-rule-color "#383838")
 '(inhibit-startup-screen t)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))

(global-linum-mode 1)
(defvar linum-format "%d ")

(require 'tramp)
(setq tramp-default-method "ssh")
(define-key function-key-map "[1;5F" [C-end])
(define-key function-key-map "[1;5H" [C-home])
(global-set-key "\M-[1;5C"    'forward-word)      ; Ctrl+right   => forward word
(global-set-key "\M-[1;5D"    'backward-word)     ; Ctrl+left    => backward word
(global-set-key "\M-[1;5B"    'forward-paragraph)     ; Ctrl+up    => forward para
(global-set-key "\M-[1;5A"    'backward-paragraph)      ; Ctrl+down   => backward para


(global-set-key [next]
                (lambda () (interactive)
                  (condition-case nil (scroll-up)
                    (end-of-buffer (goto-char (point-max))))))

(global-set-key [prior]
                (lambda () (interactive)
                  (condition-case nil (scroll-down)
                    (beginning-of-buffer (goto-char (point-min))))))

;; (require 'whitespace.el)

(global-set-key [f1] 'ansi-term)

(require 'auto-complete-config)
(ac-config-default)

(setq visible-bell 'nil)
(setq ring-bell-function 'ignore)

(add-hook 'after-init-hook #'global-flycheck-mode)

(when (string= system-name "VAIDY")
  (defvar flycheck-perl-executable "C:/validat/perl/bin/perl.exe")
  (defvar flycheck-perl-perlcritic-executable "C:/validat/perl/bin/perl.exe"))

(defvar flycheck-perl-executable "/local/mnt/workspace/validat/perl/bin/vdev-perl")
(defvar flycheck-perl-perlcritic-executable "perlcritic")
(defvar flycheck-indication-mode 'left-fringe)

(require 'flycheck-tip)
(global-set-key (kbd "C-c n") 'flycheck-tip-cycle)
(flycheck-tip-use-timer 'verbose)

(setq echo-keystrokes 0.1)


(require 'tex-site)
;; invoke the AUCTeX package (LaTeX support)

(setq TeX-output-view-style '(("." "." "evince %o ")))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(setq TeX-PDF-mode t)
;;; .emacs ends here

;;(require 'sr-speedbar)
;;(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
;;(setq speedbar-use-images t)


;; use cperl-mode instead of perl-mode
(setq auto-mode-alist (rassq-delete-all 'perl-mode auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.\\(p\\([lm]\\)\\)\\'" . cperl-mode))

(setq interpreter-mode-alist (rassq-delete-all 'perl-mode interpreter-mode-alist))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(defvaralias 'cperl-indent-level 'tab-width)

;; Use 4 space indents via cperl mode
(custom-set-variables
'(cperl-close-paren-offset -4)
'(cperl-continued-statement-offset 0)
'(cperl-indent-parens-as-block t)
'(cperl-tab-always-indent t)
'(cperl-merge-trailing-else nil)
'(cperl-extra-newline-before-brace t)
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
