; 1.12.rkt
#lang sicp

; Exercise 1.12: The following pattern of numbers is called Pascalâ€™s triangle.

;          1
;        1   1
;      1   2   1
;    1   3   3   1
;  1   4   6   4   1
;        . . .
; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascalâ€™s triangle by means of a recursive process.

(define (Pascal n m)
  (if (or (= m 0) (= m n))
      1
      (+ (Pascal (- n 1) (- m 1)) (Pascal (- n 1) m))))

(Pascal 4 2); 6