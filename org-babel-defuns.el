(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (ruby . t)
   (latex . t)
   (haskell . t)
   (clojure . t)))

(setq org-src-window-setup 'current-window)
(setq org-confirm-babel-evaluate nil)
(setq org-src-fontify-natively t)

(setq org-babel-default-header-args:clojure
      '((:results . "silent") (:tangle . "yes")))

(setq org-publish-project-alist
      '(
        ("org-samritchie"
         ;; Path to your org files.
         :base-directory "~/sritchie.github.com/org/"
         :base-extension "org"

         ;; Path to your Jekyll project.
         :publishing-directory "~/sritchie.github.com/"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t ;; Only export section between <body> </body>
         :exclude "_drafts/*")

        ("org-static-sam"
         :base-directory "~/sritchie.github.com/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
         :publishing-directory "~/sritchie.github.com/"
         :recursive t
         :publishing-function org-publish-attachment)

        ("sam" :components ("org-samritchie" "org-static-sam"))))

(provide 'org-babel-defuns)
