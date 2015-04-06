fib(0,0) :- !.
fib(1,1) :- !.

fib(N,V) :- N1 is N-1, N2 is N-2, N2>=0 ,fib(N1,V1), fib(N2,V2), V is V1+V2.
