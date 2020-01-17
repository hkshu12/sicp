; 1.25.rkt
#lang sicp

; Exercise 1.25: Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already know how to compute exponentials, we could have simply written

; (define (expmod base exp m)
;   (remainder (fast-expt base exp) m))
; Is she correct? Would this procedure serve as well for our fast prime tester? Explain.

; She's wrong because this procedure will consume much more time than ours when input base & exp is large. It will immediately calculate the result of base^exp which is a large number rather than keep the numbers in the iterations small as what our procedure does.