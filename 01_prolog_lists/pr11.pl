% 1.11 (*) Modified run-length encoding.
%     Modify the result of problem 1.10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as [N,E] terms.
%
%     Example:
%     ?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [[4,a],b,[2,c],[2,a],d,[4,e]]

list_append([], X, [X]).
list_append([X], Y, [X,Y]).
list_append([H|T], X, [H|T2]) :- list_append(T,X,T2).

pack_list(X, 1, [], RT, R) :- list_append(RT, X, R), !.
pack_list(X, K, [], RT, R) :- list_append(RT, [K, X], R).
pack_list(C, K, [C|T], RT, R) :- K2 is K+1, pack_list(C, K2, T, RT, R), !.
pack_list(C1, 1, [C2|T], RT, R) :- list_append(RT, C1, RT2), pack_list(C2, 1, T, RT2, R), !.
pack_list(C1, K, [C2|T], RT, R) :- list_append(RT, [K, C1], RT2), pack_list(C2, 1, T, RT2, R).

pack([], []).
pack([H|T], O) :- pack_list(H, 1, T, [], O).

% tests
test1 :- pack([a], A), A=[a].
test2 :- pack([a, a], B), B=[[2, a]].
test3 :- pack([a, a, b, b], C), C=[[2, a], [2, b]].
test4 :- pack([a, b, c], D), D=[a, b, c].
test5 :- pack([a, a, b, b, c, d, d, d, d, c, c], A), A=[[2, a], [2, b], c, [4, d], [2, c]].

test :- test1, test2, test3, test4, test5.
