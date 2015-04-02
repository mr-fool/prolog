parentOf(X,Y) :- hasChild(X,Y).

motherOf(X,Y) :- parentOf(X,Y), female(X).
motherOf(X,Y) :- parentOf(B,Y), parentOf(X,Y), X \= B, male(B).

fatherOf(X,Y) :- parentOf(X,Y), male(X).
fatherOf(X,Y) :- parentOf(B,Y), parentOf(X,Y), X \= B, female(B).

grandparentOf(X,Y) :- parentOf(X,Z), parentOf(Z,Y).

grandmotherOf(X,Y) :- grandparentOf(X,Y), female(X).
grandmotherOf(X,Y) :- grandparentOf(X,Y), isFemale(X).

grandfatherOf(X,Y) :- grandparentOf(X,Y), male(X).
grandfatherOf(X,Y) :- grandparentOf(X,Y), isMale(X).

greatgrandparentOf(X,Y) :- parentOf(X,Z), parentOf(Z,A), parentOf(A,Y).

greatgrandmotherOf(X,Y) :- greatgrandparentOf(X,Y), female(X).
greatgrandmotherOf(X,Y) :- greatgrandparentOf(X,Y), isFemale(X).

greatgrandfatherOf(X,Y) :- greatgrandparentOf(X,Y), male(X).
greatgrandfatherOf(X,Y) :- greatgrandparentOf(X,Y), isMale(X).

childOf(X,Y) :- parentOf(Y,X).

daughterOf(X,Y) :- parentOf(Y,X), isFemale(X).

sonOf(X,Y) :- parentOf(Y,X), isMale(X).

grandchildOf(X,Y) :- parentOf(Y,Z), parentOf(Z,X).

granddaughterOf(X,Y) :- grandparentOf(Y,X), isFemale(Y).



isMale(A) :- parentOf(B, Y), parentOf(A, Y), A \= B, female(B).
isFemale(A) :- parentOf(B, Y), parentOf(A, Y), A \= B, male(B).
