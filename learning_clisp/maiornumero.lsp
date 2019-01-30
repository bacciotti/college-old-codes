

(defun maior(l)
	(cond
	((null L) 0)
	(  (> (car L) (maior (cdr L)))   (car L))
	(T (maior (cdr L)))
))




