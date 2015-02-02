% 1.05 (*) Reverse a list.

list_append([], X, [X]).
list_append([X], Y, [X,Y]).
list_append([H|T], X, [H|T2]) :- list_append(T,X,T2).

rev_list([], []).
rev_list([X], [X]).
rev_list([X,Y], [Y,X]).
rev_list([H|T], L) :- rev_list(T,T2), list_append(T2, H, L).

test_a1 :- list_append([], a, A), A=[a].
test_a2 :- list_append([a,b,c,d], e, B), B=[a,b,c,d,e].
test_a3 :- list_append([a,b,c,d], [e], C), C=[a,b,c,d,[e]].

test_a :- test_a1, test_a2, test_a3.

test_r1 :- rev_list([], A), A=[].
test_r2 :- rev_list([a], B), B=[a].
test_r3 :- rev_list([a,b], C), C=[b,a].
test_r4 :- rev_list([a,b,c,d], D), D=[d,c,b,a].
test_r5 :- rev_list([a,[b,c],d], E), E=[d,[b,c],a].

test_r :- test_r1, test_r2, test_r3, test_r4, test_r5.
test :- test_a, test_r.
