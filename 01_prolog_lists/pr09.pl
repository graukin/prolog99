% 1.09 (**) Pack consecutive duplicates of list elements into sublists.
%     If a list contains repeated elements they should be placed in separate sublists.
%
%     Example:
%     ?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
list_append([], X, [X]).
list_append([X], Y, [X,Y]).
list_append([H|T], X, [H|T2]) :- list_append(T,X,T2).

pack_list(_, L, [], RT, R) :- list_append(RT, L, R).
pack_list(C, L, [C|T], RT, R) :- list_append(L, C, L2), pack_list(C, L2, T, RT, R), !.
pack_list(C1, L, [C2|T], RT, R) :- list_append(RT, L, RT2), pack_list(C2, [C2], T, RT2, R).

pack([], []).
pack([H|T], O) :- pack_list(H, [H], T, [], O).

% tests
test1 :- pack([a], A), A=[[a]].
test2 :- pack([a, a], B), B=[[a, a]].
test3 :- pack([a, a, b, b], C), C=[[a, a], [b, b]].
test4 :- pack([a, b, c], D), D=[[a], [b], [c]].
test5 :- pack([a, a, b, b, c, d, d, d, d, c, c], A), A=[[a, a], [b, b], [c], [d, d, d, d], [c, c]].

test :- test1, test2, test3, test4, test5.
