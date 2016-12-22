:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(system)).
:- [board].

%Make sure every piece is connected to another piece
restrictPath(_,_,6).
restrictPath(FirstLine, SecondLine, Inc):-
	Inc2 is Inc + 1,
	element(Inc, FirstLine, E1),
	element(Inc2, FirstLine, E2),
	element(Inc, SecondLine, E3),
	E1 #= E2 #\/ E1 #= E3,
	restrictPath(FirstLine, SecondLine, Inc2).
restrictLastCol(FirstLine, SecondLine):-
 	element(6, SecondLine, E1),
 	element(5, SecondLine, E2),
 	element(6, FirstLine, E3),
 	E1 #= E2 #\/ E1 #= E3.
restrictLastLine(_,_,6).	
restrictLastLine(SecondLine, FirstLine, Inc):-
	Inc2 is Inc + 1,
	element(Inc, SecondLine, E1),
	element(Inc, FirstLine, E2),
	element(Inc2, SecondLine, E3),
	E1 #= E2 #\/ E1 #= E3,
	restrictPath(FirstLine, SecondLine, Inc2).

%Gets input from user and adds pieces to final board
restrictFromInput([],_,_,_,_,_,_).
restrictFromInput([[Colour,X,0]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L1, Colour), write('Input at line 0'), nl,
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,X,1]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L2, Colour), write('Input at line 1'), nl,
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,X,2]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L3, Colour), write('Input at line 2'), nl,
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,X,3]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L4, Colour), write('Input at line 3'), nl,
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,X,4]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L5, Colour), write('Input at line 4'), nl,
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).
restrictFromInput([[Colour,X,5]|T],L1,L2,L3,L4,L5,L6):-
	X2 is X + 1,
	element(X2, L6, Colour), write('Input at line 5'), nl,
	restrictFromInput(T,L1,L2,L3,L4,L5,L6).

%Not allow 2x2of the same colour
twoByTwo([_],[_]).
twoByTwo([F1,S1|T1],[F2,S2|T2]):-
	F1 + S1 + F2 + S2 #> 4,
	F1 + S1 + F2 + S2 #< 8,
	twoByTwo([S1|T1],[S2|T2]).

%Set length and domain for each line
defineLines([]).
defineLines([L|T]):-
	length(L,6),
	domain(L,1,2),
	defineLines(T).

%Input são coordenadas das peças ja na board do tipo [1,0,4] (peça de cor preta(1) de coordenadas (0,4), sendo cor branca = 2)
	%Example 1: solveGame([[1,0,4],[2,1,1]], Board). Example 2: solveGame([[2,0,4],[2,1,5],[2,5,5],[2,4,4],[2,2,2],[2,3,1],[1,2,4],[1,1,3],[1,4,3],[1,4,2],[1,5,3]], Board).
solveGame(Input, Output):-
	nl,
	Output = [L1,L2,L3,L4,L5,L6],
	defineLines(Output),
	restrictFromInput(Input,L1,L2,L3,L4,L5,L6), !,
	twoByTwo(L1,L2),
	twoByTwo(L2,L3),
	twoByTwo(L3,L4),
	twoByTwo(L4,L5),
	twoByTwo(L5,L6),
	restrictPath(L1,L2, 1),
	restrictPath(L2,L3, 1),
	restrictPath(L3,L4, 1),
	restrictPath(L4,L5, 1),
	restrictPath(L5,L6, 1),
	restrictLastCol(L1, L2),
	restrictLastCol(L2, L3),
	restrictLastCol(L3, L4),
	restrictLastCol(L4, L5),
	restrictLastCol(L5, L6),
	restrictLastLine(L6, L5, 1),
	append(Output, NewOutput),
	%sum(NewOutput, #=,54), %Restriction not used
	%Statisctics calculators
	statistics(runtime, [TimeOfExec,_]),
	statistics(local_stack, [LocalStack,_]),
	statistics(trail, [TrailStack,_]),
	statistics(choice, [BackTrackStack,_]),
	%Labeling
	labeling([ff,bisect, up], NewOutput), nl, printBoard(Output),
	%Statistics
	nl, write('Execution time: '), write(TimeOfExec), write(' milliseconds.'),
	nl, write('Local Stack: '), write(LocalStack), write(' bytes.'),
	nl, write('Trail Stack: '), write(TrailStack), write(' bytes.'),
	nl, write('Bactrack Stack: '), write(BackTrackStack), write(' bytes.'), nl,
	fd_statistics.