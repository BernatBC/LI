% 14. Encuentra mediante un programa Prolog, usando el predicado permutación, qué 8 dı́gitos diferentes tenemos que asignar a las letras S, E, N, D, M, O, R, Y, de manera que se cumpla la suma siguiente: SEND+MORE=MONEY

checkSum(S,E,N,D,M,O,R,Y):- L = [S, E, N, D, M, O, R, Y, _, _], permutation(L, [0,1,2,3,4,5,6,7,8,9]), calcNumber4(S,E,N,D,N1), calcNumber4(M,O,R,E,N2), N3 is N1 + N2, calcNumber5(M,O,N,E,Y,N3).


calcNumber4(A,B,C,D,S):- S is D + 10*C + 100*B + 1000*A.

calcNumber5(A,B,C,D,E,S):- S is E + 10*D + 100*C + 1000*B + 10000*A.