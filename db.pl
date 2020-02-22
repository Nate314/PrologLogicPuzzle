/*
Thanks to Derek for the prolog tutorial https://www.youtube.com/watch?v=SykxWpFwMGs
Thanks to Benny for the pointers http://bennycheung.github.io/using-prolog-to-solve-logic-puzzles
*/

right(X, Y, L) :-
    append(_, [X, Y | _], L).

nextTo(X, Y, L) :-
    right(X, Y, L);
    right(Y, X, L).

/* majors   [ accounting,   compsci,    engineering,    history,    english ] */
/* cars     [ ford,         chevy,      nissan,         toyota,     tesla   ] */
/* sports   [ royals,       chiefs,     yankees,        broncos,    cubs    ] */
/* music    [ classical,    country,    jazz,           rock,       techno  ] */
/* drinks   [ coke,         coffee,     tea,            milk,       water   ] */

/*
01 => The computer science student lives in the middle of the corridor
02 => The history major is a jazz fan.
03 => The Yankees fan drives a Toyota.
04 => The accounting major drinks Coke.
05 => The engineering major drinks coffee.
06 => The computer science student and history student are neighbors.
07 => The student at the far end of the hall likes classical music
08 => The tea drinker drives a Tesla.
09 => The classical music fan lives next to the jazz listener.
10 => The English major does not live in either of the first two rooms.
11 => The Royals fan drives a Tesla.
12 => The Cubs fan listens to jazz.
13 => The engineering major follows the Chiefs
14 => The first room is the home of the Broncos fan
15 => The Coke drinker drives a Nissan.
16 => The country music fan and the techno fan are neighbors.
17 => The accounting major lives in the first room.
18 => The fans of the 2 Kansas City teams (Chiefs and Royals) are neighbors
19 => The accounting major listens to rock music
20 => The Yankees fan drinks milk.
21 => The Chevy driver listens to country music.
22 => The jazz fan drives a Ford.
*/

/* [[Major, Car, Team, Music, Drink], _, _, _, _] */
/* [_, _, _, _, _] */
/* \[([a-z]|_)+, ([a-z]|_)+, ([a-z]|_)+, ([a-z]|_)+, ([a-z]|_)+\] */

solve(Solution) :-
    /* positional rules */
    Solution = [_, _, [compsci, _, _, _, _], _, _]                          ,   % 01
    Solution = [_, _, _, _, [_, _, _, classical, _]]                        ,   % 07
    % Solution = [_, _, [english, _, _, _, _], _, _]                        ,   % 10 /* guessing for 10 */
    % Solution = [_, _, _, [english, _, _, _, _], _]                        ,   % 10 /* guessing for 10 */
    Solution = [_, _, _, _, [english, _, _, _, _]]                          ,   % 10 /* guessing for 10 */
    Solution = [[_, _, broncos, _, _], _, _, _, _]                          ,   % 14
    Solution = [[accounting, _, _, _, _], _, _, _, _]                       ,   % 17
    /* rules for two items on one person */
    member([history, _, _, jazz, _], Solution)                              ,   % 02
    member([_, toyota, yankees, _, _], Solution)                            ,   % 03
    member([accounting, _, _, _, coke], Solution)                           ,   % 04
    member([engineering, _, _, _, coffee], Solution)                        ,   % 05
    member([_, tesla, _, _, tea], Solution)                                 ,   % 08
    member([_, tesla, royals, _, _], Solution)                              ,   % 11
    member([_, _, cubs, jazz, _], Solution)                                 ,   % 12
    member([engineering, _, chiefs, _, _], Solution)                        ,   % 13
    member([_, nissan, _, _, coke], Solution)                               ,   % 15
    member([accounting, _, _, _, _], Solution)                              ,   % 19
    member([_, _, yankees, _, milk], Solution)                              ,   % 20
    member([_, chevy, _, country, _], Solution)                             ,   % 21
    member([_, ford, _, jazz, _], Solution)                                 ,   % 22
    /* next to rules */
    nextTo([engineering, _, _, _, _], [compsci, _, _, _, _], Solution)      ,   % 06
    nextTo([_, _, _, classical, _], [_, _, _, jazz, _], Solution)           ,   % 09
    nextTo([_, _, _, country, _], [_, _, _, techno, _], Solution)           ,   % 16
    nextTo([_, _, chiefs, _, _], [_, _, royals, _, _], Solution)            ,   % 18
    /* print solution */
    write('--------------------------------'), nl,
    write_list(Solution).

write_list(List) :-
    [Head|Tail] = List,
    write(Head), nl,
    length(List, Length),
    Length > 0,
    write_list(Tail).
