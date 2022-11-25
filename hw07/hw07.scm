(define (cadr lst) (car (cdr lst)))

(define (make-kwlist1 keys values)
  (cons keys (cons values nil))
  )

(define (get-keys-kwlist1 kwlist) (car kwlist))

(define (get-values-kwlist1 kwlist) (cadr kwlist))  

(define (make-kwlist2 keys values)
  (if (null? keys) keys
    (cons (cons (car keys) (cons (car values) nil)) (make-kwlist2 (cdr keys) (cdr values)))
    )
  )

(define (get-keys-kwlist2 kwlist) 
  (if (null? kwlist) kwlist
    (cons (car (car kwlist)) (get-keys-kwlist2 (cdr kwlist)))
    )
  )

(define (get-values-kwlist2 kwlist)
  (if (null? kwlist) kwlist
    (cons (cadr (car kwlist)) (get-values-kwlist2 (cdr kwlist)))
    )
  )

(define (my_append lst val)
  (if (null? lst) (cons val nil)
    (cons (car lst) (my_append (cdr lst) val))
    )
  )

(define (add-to-kwlist kwlist key value) 
  (make-kwlist (my_append (get-keys-kwlist kwlist) key) (my_append (get-values-kwlist kwlist) value))
  )

(define (get-first-from-kwlist kwlist key)
  (define (helper keys values key)
    (if (null? keys) keys
      (if (equal? (car keys) key) (car values)
        (helper (cdr keys) (cdr values) key)
        )
      )
    )
    (helper (get-keys-kwlist kwlist) (get-values-kwlist kwlist) key)
  )
