% 1.13 (**) Run-length encoding of a list (direct solution).
%     Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 1.09, but only count them. As in problem 1.11, simplify the result list by replacing the singleton terms [1,X] by X.
%
%     Example:
%     ?- encode_direct([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [[4,a],b,[2,c],[2,a],d,[4,e]]
list_append([], X, [X]).
list_append([X], Y, [X,Y]).
list_append([H|T], X, [H|T2]) :- list_append(T,X,T2).

pack_list(C, 1, [], RT, R) :- list_append(RT, C, R), !.
pack_list(C, I, [], RT, R) :- list_append(RT, [I, C], R), !.
pack_list(C, I, [C|T], RT, R) :- I1 is I+1, pack_list(C, I1, T, RT, R), !.
pack_list(C1, 1, [C2|T], RT, R) :- list_append(RT, C1, RT2), pack_list(C2, 1, T, RT2, R), !.
pack_list(C1, I, [C2|T], RT, R) :- list_append(RT, [I, C1], RT2), pack_list(C2, 1, T, RT2, R).

pack([], []).
pack([H|T], O) :- pack_list(H, 1, T, [], O).

% tests
test1 :- pack([a], A), A=[a].
test2 :- pack([a, a], B), B=[[2, a]].
test3 :- pack([a, a, b, b], C), C=[[2, a], [2, b]].
test4 :- pack([a, b, c], D), D=[a, b, c].
test5 :- pack([a, a, b, b, b, c, d, d, d, d, c, c], A), A=[[2, a], [3, b], c, [4, d], [2, c]].

test :- test1, test2, test3, test4, test5.
