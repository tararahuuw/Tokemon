:- dynamic(lebarpeta/1).
:- dynamic(tinggipeta/1).
:- dynamic(player/2).
:- dynamic(gym/2).
:- dynamic(tokemon/2).
:- dynamic(postokemon/3).

lebarpeta(15).
tinggipeta(15).

mulai :-
	lebarpeta(X),
	tinggipeta(Y),
	R is X - 1,
	T is Y - 1,
    random(2,R,A),
    random(2,T,B),
    random(2,R,P),
    random(2,T,Q),
    asserta(player(A,B)),
	asserta(gym(P,Q)),
    tokemon(Z),
    random(2,R,C),
    random(2,T,D),
    asserta(postokemon(Z, C, D)),
	!.

borderatas(_,Y) :-
	Y =:= 0,!.

borderbawah(_,Y) :-
	tinggipeta(T),
	Ymax is T+1,
	Y =:= Ymax,!.

borderkiri(X,_) :-
	X =:= 0,!.

borderkanan(X,_) :-
	lebarpeta(L),
	Xmax is L+1,
	X =:= Xmax,!.

printpeta(X,Y) :-
	borderatas(X,Y), !, write('X').
printpeta(X,Y) :-
	borderbawah(X,Y), !, write('X').
printpeta(X,Y) :-
	borderkiri(X,Y), !, write('X').
printpeta(X,Y) :-
	borderkanan(X,Y), !, write('X').
printpeta(X,Y) :-
	player(X,Y), !, write('P').
printpeta(X,Y) :-
	gym(X,Y), !, write('G').
printpeta(_,_) :-
	write('-').



