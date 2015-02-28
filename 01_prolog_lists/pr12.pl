% 1.12 (**) Decode a run-length encoded list.
%     Given a run-length code list generated as specified in problem 1.11. Construct its uncompressed version.
%     X = [[4,a],b,[2,c],[2,a],d,[4,e]]

list_append([X], [], [X]).
list_append([], [X], [X]).
list_append([], [H|T], [H|T]).
list_append([X], [H|T], R) :- list_append([X], H, TT), list_append(TT, T, R).
list_append([], X, [X]).
list_append([X], Y, [X,Y]).
list_append([H|T], X, [H|T2]) :- list_append(T,X,T2).

repeat_sym(1, X, [X]).
repeat_sym(K, X, [X|T]) :- K1 is K-1, repeat_sym(K1, X, T).

unpack([], []).
unpack([[K, V]], R) :- repeat_sym(K, V, R), !.
unpack([X], [X]).
unpack([H|T], R) :- unpack([H],HR), unpack(T, TR), list_append(HR, TR, R).

% tests
test_r1 :- repeat_sym(1, a, A), A=[a].
test_r2 :- repeat_sym(3, a, A), A=[a,a,a].
test_r3 :- repeat_sym(2, a, A), A=[a,a].
test_r :- test_r1, test_r2, test_r3.

test1 :- unpack([a], A), A=[a].
test2 :- unpack([[2, a]], B), B=[a, a].
test3 :- unpack([[2, a], [2, b]], C), C=[a, a, b, b].
test4 :- unpack([a, b, c], D), D=[a, b, c].
test5 :- unpack([[2, a], [2, b], c, [4, d], [2, c]], E), E=[a, a, b, b, c, d, d, d, d, c, c].

test :- test1, test2, test3, test4, test5.
