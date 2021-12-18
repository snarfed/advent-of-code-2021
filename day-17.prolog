:- table step/4.

step(x, y, vx, vy) :-
    in_target(x, y).
step(x, y, vx, vy) :-
    nx is x + vx,
    ny is y + vy,
    nvx is vx - 1,
    nvy is max(vy - 1, 0),
    step(nx, nx, nvx, nvy).

in_target(x, y) :-
    x >= 281,
    x =< 311,
    y >= -74,
    y =< -54.
