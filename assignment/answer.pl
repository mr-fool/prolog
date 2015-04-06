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

granddaughterOf(X,Y) :- female(X), grandparentOf(Y,X).
granddaughterOf(X,Y) :- isFemale(X), grandparentOf(Y,X).

grandsonOf(X,Y) :- male(X), grandparentOf(Y,X).
grandsonOf(X,Y) :- isMale(X), grandparentOf(Y,X).

greatgrandchildOf(X,Y) :- greatgrandparentOf(Y,X).

greatgranddaughterOf(X,Y) :- female(X), greatgrandparentOf(Y,X).
greatgranddaughterOf(X,Y) :- isFemale(X), greatgrandparentOf(Y,X).

greatgrandsonOf(X,Y) :- male(X), greatgrandparentOf(Y,X).
greatgrandsonOf(X,Y) :- isMale(X), greatgrandparentOf(Y,X).

ancestorOf(X,Y) :- parentOf(X, Y).
ancestorOf(X,Y) :- parentOf(X, Z), ancestorOf(Z,Y).

ancestorOf(X,Y,0) :- X =Y,true.
ancestorOf(X,Y,1) :- ancestorOf(X,Y).
ancestorOf(X,Y,N) :- N1 is N -1, ancestorOf(X,Y,N1).

parent(X) :- hasChild(X,Y).

%helper function
descendantOf(X,Y) :- childOf(X,Y).
descendantOf(X,Y) :- childOf(X,Z), childOf(Z,Y).
related(X,X).
related(X,Y) :- ancestorOf(X,Y).
related(X,Y) :- ancestorOf(Y,X).
related(X,Y) :- descendantOf(X,Y).
related(X,Y) :- descendantOf(Y,X).

sibling(X,Y) :- motherOf(Z,X), motherOf(Z,Y), fatherOf(W,X), fatherOf(W,Y), \+pet(X), \+pet(Y), X \= Y.

sisterOf(X,Y) :- sibling(X,Y), female(X).
sisterOf(X,Y) :- sibling(X,Y), isFemale(X).

brotherOf(X,Y) :- sibling(X,Y), male(X).
bortherOf(X,Y) :- sibling(X,Y), isMale(X).

%helping function 
atLeastOneParent(X,Y) :- (motherOf(Z,X), motherOf(Z,Y) ; fatherOf(W,X), fatherOf(W,Y) ).
atLeastTwoParents(X,Y) :- (motherOf(Z,X), motherOf(Z,Y) , fatherOf(W,X), fatherOf(W,Y) ).
stepSibling(X,Y) :- atLeastOneParent(X,Y), \+atLeastTwoParents(X,Y), \+pet(X), \+pet(Y), X \= Y.

getSpecies(X,Y) :- species(X,Y).

isMale(A) :- male(A).
isMale(A) :- parentOf(B, Y), parentOf(A, Y), A \= B, female(B).

isFemale(A) :- female(A).
isFemale(A) :- parentOf(B, Y), parentOf(A, Y), A \= B, male(B).

pet(X) :- owns(Y,X), ( isMale(X) ; isFemale(X) ).

%helper function
human(X) :- \+pet(X).
isNonLivingThing(car).
isNonLivingThing(house).
isLivingThing(X) :- \+isNonLivingThing(X),\+pet(X).

feral(X) :- parentOf(Y,X), owns(W,Y), \+owns(Z,X).

