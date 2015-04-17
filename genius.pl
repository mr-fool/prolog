invented(edison,lightbulb).
invented(colmeraurer,prolog).
iq(einstein,210).
iq(edison,160).
iq(waldorf,90).
genius(Person):-
	iq(Person,IQ),
	IQ > 150.
genius(Person):-
	invented(Person,_).
smart_invention(Invention):- invented(Person,Invention), iq(Person,IQ), IQ >= 160 .
no_beam:-
	genius(Person),
	write('I found intelligent life, sir!'), nl.
