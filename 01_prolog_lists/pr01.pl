% 1.01 (*) Find the last element of a list.
%    Example:
%    ?- my_last(X,[a,b,c,d]).
%    X = d

l_elem([], []).
l_elem(X, [X]).
l_elem(X, [_|T]) :- l_elem(X,T).

test1 :- l_elem(A,[]), A = [].
test2 :- l_elem(B,[a]), B = a.
test3 :- l_elem(C,[a,b,c,d]), C = d.
test4 :- l_elem(D,[a,b,[c,d]]), D = [c,d].

tests :- test1, test2, test3, test4.
