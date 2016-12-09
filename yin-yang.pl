:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- [board].

%Input será coordenadas das peças ja na board do tipo [1,0,4] (peça de cor preta(1) de coordenadas (0,4))
solveGame(Size, Input, Output):-
	Size > 2, !,
	length(Output, Size),
	domain(Output,0,2),
	NumberOfPieces is abs(Size * Size / 2),
	write(NumberOfPieces),nl,
	global_cardinality(Output, [1-NumberOfPieces, 2-NumberOfPieces]),
	labeling([], Output),
	nl,
	printBoard(Output).

