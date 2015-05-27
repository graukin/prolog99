% 1.14 (*) Duplicate the elements of a list.
%     Example:
%     ?- dupli([a,b,c,c,d],X).
%     X = [a,a,b,b,c,c,c,c,d,d]
list_append([X], [], [X]).
list_append([], [X], [X]).
list_append([], [H|T], [H|T]).
list_append([X], [H|T], R) :- list_append([X], H, TT), list_append(TT, T, R).
list_append([], X, [X]).
list_append([X], Y, [X,Y]).
list_append([H|T], X, [H|T2]) :- list_append(T,X,T2).

duplicate([], []).
duplicate([X], [X, X]).
duplicate([H|T], R) :- duplicate([H], H1), duplicate(T, T1), list_append(H1, T1, R).

% test
test1 :- duplicate([a], A), A=[a, a].
test2 :- duplicate([a, b], B), B=[a, a, b, b].
test3 :- duplicate([a, a], C), C=[a, a, a, a].
test4 :- duplicate([[a], b, b, cc], D), D = [[a], [a], b, b, b, b, cc, cc].

test :- test1, test2, test3, test4.
