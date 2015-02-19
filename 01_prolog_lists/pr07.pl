% 1.07 (**) Flatten a nested list structure.
%    Transform a list, possibly holding lists as elements into a 'flat' list by replacing each list with its elements (recursively).
%
%    Example:
%    ?- my_flatten([a, [b, [c, d], e]], X).
%    X = [a, b, c, d, e]
%
%    Hint: Use the predefined predicates is_list/1 and append/3

list_append(L, [], L).
list_append(L1, [H|T], L2) :- list_append(L1, H, LT), list_append(LT, T, L2).

list_append([], X, [X]).
list_append([X], Y, [X,Y]).
list_append([H|T], X, [H|T2]) :- list_append(T,X,T2).

to_flat(I, O) :- list_append([], I, O).

%%%
%%% tests
%%%
% append
test_a1 :- list_append([a,b,c], [], A), A=[a,b,c].
test_a2 :- list_append([a,b,c], [d], B), B=[a,b,c,d].
test_a3 :- list_append([a,b,c], d, C), C=[a,b,c,d].
test_a4 :- list_append([a], b, D), D=[a,b].
test_a :- test_a1, test_a2, test_a3, test_a4.

% total
test1 :- to_flat([], A), A=[].
test2 :- to_flat([a], B), B=[a].
test3 :- to_flat([a,b,c], C), C=[a,b,c].
test4 :- to_flat([a,[b],c], D), D=[a,b,c].
test5 :- to_flat([a,[b,[c],d],e], E), E=[a,b,c,d,e].
test6 :- to_flat([[[a,b,c]]], F), F=[a,b,c].

test :- test1, test2, test3, test4, test5, test6.
