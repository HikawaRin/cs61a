(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (make it cnt)
    (if (null? it) 
      it
      (cons (cons cnt (cons (car it) nil)) (make (cdr it) (+ cnt 1))))
    )
  (make s 0)
  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to ORDERED? and return
;; the merged lists.
(define (merge ordered? list1 list2)
  ; BEGIN PROBLEM 16
  (cond ((null? list1) list2)
        ((null? list2) list1)
        (else
          (let ((item (if (ordered? (car list1) (car list2))
                        (car list1)
                        (car list2)
                        )
                  )
                )
                (let ((list1 (if (= item (car list1)) 
                                (cdr list1)
                                list1
                                )
                        )
                      (list2 (if (= item (car list2)) 
                                (cdr list2)
                                list2
                                )
                        ))
                  (cons item (merge ordered? list1 list2))
                  )
            )
          )
    )
  )
  ; END PROBLEM 16

