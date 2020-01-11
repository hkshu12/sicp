; 1.7.rkt
#lang sicp

; Exercise 1.7: The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

(define (sqrt-iter guess x)
  (if (new-good-enough-3? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (/ ( + guess (/ x guess)) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1 x))

; (sqrt 0.0001)
; 0.03230844833048122, when it is so small that its root is less than 0.001, it will give a wrong answer

; (sqrt 10000000000)
; It might be an infinite iteration, because in computers, large numbers are usually expressed by float point numbers which can not tell a small difference between two large numbers.

; new procedure, the precision is linear related to x.
(define (new-good-enough-1? guess x)
  (< (abs (- (* guess guess) x)) (* 0.001 x)))

; This good-enough? provides a higher precision of guess.
(define (new-good-enough-2? guess x)
  (< (abs (- (* guess guess) x)) (* 0.001 guess)))

; Someone raises up another solution which will stop when guess cannot be refined, but I still get infinite iterations here when the given number is too large (or I was just not waiting for a enough long time XD).
(define (new-good-enough-3? guess x)
  (= guess (improve guess x)))

  (sqrt 0.0001)
  (sqrt 100000000)