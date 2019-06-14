(define (accumulate combiner start n term)
  (if (= n 0) start
  	(combiner (accumulate combiner start (- n 1) term) (term n)))
)

(define (accumulate-tail combiner start n term)
  (if (= n 0) start
  	(accumulate-tail combiner (combiner start (term n)) (- n 1) term))
)

(define (rle s)
  (define (helper element stream len)
  	(cond ((null? stream) (cons-stream (list element len) nil))
  		((= element (car stream)) (helper element (cdr-stream stream) (+ len 1)))
  		(else (cons-stream (list element len) (rle stream)))))



  (if (null? s) nil
  (helper (car s) (cdr-stream s) 1)))
