(define (tail-replicate x n)
  ; BEGIN
  (define (helper res x n)
    (if (= n 0)
      res
      (helper (cons x res) x (- n 1)))
  )
  (helper nil x n)
  ; END
)