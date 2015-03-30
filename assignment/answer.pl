parentOf(X,Y) :- hasChild(X,Y).

%I modded tow rules so I can infer gender
%male(A) :- parentOf(B, Y), parentOf(A, Y), A \= B, female(B).
%female(A) :- parentOf(B, Y), parentOf(A, Y), A \= B, male(B).


motherOf(X,Y) :- parentOf(B,Y), parentOf(X,Y), X \= B, male(B).

fatherOf(X,Y) :- parentOf(B,Y), parentOf(X,Y), X \= B, female(B).

grandparentOf(X,Y) :- parentOf(X,Z), parentOf(Z,Y).

grandmotherOf(X,Y) :- parentOf(X,Z), parentOf(Z,Y), motherOf(Z,Y), motherOf(Y,X).

grandfatherOf(X,Y) :- parentOf(X,Z), parentOf(Z,Y), fatherOf(Z,Y), fatherOf(Y,X).

greatgrandparentOf(X,Y) :- parentOf(X,Z), parentOf(Z,A), parentOf(A,Y).

greatgrandmotherOf(X,Y) :- greatgrandparentOf(X,Y), female(X).

greatgrandfatherOf(X,Y) :- greatgrandparentOf(X,Y), male(X).

childOf(X,Y) :- parentOf(Y,X).

daughterOf(X,Y) :- parentOf(Y,X), female(X).

sonOf(X,Y) :- parentOf(Y,X), male(X).

grandchildOf(X,Y) :- parentOf(Y,Z), parentOf(Z,X).
