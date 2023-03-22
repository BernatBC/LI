% 25. Complete the following predicate in prolog.
% nthRoot( N, K, R ) === "Given positive integers N and K, the integer part of the Nth root of K is R".
% Example: the integer part of the 2th root (square root) of 16 is 4.
% Example: the integer part of the 3rd root (cubic root) of 8 is 2.
% Example: the integer part of the 4th root of 16 is 2.
% Example: the integer part of the 4th root of 15 is 1.
%nthRoot( N, K, R ):- between(2,N,R), NP1 is N + 1, NS1 is N - 1, EL is R**NS1, EH is R**NP1, K>EL, K < EH.
nthRoot( N, K, R ):- between(1,K,R), RP1 is R + 1, EL is R**N, EH is RP1**N, K>=EL, K < EH.