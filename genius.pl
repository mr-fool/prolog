invented(edision,lightbulb).
invented(colmeraurer,prolog).
iq(einstein,210).
iq(edison,160).
iq(waldorf,90).
genius(Person) :-
	iq(Person,Iq),
	IQ > 150.
genius(Person) :- invented(Person,_).

no_beam :- genius(Person), write('I found intelligent life, sir!'), nl.
