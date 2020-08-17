(define (i2a n)
  (if (<= 33 n 126)
    (integer->char n)
    0))
