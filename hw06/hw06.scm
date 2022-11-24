(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cdr (cdr s))))

(define (interleave lst1 lst2) 
  (cond ((null? lst1) lst2)
        ((null? lst2) lst1)
        (else (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2))))
          )
    )
  )

(define (my-filter pred lst) 
  (if (null? lst) lst
    (let ((rst (my-filter pred (cdr lst)))
          ) 
          (if (pred (car lst)) (cons (car lst) rst) 
            rst
            )
      )
    )
  )

(define (concatenate s) 
  (define (helper res lst)
    (if (null? lst) res
      (if (list? (car lst)) (helper (helper res (car lst)) (cdr lst))
        (helper (cons (car lst) res) (cdr lst))
        )
      )
    )
  (define (resverse res lst)
    (if (null? lst) res
      (resverse (cons (car lst) res) (cdr lst))
      )
    )
  (resverse nil (helper nil s))
  )
