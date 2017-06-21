
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(org-export-backends (quote (ascii beamer html icalendar latex md))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0)))))
(package-initialize)
;; (setq package-enable-at-startup nil)

;; Always download my most recent config
;; (magit-pull git@github.com:rafaelleru/emacs_configuration.git )
(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bb956f275f1301213274ab14069f91a1ec6d23dbba3c263b7401895c1a0580e1" "fd6574d0acab3925147bbefb2a9c2e57a17df7aa009d3fce4ee1fb4d63548428" "6fc0ae7cc2abd82d8add1140874ccf8773feaaae73a704981d52fdf357341038" default)))
 '(package-selected-packages
   (quote
    (camcorder hydra dumb-jump danneskjold-theme elfeed-goodies elfeed-org ztree xcscope which-key web-mode virtualenv use-package undo-tree try solarized-theme smartparens shell-pop rtm rainbow-mode py-autopep8 projectile paradox ox-twbs ox-reveal org-sync org-gcal org-fstree org-bullets org-ac noflet neotree multiple-cursors molokai-theme mode-icons material-theme markdown-mode magit jdee htmlize hl-todo hexo helm-ls-git helm-google gotham-theme flymake-ruby flycheck-irony fic-mode expand-region engine-mode elpy elfeed counsel company-shell company-jedi company-irony-c-headers company-irony company-c-headers color-theme-solarized color-theme-sanityinc-solarized cmake-ide calfw blog-admin bison-mode auto-complete-clang ample-zen-theme ample-theme all-the-icons-dired afternoon-theme ace-window abyss-theme))))
