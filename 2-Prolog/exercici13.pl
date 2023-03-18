% 13. Escribe un predicado palindromos(L) que, dada una lista de letras L, escriba todas las permutaciones de sus elementos que sean palı́ndromos (capicúas). Por ejemplo, con la consulta palindromos([a,a,c,c]) se escribe [a,c,c,a] y [c,a,a,c].
palindromos(L):-permutation(L,S), invert(S,S2), S=S2, write(S2).

append(X,[],[X]):-!.
append(X,[Y|L],[Y|S]):-append(X,L,S).

invert([],[]):-!.
invert([X|L],S):-invert(L,I), append(X,I,S).