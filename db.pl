/*
Thanks to Derek for the prolog tutorial https://www.youtube.com/watch?v=SykxWpFwMGs
Thanks to Benny for the pointers http://bennycheung.github.io/using-prolog-to-solve-logic-puzzles
https://stackoverflow.com/questions/6060268/prolog-count-the-number-of-times-a-predicate-is-true/6060361
https://stackoverflow.com/questions/30464504/how-to-find-the-nth-element-of-a-list-in-prolog
*/

/* Majors   [ accounting,   compsci,    engineering,    history,    english ] */
/* Cars     [ ford,         chevy,      nissan,         toyota,     tesla   ] */
/* Sports   [ royals,       chiefs,     yankees,        broncos,    cubs    ] */
/* Musics   [ classical,    country,    jazz,           rock,       techno  ] */
/* Drinks   [ coke,         coffee,     tea,            milk,       water   ] */

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

/* checks if A is next to B or B is next to A */
neighbors(A, B, L) :-
    nextto(A, B, L);
    nextto(B, A, L).

/* positional rules */
positionalRules(Solution) :-
    Solution = [_,                              _, [compsci, _, _, _, _], _,                     _                      ],   % 01
    Solution = [_,                              _, _,                     _,                     [_, _, _, classical, _]],   % 07
%   Solution = [_,                              _, [english, _, _, _, _], _,                     _                      ],   % 10 /* guessing for 10 */
%   Solution = [_,                              _, _,                     [english, _, _, _, _], _                      ],   % 10 /* guessing for 10 */
%   Solution = [_,                              _, _,                     _,                     [english, _, _, _, _]  ],   % 10 /* guessing for 10 */
    Solution = [[_,          _, broncos, _, _], _, _,                     _,                     _                      ],   % 14
    Solution = [[accounting, _, _,       _, _], _, _,                     _,                     _                      ].   % 17

/* rules for two items on one person */
memberRules(Solution) :-
    member([ history,     _,         _,       jazz,      _      ], Solution),   % 02
    member([ _,           toyota,    yankees, _,         _      ], Solution),   % 03
    member([ accounting,  _,         _,       _,         coke   ], Solution),   % 04
    member([ engineering, _,         _,       _,         coffee ], Solution),   % 05
    member([ _,           tesla,     _,       _,         tea    ], Solution),   % 08
    member([ _,           tesla,     royals,  _,         _      ], Solution),   % 11
    member([ _,           _,         cubs,    jazz,      _      ], Solution),   % 12
    member([ engineering, _,         chiefs,  _,         _      ], Solution),   % 13
    member([ _,           nissan,    _,       _,         coke   ], Solution),   % 15
    member([ accounting,  _,         _,       rock,      _      ], Solution),   % 19
    member([ _,           _,         yankees, _,         milk   ], Solution),   % 20
    member([ _,           chevy,     _,       country,   _      ], Solution),   % 21
    member([ _,           ford,      _,       jazz,      _      ], Solution).   % 22

/* neighbor to rules */
neighborRules(Solution) :-
    neighbors([compsci, _,         _,       _,         _], [engineering, _, _,      _,      _], Solution),   % 06
    neighbors([_,       _,         _,       classical, _], [_,           _, _,      jazz,   _], Solution),   % 09
    neighbors([_,       _,         _,       country,   _], [_,           _, _,      techno, _], Solution),   % 16
    neighbors([_,       _,         chiefs,  _,         _], [_,           _, royals, _,      _], Solution).   % 18

/* every item should be used once in the solution */
everyItemUsed(Solution) :-
    /* every major should be used once */
    member([ accounting,  _,         _,       _,         _      ], Solution),
    member([ compsci,     _,         _,       _,         _      ], Solution),
    member([ engineering, _,         _,       _,         _      ], Solution),
    member([ history,     _,         _,       _,         _      ], Solution),
    member([ english,     _,         _,       _,         _      ], Solution),
    /* every car should be used once */
    member([ _,           ford,      _,       _,         _      ], Solution),
    member([ _,           chevy,     _,       _,         _      ], Solution),
    member([ _,           nissan,    _,       _,         _      ], Solution),
    member([ _,           toyota,    _,       _,         _      ], Solution),
    member([ _,           tesla,     _,       _,         _      ], Solution),
    /* every sport should be used once */
    member([ _,           _,         royals,  _,         _      ], Solution),
    member([ _,           _,         chiefs,  _,         _      ], Solution),
    member([ _,           _,         yankees, _,         _      ], Solution),
    member([ _,           _,         broncos, _,         _      ], Solution),
    member([ _,           _,         cubs,    _,         _      ], Solution),
    /* every music should be used once */
    member([ _,           _,         _,       classical, _      ], Solution),
    member([ _,           _,         _,       country,   _      ], Solution),
    member([ _,           _,         _,       jazz,      _      ], Solution),
    member([ _,           _,         _,       rock,      _      ], Solution),
    member([ _,           _,         _,       techno,    _      ], Solution),
    /* every drink should be used once */
    member([ _,           _,         _,       _,         coke   ], Solution),
    member([ _,           _,         _,       _,         coffee ], Solution),
    member([ _,           _,         _,       _,         tea    ], Solution),
    member([ _,           _,         _,       _,         milk   ], Solution),
    member([ _,           _,         _,       _,         water  ], Solution).

/* make sure every item is unique */
everyItemUnique(Solution) :-
    aggregate_all(count, member([ accounting,  _,      _,        _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ compsci,     _,      _,        _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ engineering, _,      _,        _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ history,     _,      _,        _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ english,     _,      _,        _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           ford,   _,        _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           chevy,  _,        _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           nissan, _,        _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           toyota, _,        _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           tesla,  _,        _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      royals,   _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      chiefs,   _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      yankees,  _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      broncos,  _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      cubs,     _,         _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      _,        classical, _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      _,        country,   _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      _,        jazz,      _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      _,        rock,      _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      _,        techno,    _      ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      _,        _,         coke   ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      _,        _,         coffee ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      _,        _,         tea    ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      _,        _,         milk   ], Solution), Count), Count is 1,
    aggregate_all(count, member([ _,           _,      _,        _,         water  ], Solution), Count), Count is 1.

/* main solving function */
solve(Solution) :-
    positionalRules(Solution),
    memberRules(Solution),
    neighborRules(Solution),
    everyItemUsed(Solution),
    everyItemUnique(Solution).

/* print solution */
print_solution(Solution) :-
    write('--------------------------------'), nl,
    write_list(Solution).

/* writes list out to the console with each row on a new line */
write_list(List) :-
    [Head|Tail] = List,
    write(Head), nl,
    length(List, Length),
    Length > 0,
    write_list(Tail).
