% 1. Escribe un predicado prod(L,P) que signifique: “P es el producto de los elementos de la lista de enteros dada L”. Debe poder generar la P y también comprobar una P dada.
prod([],1).
prod([X|L],R):-prod(L,S), R is X*S.