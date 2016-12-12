:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- [board].

defineLines([]).
defineLines([H|T]):-
	length(H,6),
	domain(H,0,2),
	defineLines(T).

restrictFromInput([],_,_,_,_,_,_).
restrictFromInput([[Colour,0,X]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L1, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,1,X]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L2, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,2,X]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L3, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,3,X]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L4, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,4,X]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L5, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,5,X]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L6, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).

%Input será coordenadas das peças ja na board do tipo [1,0,4] (peça de cor preta(1) de coordenadas (0,4))
	%Example solveGame([[1,0,4],[2,1,1]], Board).
solveGame(Input, Output):-
	Output = [L1,L2,L3,L4,L5,L6],
	defineLines(Output),
	restrictFromInput(Input,L1,L2,L3,L4,L5,L6),

	labeling([], Output),
	nl,
	printBoard(Output).

