print_s(L):-
  between(1,24,R),
  ((between(1,3,R);between(8,10,R);between(15,17,R);between(22,24,R)),(member(R,L),write("+ --- ");\+(member(R,L)),write("+     "));
  (between(4,7,R);between(11,14,R);between(18,21,R)),(member(R,L),write("|     ");\+(member(R,L)),write("      "))),
  (((R=3;R=10;R=17;R=24),write("+\n"));
  ((R=7;R=14;R=21),write("\n"))),fail;true.

kwadrat(duzy(1),[1,2,3,4,7,11,14,18,21,22,23,24]).
kwadrat(maly(1),[N,N1,N2,N3]):-(between(1,3,N);between(8,10,N);between(15,17,N)),N1 is N+3, N2 is N+4, N3 is N+7.
kwadrat(sredni(1),[N,N1,N2,N3,N4,N5,N6,N7]):-(between(1,2,N);between(8,9,N)),N1 is N+1, N2 is N+3, N3 is N+5,N4 is N+10, N5 is N+12, N6 is N+14, N7 is N+15.

kwadrat(maly(N),L):-between(2,8,N),N1 is N-1, kwadrat(maly(N1),L1), kwadrat(maly(1),L2), intersection(L1,L2,L3), L3\=L2, union(L1,L2,L4),sort(L4,L).
kwadrat(maly(9),L):-numlist(1,24,L).

kwadrat(sredni(2),L):- kwadrat(sredni(1),A),kwadrat(sredni(1),B),A\=B,union(A,B,L2),sort(L2,L).
kwadrat(sredni(3),L):- kwadrat(sredni(1),A),kwadrat(sredni(1),B),A\=B,kwadrat(sredni(1),C),C\=A,C\=B,union(A,B,L1),union(L1,C,L2),sort(L2,L).
kwadrat(sredni(4),L):-numlist(1,24,L).


zapalki(N,L):-
  zapalki2(L1,L),length(L1,N1),N is 24-N1,print_s(L1).
zapalki2([],[]).
zapalki2(L,[H|T]):-
  zapalki2(L1,T),kwadrat(H,L2) ,union(L1,L2,L).
