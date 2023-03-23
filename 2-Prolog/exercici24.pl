% 24. Given a graph declared as in the example below, write all its cliques of size at least minCliqueSize. Remember, a clique is a complete subgraph: a subset {textttS of the vertices such that for all U,V in S there is an edge U-V.

%%==== Example: ========================================================
numVertices(10).
minCliqueSize(4).
vertices(Vs):- numVertices(N), findall(I,between(1,N,I),Vs).
vertex(V):- vertices(Vs), member(V,Vs).
edge(U,V):- edge1(U,V).
edge(U,V):- edge1(V,U).
edge1(9,8).
edge1(8,2).
edge1(7,4).
edge1(5,7).
edge1(4,2).
edge1(5,2).
edge1(2,7).
edge1(7,9).
edge1(2,9).
edge1(4,8).
edge1(4,9).
edge1(9,5).
edge1(4,5).
%%==========================================================
main:- vertices(Vs), subconjunto(Vs, S), length(S,L), minCliqueSize(C), L >= C, isClique(S), write(S), nl, fail.
main:- halt.

isClique([]):-!.
isClique([X|S]):- pathsToAll(S,X), isClique(S).

pathsToAll([],_).
pathsToAll([X|L], Y):- edge(X,Y), pathsToAll(L,Y).

subconjunto([],[]):-!.
subconjunto([V|Vs], [V|S]):- subconjunto(Vs,S).
subconjunto([_|Vs], S):- subconjunto(Vs,S).