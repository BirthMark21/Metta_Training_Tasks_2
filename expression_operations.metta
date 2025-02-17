

;; ========== Find the length of a list ==========

; Q4. Find the length of a list

(= (length ()) 0)
(= (length (:: $x $y)) (+ 1 (length $y)))

! (length (:: 1 (:: 2 (:: 3 (:: 4 ())))))  
; Output: [4]


;; ========== Convert a list to an expression ==========

; Q5. Convert a list to an expression

(= (extract-elements ()) ())
(= (extract-elements (:: $x $xs)) 
    (unify (extract-elements $xs) $rest
        (cons $x $rest)  
    )
)

! (extract-elements (:: 1 (:: 2 (:: 3 (:: 4 ())))))  
; Output: (1 2 3 4)

;; ==========  Find length of an expression ==========

; Q6. Find length of an expression


(= (length-expr ()) 0)
(= (length-expr (:: $x $y)) (+ 1 (length-expr $y)))

! (length-expr (:: A (:: B (:: C ()))))  
; Output: 3

;; ==========  Sum first elements of two expressions ==========
; Q7. Sum first elements of two expressions

(= (sum-expr $expr1 $expr2) 
    (+ (car-atom $expr1) (car-atom $expr2))
)

! (sum-expr (1 2 3) (4 5 6))  
; Output: 5
