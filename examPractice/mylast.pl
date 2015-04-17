mylast([X],X).
mylast([_|T],X) :- mylast(T,X).
