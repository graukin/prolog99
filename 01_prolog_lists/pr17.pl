% 1.17 (*) Split a list into two parts; the length of the first part is given.
%     Do not use any predefined predicates.
% 
%     Example:
%     ?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
%     L1 = [a,b,c]
%     L2 = [d,e,f,g,h,i,k]

split([], _, [], []) :- !.
split(A, 0, [], A) :- !.
split([H|T], N, [H|T2], B) :- N1 is N-1, split(T, N1, T2, B).

test1 :- split([a,b,c,d], 0, A, B), A=[], B=[a,b,c,d].
test2 :- split([a,b,c,d], 1, C, D), C=[a], D=[b,c,d].
test3 :- split([a,b,c,d], 4, E, F), E=[a,b,c,d], F=[].
test :- test1, test2, test3.
