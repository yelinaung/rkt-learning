#lang racket

; a list usually prints with `
(list "red" "green" "blue")

(length (list "red" "green" "blue")) ; count the elements

(list-ref (list "hop" "skip" "jump") 0) ; extract by position

(list-ref (list "hop" "skip" "jump") 1) ; extract by position

(append (list "hop" "skip") (list "jump")) ; combine the list

(reverse (list 1 2 3))

(member "fall" (list "hop" "skip" "jump")) ; check for an element

(if (member 1 (list 1 2 3))
  "1 is the member!"
  "nope")

; predefine list loops
; (map proc lst ...+) → list?
;   proc : procedure?
;   lst : list?
; "map" applies the "proc" to the elements of the lsts
; from the first element to the last
(map sqrt (list 1 4 9 16))
(printf "\n")

(map (lambda (number)
       (+ 1 number))
       '(1 2 3 4))
(printf "\n")

(map (lambda (i)
       (string-append i "!"))
     (list "peanut" "popcorn" "crackerjack"))
(printf "\n")

; The andmap and ormap functions combine the results by anding or oring:
(andmap string? (list "a" "b" "c"))
(andmap string? (list "a" "b" 6))
(ormap number? (list "a" "b" 6))

; handling multiple list
; all lists must have the same length
(map (lambda (n1 n2)
       (+ n1 n2))
     (list 1 2 3 4)
     (list 10 100 1000 10000))
(printf "\n")

(map (lambda (n1 n2)
       (substring n1 0 n2))
     (list "peanuts" "popcorn" "crackerjack")
     (list 6 3 7))
(printf "\n")

; filter keeps elements for which the body result is true
; discard elements for which it is #f
(filter string? (list "a" "b" 7))
(filter number? (list "a" "b" 7))
(filter positive? (list 1 2 7 -3 3 -7))
