% 21. Escribe un predicado Prolog log(B,N,L) que calcula la parte entera L del logaritmo en base B de N, donde B y N son naturales positivos dados. Por ejemplo, ?- log(2,1020,L). escribe L=9? Podéis usar la exponenciación, como en 125 is 5**3. El programa (completo) no debe ocupar más de 3 lineas.

log(B,N,0):- B > N, !.
log(B,N,L):- N2 is N/B, log(B, N2, L2), L is L2 + 1.