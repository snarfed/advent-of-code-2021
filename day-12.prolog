big(my).
big(nf).
big(tp).
big(em).

connect(end, my).
connect(my, xc).
connect(ho, nf).
connect(start, ho).
connect(nf, xc).
connect(nf, yf).
connect(end, yf).
connect(xc, tp).
connect(my, qo).
connect(yf, tp).
connect(dc, nf).
connect(dc, xc).
connect(start, dc).
connect(yf, my).
connect(my, ho).
connect(em, uh).
connect(xc, yf).
connect(ho, dc).
connect(uh, nf).
connect(yf, ho).
connect(end, uh).
connect(start, nf).

connect(X, Y) :- connect(Y, X).

path(X, Y) :-
    connect(X, Y),

path(X, Y) :-
    connect(X, A),
    path(A, Y).

report:-
  write('Paths:'), nl,
  path(start, end),
  %% writef(A), write(' '), write(B), nl,
  %% writef('%s %s', [A, B]), nl,
  fail.
