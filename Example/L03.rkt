#lang sicp
(#%require simply-scheme)

(define (evens nums)
  (cond ((empty? nums) '())
        ((= (remainder (first nums) 2) 0)
         (se (first nums) (evens (bf nums))))
        (else (evens (bf nums)))))

(define (ewords wds)
  (cond ((empty? wds) '())
        ((member? 'e (first wds))
         (se (first wds) (ewords (bf wds))))
        (else (ewords (bf wds)))))

(define (keep PRED sent)
  (cond ((empty? sent) '())
        ((PRED (first sent))
         (se (first sent) (keep PRED (bf sent))))
        (else (keep PRED (bf sent)))))

(define (eword? wd)
  (member? 'e wd))
