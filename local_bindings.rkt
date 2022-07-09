#lang racket
; ( define ( ‹id› ‹id›* ) ‹definition›* ‹expr›+ )
; ( lambda ( ‹id›* ) ‹definition›* ‹expr›+ )

(define (converse s)
  (define (starts? s2) ; local to converse
    (define spaced-s2 (string-append s2 " "))
    (string-prefix? s spaced-s2))
  (cond
    [(starts? "hello") "hi!"]
    [(starts? "goodbye") "bye!"]
    [else "huh?"]))

(converse "hello world")
(converse "helloearth")
(printf "\n")

; let binds many identifiers at once
(let ([x (random 4)]
      [o (random 4)])
  (cond
    [(> x o) "X wins"]
    [(> o x) "O wins"]
    [else "cat's game"]))
(printf "\n")

; let* form allows later clauses to use earlier bindings
(let* ([x (random 4)]
       [o (random 4)]
       [diff (number->string (abs (- x o)))])
  (cond
    [(> x o) (string-append "X wins by " diff)]
    [(> o x) (string-append "O wins by " diff)]
    [else "cat's game"]))
