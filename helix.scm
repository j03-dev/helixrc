(require "helix/editor.scm")
(require (prefix-in helix. "helix/commands.scm"))
(require (prefix-in helix.static. "helix/static.scm"))

(provide git)
;;@doc
;; git command
(define (git . args)
  (define space " ")
  (let* ([formatted (apply format-args args)]
         [escaped (map shell-escape formatted)]
         [cmd (string-append "git" space (string-join escaped space))])
    (helix.run-shell-command cmd)))

(provide format-dx-project)
;;@doc
;; format dioxus project by running rustfmt and dx fmt
(define (format-dx-project)
  (define fmt_cmd (string-join (format-args '"rustfmt" "%" "&&" "dx" "fmt" "-f" "%") " "))
  (helix.run-shell-command fmt_cmd)
  (helix.reload))

(provide format-args)
;;@doc
;; replace % in argument by current path
(define (format-args . raw-args)
  (map (lambda (a)
        (cond
          [(equal? a "%") (current-path)]
          [(string? a) a]
          [else (value->string a)]))
    raw-args))

(provide current-path)
;;@doc
;; return current-path of the document
(define (current-path)
  (let* ([focus (editor-focus)]
         [focus-doc-id (editor->doc-id focus)])
    (editor-document->path focus-doc-id)))

(define (shell-escape s)
  (if (or (string-contains? s " ")
       (string-contains? s "'"))
    (string-append "'" s "'")
    s))

(provide helix-scm-open)
;;@doc
;; open helix.scm config file
(define (helix-scm-open)
  (helix.open (helix.static.get-helix-scm-path)))

(provide init-scm-open)
;;@doc
;; open init.scm config file
(define (init-scm-open)
  (helix.open (helix.static.get-init-scm-path)))
