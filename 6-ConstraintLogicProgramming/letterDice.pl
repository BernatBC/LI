:- use_module(library(clpfd)).

%% A (6-sided) "letter dice" has on each side a different letter.
%% Find four of them, with the 24 letters abcdefghijklmnoprstuvwxy such
%% that you can make all the following words: bake, onyx, echo, oval,
%% gird, smug, jump, torn, luck, viny, lush, wrap.

% RESULT
%[a,c,d,j,n,s]
%[b,f,i,o,u,w]
%[e,g,l,p,t,y]
%[h,k,m,r,v,x]

%Some helpful predicates:

word( [b,a,k,e] ).
word( [o,n,y,x] ).
word( [e,c,h,o] ).
word( [o,v,a,l] ).
word( [g,i,r,d] ).
word( [s,m,u,g] ).
word( [j,u,m,p] ).
word( [t,o,r,n] ).
word( [l,u,c,k] ).
word( [v,i,n,y] ).
word( [l,u,s,h] ).
word( [w,r,a,p] ).

num(X,N):- nth1( N, [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,r,s,t,u,v,w,x,y], X ).

main:-
    length(D1,6),
    length(D2,6),
    length(D3,6),
    length(D4,6),

    append([D1,D2,D3,D4],D),
    D ins 1..24,

    all_distinct(D),
    sorted(D1),
    sorted(D2),
    sorted(D3),
    sorted(D4),
    findall(N-M, sameWord(N,M), Pairs),
    pairsNotInDice(Pairs,D1),
    pairsNotInDice(Pairs,D2),
    pairsNotInDice(Pairs,D3),
    pairsNotInDice(Pairs,D4),
    
    labeling([min],D),
    
    writeN(D1), 
    writeN(D2), 
    writeN(D3), 
    writeN(D4), halt.
    
sorted([_]).
sorted([A,B|L]) :- A #< B, sorted([B|L]).

sameWord(N,M) :- word(W), num(X,N), num(Y,M), member(X,W), member(Y,W).

pairsNotInDice(_,[_]).
pairsNotInDice(Pairs,[Face1|D]) :- selectSecondFace(Pairs,Face1,D), pairsNotInDice(Pairs,D).

selectSecondFace(_,_,[]).
selectSecondFace(Pairs,Face1,[Face2|D]) :- writeRestrictions(Pairs,Face1,Face2), selectSecondFace(Pairs,Face1,D).

writeRestrictions([],_,_).
writeRestrictions([L1-L2|Pairs], Face1, Face2) :-  L1 #\= Face1 #\/ L2 #\= Face2, writeRestrictions(Pairs,Face1,Face2).
    
writeN(D):- findall(X,(member(N,D),num(X,N)),L), write(L), nl, !.