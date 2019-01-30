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

(defun pergunta (Nome)
	(exercicio '((Moises 2000 70  150)(Thiago 23 42 120)(BRUNO 22 18 60)(CARLOS 17 33 76)) NOME)
	 "Fimmmmmm"
)	
	
(defun exercicio ( l Nome)
	(cond
		((NULL L) "NÃO TENHO DADOS DESSA PESSOA")
		((equal (car (car L)) Nome) (imprima (car L)))
		(T (exercicio (Cdr l) nome))
	)
)

(defun imprima (L)
	(print "Nome: ") (write (nth 0 l))
	(print "Idade: ") (write (nth 1 l))
	(print "Calçado: ") (write (nth 2 l))
	(print "Cintura: ") (write(nth 3 l))
)

(defun gera_sub(l)
		(cond
		((null l) '())
		((equal (length l) 1) (cons (cons (car l) '()) (gera2 (cdr l))))
		(T(cons (cons (car l) (cons (car (cdr l)) '())) (gera2 (cdr(cdr l)))))
	)
)

(defun conta99 (l)
	(cond
		((null l) 0)
		((evenp (car l)) (+ 1 (conta99 (cdr l))))
		(T (conta99 (cdr l)))
	)
)

(defun soma99 (l)
	(cond
		((null l) 0)
		((evenp (car l)) (+ (car l) (soma99 (cdr l))))
		(T (SOMA99 (cdr l)))
	)
)

(defun media99 (l)
	(/ (soma99 l) (conta99 l))
)


(defun contaPAR (N l)
	(cond
		((null l) 0)
		((evenp N)  (+ 1 (contaPAR (+ 1 N) (cdr l))))
		(T (contaPAR  (+ 1 N) (cdr l)))
	)
)

(defun somaPAR ( N l)
	(cond
		((null l) 0)
		((EVENP N) (+ (car l) (somaPAR (+ 1 N)(cdr l))))
		(T (SOMAPAR (+ 1 N)(cdr l)))
	)
)

(defun mediaPAR (l)
	(/ (somaPAR 1 l) (contaPAR 1 l))
)