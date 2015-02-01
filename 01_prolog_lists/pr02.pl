% 1.02 (*) Find the last but one element of a list.
%    (de: zweitletztes Element, fr: avant-dernier élément)

pre_last([],[]).
pre_last([],[X]).
pre_last(X,[X,_]).
pre_last(X,[_|T]) :- pre_last(X,T).

test1 :- pre_last(A,[]), A = [].
test2 :- pre_last(B,[a]), B = [].
test3 :- pre_last(C,[a,b]), C = a.
test4 :- pre_last(D,[a,b,c,d]), D = c.

tests :- test1, test2, test3, test4.
