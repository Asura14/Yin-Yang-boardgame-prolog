# Yin Yang Puzzle - Prolog Implementation
  Prolog implementation of Yin Yang Puzzle solver with a board zise of 6x6, using restrictions (clpfd ltbrary). Plus a board.pl file responsible for printing end result.
## Basic rules:
  * Divide the grid into two regions of black and white by placing either a black or a white circle in each empty cell.
  * All circles of same color are connected to each other, vertically or horizontally.
  * No 2X2 group of cells can contain circles of a single color. 
## Run
  * Open SICStus prolog
  * Consult yinyang.pl
  * Run: solveGame(?INPUT, Board), where ?INPUT is the inicial board as a list [[Color1,X1,Y1],[Color2,X2,Y2]]. Examples:
    * solveGame([[1,0,4],[2,1,1]], Board). 
    * solveGame([[2,0,4],[2,1,5],[2,5,5],[2,4,4],[2,2,2],[2,3,1],[1,2,4],[1,1,3],[1,4,3],[1,4,2],[1,5,3]], Board).
