% 1.08 (**) Eliminate consecutive duplicates of list elements.
%     If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
%
%     Example:
%     ?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [a,b,c,a,d,e]
list_append([], X, [X]).
list_append([X], Y, [X,Y]).
list_append([H|T], X, [H|T2]) :- list_append(T,X,T2).

list_pack_append(L, [], L).
list_pack_append(L, [X], LR) :- list_append(L, X, LR).
list_pack_append(L, [H1|[H1|T1]], LR) :- list_pack_append(L, [H1|T1], LR), !.
list_pack_append(L, [H1|[H2|T1]], LR) :- list_append(L, H1, L1), list_pack_append(L1, [H2|T1], LR).

list_pack(I, O) :- list_pack_append([], I, O).

% tests

test1 :- list_pack([], A), A=[].
test2 :- list_pack([a], B), B=[a].
test3 :- list_pack([a,b,c], C), C=[a,b,c].
test4 :- list_pack([a, a], D), D=[a].
test5 :- list_pack([a, a, a], E), E=[a].
test6 :- list_pack([a, a, b, b, b], F), F=[a, b].
test7 :- list_pack([a, a, a, a, a, b, b, b, b, c, d, d, e, f], G), G=[a, b, c, d, e, f].
test8 :- list_pack([a, a, a, b, b, a, a, c], H), H=[a, b, a, c].

test :- test1, test2, test3, test4, test5, test6, test7, test8.
