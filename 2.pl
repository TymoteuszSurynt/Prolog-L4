hint1([(anglik,czerwony,_, _, _)|_]).
hint1([_|T]) :- hint1(T).

hint2([(szwed,_,_,_,pies)|_]).
hint2([_|T]) :- hint2(T).

hint3([(dunczyk,_,herbata,_,_)|_]).
hint3([_|T]) :- hint3(T).

hint4([(_,zielony,_,_,_),(_,bialy,_,_,_)|_]).
hint4([_|T]) :- hint4(T).

hint5([(_,zielony,kawa,_,_)|_]).
hint5([_|T]) :- hint5(T).

hint6([(_,_,_,bezfiltra,ptak)|_]).
hint6([_|T]) :- hint6(T).

hint7([(_,zolty,_,cygaro,_)|_]).
hint7([_|T]) :- hint7(T).

hint8(People) :- person(3, People, (_,_,mleko,_,_)).

hint9(People) :- person(1, People, (norweg,_,_,_,_)).

hint10([(_,_,_,light,_),(_,_,_,_,kot)|_]).
hint10([(_,_,_,_,kot),(_,_,_,light,_)|_]).
hint10([_|T]) :- hint10(T).

hint11([(_,_,_,cygaro,_),(_,_,_,_,kon)|_]).
hint11([(_,_,_,_,kon),(_,_,_,cygaro,_)|_]).
hint11([_|T]) :- hint11(T).

hint12([(_,_,piwo,mentolowe,_)|_]).
hint12([_|T]) :- hint12(T).

hint13([(niemiec,_,_,fajka,_)|_]).
hint13([_|T]) :- hint13(T).

hint14([(norweg,_,_,_,_),(_,niebieski,_,_,_)|_]).
hint14([(_,niebieski,_,_,_),(norweg,_,_,_,_)|_]).
hint14([_|T]) :- hint14(T).

hint15([(_,_,_,light,_),(_,_,woda,_,_)|_]).
hint15([(_,_,woda,_,_),(_,_,_,light,_)|_]).
hint15([_|T]) :- hint15(T).

question([(_,_,_,_,rybka)|_]).
question([_|T]) :- question(T).
people(0, []) :- !.
people(N,[(_Kto,_Kolor,_Pije,_Pali,_Zwierze)|T]) :-
 N1 is N-1, people(N1,T).
 person(1, [H|_], H) :- !.

person(N, [_|T], R) :- person(N1, T, R), N is N1+1.
solution(People) :-
  people(5, People),
  hint1(People),
  hint2(People),
  hint3(People),
  hint4(People),
  hint5(People),
  hint6(People),
  hint7(People),
  hint8(People),
  hint9(People),
  hint10(People),
  hint11(People),
  hint12(People),
  hint13(People),
  hint14(People),
  hint15(People),
  question(People).
rybki(Kto) :- solution(People),
 person(_, People, (Kto, _, _, _, rybka)).
