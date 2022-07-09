#lang racket
(define (twice func y)
  (func (func y)))
(twice sqrt 16)
(twice abs -3)

; normal function
(define (louder s)
  (string-append s "!"))
(twice louder "hello")

; with lambda
; replace tine louder procedure with lambda function
(twice (lambda (s) (string-append s "!"))
       "hello")
(twice (lambda (s) (string-append s "!?"))
       "hello")

; Another use of lambda is as a result for a function that generates functions:
(define (make-add-suffix s2)
  (lambda (s) (string-append s s2)))

(twice (make-add-suffix "!") "hello")
(twice (make-add-suffix "?!") "hello")
(twice (make-add-suffix "...") "hello")
(printf "\n")

; the lambda-generated function “remembers” the right s2
(define louder2 (make-add-suffix "!"))
(twice louder2 "really")
(define less-sure (make-add-suffix "?"))
(twice less-sure "really")
