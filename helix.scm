(require "helix/editor.scm")
(require (prefix-in helix. "helix/commands.scm"))
(require (prefix-in helix.static. "helix/static.scm"))

(provide shell git-add git-push git-pull git-commit open-helix-scm open-init-scm)

(define (current-path)
  (let* ([focus (editor-focus)]
         [focus-doc-id (editor->doc-id focus)])
    (editor-document->path focus-doc-id)))

;;@doc
;; Specialized shell implementation, where % is a wildcard for the current file
(define (shell . args)
  (helix.run-shell-command
    (string-join
      ;; Replace the % with the current file
      (map (lambda (x) (if (equal? x "%") (current-path) x)) args)
      " ")))

;;@doc
;; Add current file contents to the index
(define (git-add)
  (shell "git" "add" "%"))

;;@doc
;; Record changes to the repository
(define (git-commit . msg)
  (shell "git" "commit" "-m" (string-join msg " ")))

;;@doc
;; Update remote refs along with associated objects
(define (git-push)
  (helix.run-shell-command "git push"))

;;@doc
;; Fetch from and integrate with another repository or a local branch
(define (git-pull)
  (helix.run-shell-command "git pull"))

;;@doc
;; Open the helix.scm file
(define (open-helix-scm)
  (helix.open (helix.static.get-helix-scm-path)))

;;@doc
;; Opens the init.scm file
(define (open-init-scm)
  (helix.open (helix.static.get-init-scm-path)))
