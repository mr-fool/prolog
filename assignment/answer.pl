parentOf(X,Y) :- hasChild(X,Y).

motherOf(X,Y) :- parentOf(X,Y), female(X).

fatherOf(X,Y) :- parentOf(X,Y), male(X).

grandparentOf(X,Y) :- parentOf(X,Z), parentOf(Z,Y).

grandmotherOf(X,Y) :- parentOf(X,Z), parentOf(Z,Y), female(X).

grandfatherOf(X,Y) :- parentOf(X,Z), parentOf(Z,Y), male(X).

greatgrandparentOf(X,Y) :- parentOf(X,Z), parentOf(Z,A), parentOf(A,Y).

greatgrandmotherOf(X,Y) :- greatgrandparentOf(X,Y), female(X).

greatgrandfatherOf(X,Y) :- greatgrandparentOf(X,Y), male(X).

childOf(X,Y) :- parentOf(Y,X).

daughterOf(X,Y) :- parentOf(Y,X), female(X).

sonOf(X,Y) :- parentOf(Y,X), male(X).

grandchildOf(X,Y) :- parentOf(Y,Z), parentOf(Z,X).
