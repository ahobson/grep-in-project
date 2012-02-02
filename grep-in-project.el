;;
(defvar grep-in-project-history nil "History list for grep-in-project")

(defun grep-in-project (regexp)
  "Run grep on files in the current project root."
  (interactive
   (list (read-string "Regexp: " "" 'grep-in-project-history)))
  (compilation-start (format "find %s -type f \\( %s \\) %s | xargs grep -nH -e %s"
                             (or ffip-project-root
                                 (ffip-project-root)
                                 (error "No project root found"))
                             (ffip-join-patterns)
                             ffip-find-options
                             regexp)
                     'grep-mode))
(provide 'grep-in-project)
