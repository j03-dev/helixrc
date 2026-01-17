(require "helix/editor.scm")
(require (prefix-in helix. "helix/commands.scm"))
<<<<<<< HEAD
=======
(require (prefix-in helix.static. "helix/static.scm"))
>>>>>>> parent of 4a03ba8... format the code and add formater for schema

(provide git)

(define (git . args)
  (let* ([formatted (apply format-args args)]
         [escaped (map shell-escape formatted)]
         [cmd (string-append "git " (string-join escaped " "))])
<<<<<<< HEAD
    (helix.run-shell-command cmd))
  (helix.reload (current-path)))
=======
    (helix.run-shell-command cmd)))
>>>>>>> parent of 4a03ba8... format the code and add formater for schema

(define (format-args . raw-args)
  (map (lambda (a)
        (cond
          [(equal? a "%") (current-path)]
          [(string? a) a]
          [else (value->string a)]))
    raw-args))

(define (current-path)
  (let* ([focus (editor-focus)]
         [focus-doc-id (editor->doc-id focus)])
    (editor-document->path focus-doc-id)))

(define (shell-escape s)
  (if (or (string-contains? s " ")
       (string-contains? s "'"))
    (string-append "'" s "'")
    s))
