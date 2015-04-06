| ?- ancestorOf(joe,X).

no
| ?- ancestorOf(joe,mavis).

true ? a
| ?- ancestorOf(X,mavis).  

no
ancestorOf(X,Y) :- X \= Y, parentOf(X, Y).
ancestorOf(X,Y) :- X \= Y, parentOf(X, Z), ancestorOf(Z,Y).
