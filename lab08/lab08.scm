; Q3 using if
; (define (over-or-under num1 num2) 
;     (if (> num1 num2) 
;     1
;     (if (= num1 num2)
;     0
;     -1))
; )

; Q3 using cond
(define (over-or-under num1 num2) 
    (cond 
        ((> num1 num2) 1)
        ((= num1 num2) 0)
        (else -1)
    )
)

(define (composed f g) 
    (lambda (x) (f (g x)))
)

(define (square n) (* n n))

(define (pow base exp) 
    (if (= exp 0) 
    1
    (if (= exp 1)
        base
    (if (= (modulo exp 2) 1)
        (* base (pow (* base base) (/ (- exp 1) 2)))
        (pow (* base base) (/ exp 2))
    )))
)

(define (ascending? lst) 
    (or 
        (null? (cdr lst)) 
        (and 
            (not (> (car lst) (car (cdr lst))))
            (ascending? (cdr lst))
        )
    )
)
