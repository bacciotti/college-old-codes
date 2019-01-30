(defun remover(L)
	(remove 1 L )
)

(defun reverter(L)
	(reverse L)
)

(defun comprimento(L)
	(length L)
)

(defun ultimo(L)
	(last L)
)

(defun enesimo(L)
	(nth 2 L)
)

(defun impar (L)
	(cond
	((oddp(car L)) (cdr L))
	(t(cdr L))

))