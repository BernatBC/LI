% 19. Supongamos que tenemos una máquina que dispone de monedas de valores [X1,...Xn] y tiene que devolver una cantidad C de cambio utilizando el mı́nimo número de monedas. Escribe un programa Prolog maq(L,C,M) que, dada la lista de monedas L y la cantidad C, genere en M la lista de monedas a devolver de cada tipo. Por ejemplo, si L es [1,2,5,13,17,35,157], y C es 361, entonces una respuesta es [0,0,0,1,2,0,2] (5 monedas).
% Note: greedy algorithms (starting with the largest coin, etc.) do not always work!

maq(L,C,M):- between(0, C, K), maq(L,C,M,K).
maq(L,C,M, NCoins):- length(L,N), generate(N,NCoins,M), sum_list(M,NCoins), exchange(L,C,M).


generate(0, _, []):-!.
generate(N, M, [R|G]):- between(0, M, R), N2 is N-1, generate(N2, M, G).

exchange([],0,[]):-!. 
exchange([L|LS],C,[M|MS]):- V is L*M, C2 is C-V, exchange(LS, C2, MS).