% 23. Given a list of integers L, and a maximum sum K, write the subsets Sm of L such that:
%   sum(Sm) =< K, and
%   no element in L \ Sm can be added to Sm without exceeding the sum K.
% Hint: you can use the predicate sum list(L, X), which is true if X is the sum of the numbers in L; e.g., sum list([1,2,3], 6) holds.

%% Example:
numbers([2,5,7,-2,2,9,3,4,1]).
maxSum(6).
%% subsetWithRest(L, Subset, Rest) holds
%% if Subset is a subset of L and Rest is the rest of the elements.
subsetWithRest([], [], []).
subsetWithRest([X|L], [X|Subset], Rest):- subsetWithRest(L, Subset, Rest).
subsetWithRest([X|L], Subset, [X|Rest]):- subsetWithRest(L, Subset, Rest).
%% maxSubset(K, L, Sm) holds
%% if Sm is a subset of numbers of L such that
%% it sums at most K
%% and if we try to add any other element, the sum exceeds K.
maxSubset(K, L, Sm):-
    subsetWithRest(L, Sm, Rest),
    sum_list(Sm, Sum),
    not(checkSum([0], Sum, K)),
    checkSum(Rest, Sum, K).


checkSum([], _, _):- !.
checkSum([X|L], Sum, Max):- S is Sum + X, S > Max, checkSum(L,Sum,Max).

main :-
    numbers(L), maxSum(K),
    maxSubset(K, L, Sm),
    write(Sm), nl, fail.
main:- halt.