% 4. Usando append, escribe un predicado para calcular el último elemento de una lista dada, y otro para calcular la lista inversa de una lista dada.
append(X,[],[X]):-!.
append(X,[Y|L],[Y|S]):-append(X,L,S).

invert([X|[]],[X]):-!.
invert([X|L],S):-invert(L,I), append(X,I,S).