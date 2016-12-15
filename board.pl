:- use_module(library(lists)).

% 0: casa vazia, 1: peça branca, 2: peça preta

initialBoard(Board):- append([],[
				[0,0,0,0,0,0],
				[0,0,0,1,0,0],
				[0,0,1,1,2,0],
				[0,2,0,0,2,2],
				[1,0,2,0,1,0],
				[0,1,0,0,0,1]], Board).

printBoard([]):-
	nl, nl.
printBoard([H|T]):-
	printSpaces(H),
	printBoard(T).
printSpaces([]):-
	write('|'),
	nl.
printSpaces([H|T]):-
	write('|'),
	translatePrint(H),
	printSpaces(T).

translatePrint(0):-
	write('   ').
translatePrint(X):-
	write(' '),
	write(X),
	write(' ').