% 1.03 (*) Find the K'th element of a list.
%    The first element in the list is number 1.
%    Example:
%    ?- element_at(X,[a,b,c,d,e],3).
%    X = c

elem_n([],_,0). % empty result on position=0
elem_n([],[],_). % empty result for empty input
elem_n(X,[X|_],1).
elem_n(X,[X],1).
elem_n(X,[_|T],N) :- N>0, N1 is N-1, elem_n(X,T,N1).

test1 :- elem_n(X,[a,b,c,d],0), X=[].
test2 :- elem_n(X,[],2), X=[].
test3 :- elem_n(X,[a,b,c,d],1), X=a.
test4 :- elem_n(X,[a,b,c,d],3), X=c.
test5 :- elem_n(X,[a,b,c,d],4), X=d.
test6 :- elem_n(X,[a,b,c,d],5), X=[].
test7 :- elem_n(X,[a,b,[c,d]],3), X=[c,d].

tests :- test1, test2, test3, test4, test5, test6, test7.
