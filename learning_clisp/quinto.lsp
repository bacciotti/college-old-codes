	(defun quinto (L)
	(print "A lista fornecida para o teste foi: ")
	(write L)
	(print "Letra A - O terceiro elemento da Lista: ")
	(write (terceiro L))
	(print "Letra B - O primeiro elemento da lista : ")
	(write (primeiro L))
	(print "Letra C - A média aritmética : ")
	(write (media L))
	(print "Letra D - O penultimo elemento da Lista : ")
	(write (penultimo L))
	'Fim
)

(defun terceiro (L)
	(cond
		((> (length l) 2) (nth 2 L))
		(T "Lista vazia ou com número de elementos inferior a 3")
	)
)

(defun primeiro (L)
	(cond
		((> (length l) 0) (car L))
		(T "Lista vazia ou com número de elementos inferior a 1")
	)
)	

(defun media (L)
	(/ (soma L) (length L))
)

(defun soma (L)
	(cond
		((null L) 0)
		(T (+ (car L) (soma (cdr l))))
	)
)
(defun penultimo (L)
	(cond
		((> (length l) 1) (car(cdr(reverse L))))
		(T "Lista vazia ou com número de elementos inferior a 1")
	)
)

(defun sexto ( X N)
	(cond
		((< N 1) 'erro)
		((equal N 1) (/ ( + X N) (fat 1)))
		(T (+ (/ (+ X N) (fat N)) (sexto X ( - n 1))))
	)
)

(defun fat (K)
	(cond
		((< K 0) 'erro)
		((equal K 0) 1)
		(T ( * K (fat (- K 1))))
	)
)