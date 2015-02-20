% 1.10 (*) Run-length encoding of a list.
%     Use the result of problem 1.09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.
%
%     Example:
%     ?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]

list_append([], X, [X]).
list_append([X], Y, [X,Y]).
list_append([H|T], X, [H|T2]) :- list_append(T,X,T2).

pack_list(X, K, [], RT, R) :- list_append(RT, [K, X], R).
pack_list(C, K, [C|T], RT, R) :- K2 is K+1, pack_list(C, K2, T, RT, R), !.
pack_list(C1, K, [C2|T], RT, R) :- list_append(RT, [K, C1], RT2), pack_list(C2, 1, T, RT2, R).

pack([], []).
pack([H|T], O) :- pack_list(H, 1, T, [], O).

% tests
test1 :- pack([a], A), A=[[1, a]].
test2 :- pack([a, a], B), B=[[2, a]].
test3 :- pack([a, a, b, b], C), C=[[2, a], [2, b]].
test4 :- pack([a, b, c], D), D=[[1, a], [1, b], [1, c]].
test5 :- pack([a, a, b, b, c, d, d, d, d, c, c], A), A=[[2, a], [2, b], [1, c], [4, d], [2, c]].

test :- test1, test2, test3, test4, test5.
