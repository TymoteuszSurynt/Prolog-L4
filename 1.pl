ins(X, T1, T2) :- X = T1 + T2.
ins(X, T1, T2) :- X = T1 - T2.
ins(X, T1, T2) :- X = T1 * T2.
ins(X, T1, T2) :- \+ (0 is T2), X = T1 / T2.

generate([X], X).
generate(L, X) :-
	append(L1, L2, L),
	\+ length(L1, 0),
	\+ length(L2, 0),
	generate(L1, T1),
	generate(L2, T2),
	ins(X, T1, T2).

wyrazenie(Lista, Wartosc, Wyrazenie) :-
	generate(Lista, X),
	Wartosc is X,
	Wyrazenie = X.
