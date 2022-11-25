; Owner and Vehicle Abstraction
(define (make-owner name age)
  (cons name (cons age nil)))

(define (get-name owner) (car owner))

(define (get-age owner) (car (cdr owner)))

(define (make-vehicle model year previous-owners)
  (cons model (cons year previous-owners)))

(define (get-model vehicle) (car vehicle))

(define (get-year vehicle) (car (cdr vehicle)))

(define (get-owners vehicle) (cdr (cdr vehicle)))

(define (older-vehicle vehicle1 vehicle2)
  (if (< (get-year vehicle1) (get-year vehicle2)) (get-model vehicle1) (get-model vehicle2))
  )

(define (new-owner vehicle owner) 
  (make-vehicle (get-model vehicle) (get-year vehicle) (cons owner (get-owners vehicle)))
  )

(define (owners-names vehicle) 
  (define (helper owners) 
    (if (null? owners) owners
      (cons (car (car owners)) (helper (cdr owners)))
      )
  )
  (helper (get-owners vehicle))
)

(define (split-at lst n) 
  (define (reverse res lst)
    (if (null? lst) res (reverse (cons (car lst) res) (cdr lst)))
    )
  (define (helper res lst n)
    (if (null? lst) (cons (reverse nil res) nil)
      (if (= n 0) 
        (cons (reverse nil res) lst)
        (helper (cons (car lst) res) (cdr lst) (- n 1))
        )
      )
    ) 
  (helper nil lst n)
  )

; Tree Abstraction
; Constructs tree given label and list of branches
(define (tree label branches)
  (cons label branches))

; Returns the label of the tree
(define (label t) (car t))

; Returns the list of branches of the given tree
(define (branches t) (cdr t))

; Returns #t if t is a leaf, #f otherwise
(define (is-leaf t) (null? (branches t)))

(define (filter-odd t) 
  (let ((l (if (even? (label t)) nil (label t)))
        (t_branches (branches t))
        ) 
    (if (is-leaf t) 
      (tree l t_branches)
      (tree l (map (lambda (b)(filter-odd b)) t_branches))
      )
    )
  )
