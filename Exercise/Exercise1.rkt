#lang sicp
;exercise 1.3
;(#%require lazy) ;for normal order evaluation but is not normal order evaluation 

(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
;applicative order evaluation will give infinite loop as operends are evaluted first
;causing p to reference itself infinitly
;normal order evaluation will give zero as it uses call-by-need

;exercise 1.2
(define (square x)
  (* x x))

(define (sum-of-squares a b c)
  (if (> a b)
      (if (> b c)
          (+ (square a) (square b))
          (+ (square a) (square c)))
      (if (> a c)
          (+ (square b) (square a))
          (+ (square b) (square c)))))

(define (zero x) (- x x))

;exercise 1.6
;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x)
;                  x)))

;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (good-enough? guess old-guess)
  (< (abs (- guess old-guess)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1 0 x))

(define (new-if predicate then-statement else-statement)
  (cond (predicate  then-statement)
        (else else-statement)))