
% find the head of a list
myhead(X,[X|_]).

% find the last element of a list
mylast(X,[X]).
mylast(X,[_|T]) :- mylast(X,T).

% find the length of a list
len([],0).
len([_|T],N) :- len(T,N1), N is N1+1.

% get the range of numbers
% from I to K in a list
range(I,I,[I]).
range(I,K,[I|T]) :- I<K, I1 is I+1, range(I1,K,T).

% reverse a list
myreverse(L1,L2) :- myrev(L1,L2,[]).

myrev([],L2,L2) :- !.
myrev([X|Xs],L2,Acc) :- myrev(Xs,L2,[X|Acc]).

