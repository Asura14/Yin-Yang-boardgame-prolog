:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- [board].

defineLines([]).
defineLines([L|T]):-
	length(L,6),
	domain(L,0,2),
	defineLines(T).

restrictFromInput([],_,_,_,_,_,_).
restrictFromInput([[Colour,0,X]|T],L1,L2,L3,L4,L5,L6):-
	write('Input at line 0'), nl,
	X2 is X + 1,
	element(X2, L1, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,1,X]|T],L1,L2,L3,L4,L5,L6):-
	write('Input at line 1'), nl,
	X2 is X + 1,
	element(X2, L2, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,2,X]|T],L1,L2,L3,L4,L5,L6):-
	write('Input at line 2'), nl,
	X2 is X + 1,
	element(X2, L3, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,3,X]|T],L1,L2,L3,L4,L5,L6):-
	write('Input at line 3'), nl,
	X2 is X + 1,
	element(X2, L4, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,4,X]|T],L1,L2,L3,L4,L5,L6):-
	write('Input at line 4'), nl,
	X2 is X + 1,
	element(X2, L5, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,5,X]|T],L1,L2,L3,L4,L5,L6):-
	write('Input at line 5'), nl,
	X2 is X + 1,
	element(X2, L6, Colour),
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).

%Not allow 2x2of the same colour
twoByTwo([],[]).
twoByTwo([F1,S1|T1],[F2,S2|T2]):-
	F1 + S1 + F2 + S2 #> 4,
	F1 + S1 + F2 + S2 #< 8,
	twoByTwo(T1,T2).


%Input são  coordenadas das peças ja na board do tipo [1,0,4] (peça de cor preta(1) de coordenadas (0,4))
	%Example solveGame([[1,0,4],[2,1,1]], Board).
solveGame(Input, Output):-
	nl,
	Output = [L1,L2,L3,L4,L5,L6],
	defineLines(Output),
	restrictFromInput(Input,L1,L2,L3,L4,L5,L6),
	twoByTwo(L1,L2),
	twoByTwo(L2,L3),
	twoByTwo(L3,L4),
	twoByTwo(L4,L5),
	twoByTwo(L5,L6),
	labeling([], Output),
	nl, printBoard(Output).

