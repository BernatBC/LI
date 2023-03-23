% 26. Complete the following predicate in prolog.
% allSSSS(L) (allSquareSummingSubSequences) ===
% "Given a sequence of positive integers L, write all non-empty subsequences of L
% whose sum is a perfect square, in the following format":
% ?- allSSSS([6,3,4,5,6,9,8,5,2,3,4]).
% 9-[6,3]
% 49-[3,4,5,6,9,8,5,2,3,4]
% 4-[4]
% 9-[4,5]
% 9-[9]
% 9-[2,3,4]
% 4-[4]

allSSSS(L):- generateAll(L,SS), sum_list(SS, Sum), isSquare(Sum), write(Sum-SS).

isSquare(N):- between(1, N, P), N is P*P.

generateAll([],[]):-!.
generateAll([X|L], [X|S]):- generateAll(L, S).
generateAll([_|L], S):- generateAll(L, S).