

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "English")
 '(ediff-merge-window-function (quote split-window-horizontally))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(mouse-sel-mode t)
 '(mouse-wheel-mode t nil (mwheel))
 '(nil nil t)
 '(package-archives (quote (("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(package-selected-packages
   (quote
    (egg markdown-preview-mode markdown-mode+ dired-k eslint-fix markdown-mode flymd dockerfile-mode jdee vmd-mode jinja2-mode yaml-tomato yaml-mode flymake-yaml flycheck ac-js2)))
 '(show-paren-mode t nil (paren))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray9" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(ediff-even-diff-A ((t (:background "dim gray"))))
 '(ediff-even-diff-B ((t (:background "dim gray"))))
 '(ediff-even-diff-C ((t (:background "dim gray")))) 
 '(ediff-odd-diff-A ((t (:background "dim gray"))))
 '(ediff-odd-diff-B ((t (:background "dim gray")))) 
 '(ediff-odd-diff-C ((t (:background "dim gray"))))
 '(ediff-current-diff-A ((t (:background "dim gray"))))
 '(ediff-current-diff-B ((t (:background "dim gray"))))
 '(ediff-current-diff-C ((t (:background "dim gray"))))
 '(ediff-fine-diff-A ((t (:background "dim brown"))))
 '(ediff-fine-diff-B ((t (:background "dim brown"))))
 '(ediff-fine-diff-C ((t (:background "dim gray")))))

(global-set-key "\C-xl" 'goto-line)
(global-set-key "\C-cc" 'uncomment-region)
(global-set-key "\M-r" 'revert-buffer)
(global-set-key "\M-i" 'indent-region)
(global-set-key "\M-p" 'whitespace-mode)
(global-set-key "\M-D" 'ediff-buffers)
 
(add-hook 'after-save-hook #'global-flycheck-mode)

;; enable with emacs 24.
;;(electric-pair-mode 1)

;;Emacs prefs
(fset 'yes-or-no-p 'y-or-n-p)   ;stop forcing YES or NO
(setq backup-directory-alist '(("." . "~/.emacs-backups"))) ;dont leave ~'s




;;Moe custon
(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'case-label 2)
  ;; other customizations can go here
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun test_fun ()
(lambda() (interactive) (insert-string (buffer-name)))
)

(global-set-key "\M-M" '(test_fun))

(add-to-list 'load-path "~/.emacs.d/private")
(add-to-list 'load-path "~/.emacs.d/modes")
(load "cfn-mode")


;;Go stuff
;(defun my-go-mode-hook ()
  ; Call Gofmt before saving                                                    
;  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding                                                      
;  (local-set-key (kbd "M-.") 'godef-jump))
;(add-hook 'go-mode-hook 'my-go-mode-hook)

;(defun auto-complete-for-go ()
;  (auto-complete-mode 1))
;(add-hook 'go-mode-hook 'auto-complete-for-go)


;(with-eval-after-load 'go-mode
;  (require 'go-autocomplete))

;(setq-default indent-tabs-mode  nil)


;;(require 'protobuf-mode)
;;(defconst my-protobuf-style
;;  '((c-basic-offset . 2)
;;    (indent-tabs-mode . nil)))
;;(add-hook 'protobuf-mode-hook
;;  (lambda () (c-add-style "my-style" my-protobuf-style t)))

;;CEDET
;;(load-file "~/cedet/common/cedet.el")
;;(semantic-load-enable-excessive-code-helpers)
;;(global-semantic-idle-completions-mode 1)
;;(global-semantic-idle-scheduler-mode 1)
;;(global-semantic-idle-summary-mode 1)
;;(global-ede-mode 0)
;;(global-srecode-minor-mode 1)
;;(require 'semantic-ia)
;;(require 'semantic-gcc)
;;(require 'semanticdb-global)
;;(semanticdb-enable-gnu-global-databases 'c-mode)
;;(semanticdb-enable-gnu-global-databases 'c++-mode)
;;(semantic-add-system-include "/usr/local/include/boost" 'c++-mode)
;;(defun my-semantic-hook ()
;;  (imenu-add-to-menubar "TAGS"))
;;(add-hook 'semantic-init-hooks 'my-semantic-hook)
;;(require 'semanticdb)
;;(require 'semanticdb-ectag)
;;(global-semanticdb-minor-mode 1)
;;(semantic-load-enable-primary-exuberent-ctags-support)
;;(defun my-cedet-hook ()
;;  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
;;(add-hook 'c-mode-common-hook 'my-cedet-hook)


;;JS stuff
;(add-to-list 'load-path "~/.emacs.d/packages/web-beautify")

;(require 'web-beautify) ;; Not necessary if using ELPA package
;(eval-after-load 'js2-mode
;  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;(eval-after-load 'js
;  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

;(eval-after-load 'json-mode
;  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

;(eval-after-load 'sgml-mode
;  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

;(eval-after-load 'web-mode
;  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))

;(eval-after-load 'css-mode
;  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;(eval-after-load 'js2-mode
;  '(add-hook 'js2-mode-hook
;             (lambda ()
;               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;(eval-after-load 'js
;  '(add-hook 'js-mode-hook
;             (lambda ()
;               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;(eval-after-load 'json-mode
;  '(add-hook 'json-mode-hook
;             (lambda ()
;               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;(eval-after-load 'sgml-mode
;  '(add-hook 'html-mode-hook
;             (lambda ()
;               (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

;(eval-after-load 'web-mode
;  '(add-hook 'web-mode-hook
;             (lambda ()
;               (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

;(eval-after-load 'css-mode
;  '(add-hook 'css-mode-hook
;             (lambda ()
;               (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))


;(require 'auto-complete)
;(require 'auto-complete-config)
;(ac-config-default)
;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;(add-hook 'js-mode-hook 'js2-minor-mode)
;(add-hook 'js2-mode-hook 'ac-js2-setup-auto-complete-mode)
;(add-hook 'js2-mode-hook 'ac-js2-mode)
;(add-hook 'js-mode-hook (lambda () (tern-mode t)))
;(setq tern-command '("node" "~/sc/node_modules/tern/bin/tern"))
;(eval-after-load 'tern
;  '(progn
;     (require 'tern-auto-complete)
;     (tern-ac-setup)))
;(add-hook 'js2-mode-hook 'tern-mode)
;(add-hook 'js-mode-hook 'tern-mode)

;;yaml
(add-hook 'yaml-mode-hook
'(lambda ()
   (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

