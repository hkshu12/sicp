; 1.22.rkt
#lang sicp

; Exercise 1.22: Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime)
                       start-time))
      #f))
(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))
; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of Θ(n⎯⎯√), you should expect that testing for primes around 10,000 should take about 10⎯⎯⎯⎯√ times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the Θ(n⎯⎯√) prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test)
  (cond ((> (* test test) n) n)
        ((= (remainder n test) 0) test)
        (else (find-divisor n (+ 1 test)))))

(define (search-for-primes n)
  (define (search-iter n count)
    (cond ((> count 2) (newline) (display "finish"))
          ((timed-prime-test n) (search-iter (+ 2 n) (+ 1 count)))
          (else (search-iter (+ 2 n) count))))
  (search-iter (if(odd? n) n (+ 1 n)) 0)
)

(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)
(search-for-primes 1000000)

; Here I've made some changes to the procedure timed-prime-test so that it returns true when n is prime and false when n is not prime.