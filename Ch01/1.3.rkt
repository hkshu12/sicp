; 1.3.rkt
#lang sicp

; Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (square x) (* x x))
(define (f x y z)
        (if (and (< x y) (< x z))
             (+ (square y) (square z))
             (f y z x)))

(f 2 1 3) ; 13