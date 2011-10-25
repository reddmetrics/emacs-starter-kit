;; Copyright (c) 2010 Charles Cave
;;
;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use,
;; copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the
;; Software is furnished to do so, subject to the following
;; conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
;; OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
;; HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
;; WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
;; OTHER DEALINGS IN THE SOFTWARE.

;; .emacs file     Selected entries from ~/.emacs.el
;; file of Charles Cave to run org-mode
;; Modified by Sam Ritchie, 2010, uploaded to GitHub

;; Tweaked from custom set variables
(setq org-agenda-files (quote ("~/org/GTD/gtd.org")))
(setq org-agenda-ndays 7)
(setq org-agenda-repeating-timestamp-show-all nil)
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-todo-ignore-deadlines t)
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-ignore-with-date t)
(setq org-agenda-window-setup (quote other-window))
(setq org-deadline-warning-days 7)
(setq org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyles.css\">")
(setq org-fast-tag-selection-single-key nil)
(setq org-log-done (quote (done)))
(setq org-refile-targets (quote (("gtd.org" :maxlevel . 1) ("someday.org" :level . 2))))
(setq org-reverse-note-order nil)
(setq org-tags-column -78)
(setq org-tags-match-list-sublevels nil)
(setq org-use-fast-todo-selection t)
(setq org-use-tag-inheritance nil)


;; Keybindings for org-mode
;;(define-key org-mode-ma (kbd "<C-return>") 'org-insert-heading-respect-content)

;; Remember mode stuff
(org-remember-insinuate)
(setq org-directory "~/org")

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")

(setq org-default-notes-file (concat org-directory "/GTD/journal.org"))

;; (define-key global-map "\C-cr" 'org-remember)

;; Set the default tab width. Not sure if I like this.
(setq-default tab-width 3)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done nil)
(setq org-agenda-include-diary nil)
(setq org-deadline-warning-days 7)
(setq org-timeline-show-empty-dates t)
(setq org-insert-mode-line-in-empty-file t)

;; Hides depends tasks in agenda view. C-c C-x o add the ordered property to a project.
(setq org-enforce-todo-dependencies t)
(setq org-agenda-dim-blocked-tasks 'invisible)
(setq org-enforce-todo-checkbox-dependencies t)

;;
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

(setq org-remember-templates
      '(
        ("Agenda" ?a "* TODO %^{Brief Description} :AGENDA:%^g\n%?Added: %U" "~/org/GTD/gtd.org" "Inbox")
        ("Todo" ?t "* TODO %^{Brief Description} %^g\n%?Added: %U" "~/org/GTD/gtd.org" "Inbox")
        ("Calendar" ?c "* %^{Brief Description} %^{Date}t\n%?Added: %U" "~/org/GTD/gtd.org" "Calendar Inbox")
        ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "~/org/GTD/privnotes.org")
        ))

(define-key global-map [f9] 'remember)
(define-key global-map [f10] 'remember-region)

(setq org-agenda-exporter-settings
      '((ps-number-of-columns 1)
        (ps-landscape-mode t)
        (htmlize-output-type 'css)))

;; org stuck projects settings
(setq org-stuck-projects
      (quote
       ("+PROJECT/-DONE-CANCELLED" nil ("NEXT" "TODO" "STARTED" "WAITING" "APPT") "")
       ))

;; there is, of course, a far better way to do this, I just don't know it yet
(setq org-agenda-custom-commands
      '(
        
        ("W" "Office & Work Lists"
         ((agenda "" ((org-agenda-ndays 1)))
          (tags-todo "EMACS"
                     ((org-agenda-skip-function
                       (quote
                        (org-agenda-skip-entry-if 'scheduled 'deadline))
                       )))  
          (tags-todo "XCODE"
                     ((org-agenda-skip-function
                       (quote
                        (org-agenda-skip-entry-if 'scheduled 'deadline)))))  
          (tags-todo "COMPUTER" ((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadline))))) 
          (tags-todo "ONLINE"((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadline)))))))


        ("H" "Home List"
         ((agenda "" ((org-agenda-ndays 1)))
          (tags-todo "HOME" ((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadline)))))
          (tags-todo "COMPUTER"((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadline)))))
          (tags-todo "ONLINE"((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadline)))))
          (tags-todo "READING" ((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadline)))))
          (tags-todo "WATCH" ((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadline)))))))

        ("T" "Personal Interactions"
         ((agenda "" ((org-agenda-ndays 1)))
          (tags-todo "AGENDA"((org-agenda-sorting-strategy
                               (quote ((agenda time-up priority-down tag-up) )))
                              (org-agenda-skip-function
                               (quote (org-agenda-skip-entry-if 'scheduled 'deadline)))))
          (tags-todo "PHONE"((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadlie)))))
          (tags-todo "EMAIL"((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadline)))))
          (todo "WAITING")))

        ("E" "Errands"
         ((tags-todo "ERRANDS"((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadline)))))
          (tags-todo "PHONE")  
          (tags-todo "VIRGINIA"((org-agenda-skip-function (quote (org-agenda-skip-entry-if 'scheduled 'deadline)))))
          (tags-todo "ONLINE"
                     ((org-agenda-skip-function
                       (quote
                        (org-agenda-skip-entry-if 'scheduled 'deadline))
                       )))))

        ("D" "Daily Action List"
         (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)
                      ))))

        ("A" "Tasks to be Archived" tags "LEVEL=2/DONE|CANCELLED" nil)

        ("P" "Printed agenda"
         ((agenda "" ((org-agenda-ndays 7) ;; overview of appointments
                      (org-agenda-start-on-weekday nil) ;; calendar begins today
                      (org-agenda-repeating-timestamp-show-all t)
                      (org-agenda-entry-types '(:timestamp :sexp))))
          (agenda "" ((org-agenda-ndays 1) ;; daily agenda
                      (org-deadline-warning-days 7) ;; 7 day advanced warning for deadlines
                      (org-agenda-sorting-strategy '(tag-up priority-down))              
                      (org-agenda-todo-keyword-format "[ ]")
                      (org-agenda-scheduled-leaders '("" ""))
                      (org-agenda-prefix-format "%t%s")))
          
          (todo "TODO" ;; todos sorted by context
                ((org-agenda-prefix-format "[ ]:")
                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))
                 (org-agenda-sorting-strategy '(tag-up priority-down))
                 (org-agenda-todo-keyword-format "")
                 (org-agenda-overriding-header "\nTasks by Context\n------------------\n"))))
         ((org-agenda-with-colors nil)
          (org-agenda-compact-blocks t))
         ("~/agenda.html"))
        ))

(defun gtd ()
  (interactive)
  (find-file "~/org/GTD/gtd.org"))

(global-set-key (kbd "C-c g") 'gtd)

(add-hook 'org-agenda-mode-hook 'hl-line-mode)

                                        ; org mode start - added 20 Feb 2006
;; The following lines are always needed. Choose your own keys.

(global-set-key "\C-x\C-r" 'prefix-region)
(global-set-key "\C-x\C-l" 'goto-line)
(global-set-key "\C-x\C-y" 'copy-region-as-kill)
