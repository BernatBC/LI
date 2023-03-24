% 18. Consider two groups of 10 people each. In the first group, as expected, the percentage of people with lung cancer among smokers is higher than among non-smokers. In the second group, the same is the case. But if we consider the 20 people of the two groups together, then the situation is the opposite: the proportion of people with lung cancer is higher among non-smokers than among smokers! Can this be true? Write a little Prolog program to find it out.

% true: 

checkGroups():- generateCount(10, [NS_NC1, NS_C1, S_NC1, S_C1]), percent(S_C1, S_NC1, PSC1), percent(NS_C1, NS_NC1, PNSC1), PSC1 > PNSC1, generateCount(10, [NS_NC2, NS_C2, S_NC2, S_C2]), percent(S_C2, S_NC2, PSC2), percent(NS_C2, NS_NC2, PNSC2), PSC2 > PNSC2, PSCT is PSC1 + PSC2, PNSCT is PNSC1 + PNSC2, PSCT < PNSCT. 

generateCount(N,[NS_NC, NS_C, S_NC, S_C]):- between(0, N, NS_NC), between(0, N,NS_C), between(0, N,S_NC), between(0, N, S_C), A is NS_NC + NS_C, B is S_NC + S_C, N is A + B.


percent(0, 0, 0):-!.
percent(A,B,S):- S is A/(A + B).