
 ;; ==========  Bonus  ==========

(= (insert-node $node $lst $pos)
    (unify $pos 0
        ;; Case when position is 0: insert node at the beginning
        (:: $node $lst)
        ;; Case when position is greater than 0
        (unify $lst
            ;; If the list is empty, insert node as the only element
            ()
            (:: $node ())
            ;; If the list is not empty, recursively insert into the tail
            (:: $head $tail)
            (let $new-tail (insert-node $node $tail (- $pos 1))
                (:: $head $new-tail))
        )
    )
)

! (insert-node D (:: A (:: B (:: C ())))) 2)
;; Expected Output  (:: A (:: B (:: D (:: C ()))))

