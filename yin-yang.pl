:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- [board].

%confirms size of every internal list
auxCheckLength([],_).
auxCheckLength([H|T], InputCount):-
	length(H, Count),
	Count == InputCount,
	auxCheckLength(T, InputCount).

%check if input is a square (list of lists with same size)
checkLength(Input):-
	length(Input, InputCount),
	InputCount > 2,
	auxCheckLength(Input, InputCount).
checkLength(Input):-
	nl,write('Board should be a square and bigger than 2x2.'), nl,nl,
	fail.

solveGame(Input):-
	checkLength(Input), !,

	%labeling([], FinalBoard),
	nl,
	printBoard(Input).



