(menu-bar-mode -1)
(hl-line-mode t)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(column-number-mode t)
(line-number-mode t)
(evil-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(deftheme ians  "My own Emacs color theme")
(let ((class '((class color) (min-colors 8))))
  (custom-theme-set-faces
   'ians
   ;normal stuff
   `(default ((,class (:background "darkblack"))))
   `(cursor ((,class (:background "green" :forefround "green"))))
   `(fringe ((,class (:background "none" :foreground "green"))))
   ; special stuff
   `(font-lock-builtin-face ((,class (:foreground "green"))))
   `(font-lock-constant-face ((,class (:foreground "cyan"))))
   `(font-lock-keyword-face ((,class (:foreground "brightred"))))
   `(font-lock-string-face ((,class (:foreground "white"))))
   `(font-lock-comment-face ((,class (:foreground "white"))))
   `(font-lock-warning-face ((,class (:foreground "red"))))
   `(font-lock-number-face ((,class (:foreground "red"))))
   `(font-lock-type-face ((,class (:foreground "yellow"))))
   `(font-lock-variable-name-face ((,class (:foreground "yellow"))))
   `(font-lock-function-name-face ((,class (:foreground "green"))))
   `(font-lock-constant-face ((,class (:foreground "yellow"))))
   `(font-lock-warning-face ((,class (:foreground "red"))))))
(provide-theme 'ians)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-to-list 'auto-mode-alist '("\\.eliom\\'" . tuareg-mode))
(add-hook 'go-mode-hook
  (lambda ()
    (setq-default)
    (setq tab-width 2)
    (setq standard-indent 2)
    (setq indent-tabs-mode nil)))
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
;; configuration merlin
(setq opam-share
      (substring
       (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; ;; Load merlin-mode
(require 'merlin)
(require 'company)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
;; (setq merlin-use-auto-complete-mode 'easy)
;; Make company aware of merlin
(with-eval-after-load 'company
  (add-to-list 'company-backends 'merlin-company-backend))
;; (add-to-list 'company-backends 'merlin-company-backend)
;; Enable company on merlin managed buffers
(add-hook 'merlin-mode-hook 'company-mode)
(setq merlin-completion-with-doc t)
(setq company-quickhelp-mode t)
;; Or enable it globally:
;; (add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-o") 'company-complete)
;; (setq merlin-use-auto-complete-mode 't)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)
(setq merlin-locate-preference 'ml)
;; ocp-indent
(require 'ocp-indent)

(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; (setq ocp-indent-path "~/.opam/4.02.0/bin/ocp-indent")

;; Setup environment variables using opam
(dolist
    (var
     (car
      (read-from-string (shell-command-to-string "opam config env --sexp"))))
  (setenv (car var) (cadr var)))

(require 'server)
(unless (server-running-p)
  (server-start))

(global-set-key (kbd "M-o") 'company-complete)
