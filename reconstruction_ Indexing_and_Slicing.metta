

;; ==========  Select element by index ==========

; Q8. Select element by index

(= (select-index (:: $x $xs) 0) $x)  
(= (select-index (:: _ $xs) $idx) (select-index $xs (- $idx 1))) 

! (select-index (:: 1 (:: 3 (:: 4 ()))) 0)  
; Output: [1]



;; ==========  Slice an expression by index ==========

; Q9. Slice an expression by index

(= (slice-expr () $start $end) ())
(= (slice-expr $lst 0 $end) (slice-helper $lst $end))
(= (slice-expr (:: $x $xs) $start $end)
    (if (> $start 0)
        (slice-expr $xs (- $start 1) $end)
        (slice-helper (:: $x $xs) $end)
    )
)

(= (slice-helper () $end) ())
(= (slice-helper (:: $x $xs) $end)
    (if (> $end 0)
        (:: $x (slice-helper $xs (- $end 1)))
        ()
    )
)

! (slice-expr (:: A (:: B (:: C (:: D (:: E (:: F ())))))) 2 5)  
; Output: (B C D E)


;; ==========  Reconstructing an expression ==========

; Q10. Reconstruct expression and print elements
(= (reconstruct-expr $lst)
    (unify $lst
        (:: $a $b)
        (do
            (println! $a)
            (reconstruct-expr $b)
        )
        ($lst)
    )
)

! (reconstruct-expr (B 4 5 3))  
; Output: (B 4 5 3)

(= (reconstruct $e)
   (println! (car-atom $e))  ;; Print first element
   (println! (cdr-atom $e))  ;; Print remaining list
   (println! (cons-atom (car-atom $e) (cdr-atom $e)))) ;; Reconstruct list

;;  Example
! (reconstruct (B 4 5 3))

;; Output:
;; B
;; (4 5 3)
;; (B 4 5 3)
