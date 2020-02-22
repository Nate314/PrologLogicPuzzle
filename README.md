# Prolog Logic Puzzle
UMKC CS461 Project3
# 
To run this project, run the following commands from prolog:

```
[db].       % reads in the database
solve(X).   % solves the puzzle and prints the solution
```
The solution I found:
```
[
    [accounting,    ford,   broncos,    jazz,       coke    ],
    [engineering,   chevy,  chiefs,     country,    coffee  ],
    [compsci,       tesla,  royals,     techno,     tea     ],
    [history,       nissan, cubs,       jazz,       coke    ],
    [english,       toyota, yankees,    classical,  milk    ]
]
```

# Assignment Description
For this program, you are to write a program in PROLOG to solve the following logic problem. Note that 'adjacent to' or 'neighbor' may be on the left or the right unless other constraints dictate otherwise. And of course, the neighbor relation is symmetric. If A is a neighbor of B, then B is a neighbor of A.

A college dorm hallway has 5 1-person rooms. Each resident is a different major, listens to a different style of music, drives a different make of car, has a different favorite sports team, and a different favorite beverage.

The computer science student lives in the middle of the corridor
The history major is a jazz fan.
The Yankees fan drives a Toyota.
The accounting major drinks Coke.
The engineering major drinks coffee.
The computer science student and history student are neighbors.
The student at the far end of the hall likes classical music
The tea drinker drives a Tesla.
The classical music fan lives next to the jazz listener.
The English major does not live in either of the first two rooms.
The Royals fan drives a Tesla.
The Cubs fan listens to jazz.
The engineering major follows the Chiefs
The first room is the home of the Broncos fan
The Coke drinker drives a Nissan.
The country music fan and the techno fan are neighbors.
The accounting major lives in the first room.
The fans of the 2 Kansas City teams (Chiefs and Royals) are neighbors
The accounting major listens to rock music
The Yankees fan drinks milk.
The Chevy driver listens to country music.
The jazz fan drives a Ford.

What music does the computer-science student listen to, and what does the English major drink?

Summary:
- Majors: Accounting, computer science, engineering, history, English
- Cars: Ford, Chevy, Nissan, Toyota, Tesla
- Sports teams: Royals, Chiefs, Yankees, Broncos, Cubs
- Music: Classical, country, jazz, rock, techno
- Drinks: Coke, coffee, tea, milk, water

Write a PROLOG program that contains the above facts as a knowledge base, and functions to capture 'adjacent to,' 'all different,' etc. Your program should begin with the above facts and deduce the major, car, music, sports team, and beverage for each resident, printing the information at the end. Submit your program code and output from a sample execution.
