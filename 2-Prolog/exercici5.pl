% 5. Escribe un predicado fib(N,F) que signifique: “F es el N-ésimo número de Fibonacci para la N dada”. Estos números se definen ası́: fib(1) = 1, fib(2) = 1, y si N > 2 entonces fib(N ) = fib(N − 1) + fib(N − 2).
fib(0,R):-R is 0, !.
fib(1,R):-R is 1, !.
fib(N,R):-A is N - 1, B is N - 2, fib(A,F1), fib(B,F2), R is F1 + F2.