#lang sicp

; ----return the square of x----
(define (square x) (* x x))
; test expression:
; (square 5)

; ----return the absolute value of x----
(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))
; another definition of 'abs'
; (define (abs x)
;   (if (< x 0) (- x)
;   x))
; test expression:
; (abs -1)
; (abs 2)

