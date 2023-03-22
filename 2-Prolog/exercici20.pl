% 20. Write in Prolog a predicate flatten(L,F) that “flattens” (cast.: “aplana”) the list F as in the example: ?-flatten( [a,b,[c,[d],e,[]],f,[g,h]], F ). F=[a,b,c,d,e,f,g,h]?

flatten([],[]):-!.
flatten([X|L],F):- flatten(X,Y), flatten(L,Z), append(Y,Z,F), !.
flatten(X,[X]):-!.