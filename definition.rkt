#lang racket
(define pie 3)
pie

(define (piece str)
  (substring str 0 pie ))
(piece "key lime")

piece ; this is a procedure

; A function definition can include multiple expressions for the function’s body.
; In that case, only the value of the last expression is returned when the function is called.
; The other expressions are evaluated only for some side-effect, such as printing.
(define (bake flavor)
  (printf "preheating oven...\n"); <- side-effect
  (string-append flavor " pie")) ; <- return
(bake "Apple")

; avoid side-effect
; one expression in the body

; no parenthesis around string-append flavor "jello"
; so they are 3 separate expressions instead of one function-call expression
; the expressions string-append and flavor are evaluated
; but the results are never used
; the result of the function is the result of the final expression "jello"
(define (nobake flavor)
  string-append flavor "jello")
(nobake "green")
