:- initialization(main, main).

main :-
    [db], solve(X), print_solution(X).
