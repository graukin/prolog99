% 1.16 (**) Drop every N'th element from a list.
%     Example:
%     ?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
%     X = [a,b,d,e,g,h,k]

drop_l([], _, _, []).
drop_l([_|T], N, N, T2) :- drop_l(T, N, 1, T2), !.
drop_l([H|T], N, K, [H|T2]) :- K1 is K+1, drop_l(T, N, K1, T2).

drop([], _, []).
drop(X, 0, X).
drop(_, 1, []).
drop(X, N, Y) :- drop_l(X, N, 1, Y).

test1 :- drop([a, b, c, d], 2, A), A=[a, c].
test2 :- drop([a, b, c, d], 3, B), B=[a, b, d].
test3 :- drop([a, b, c, d, e, f, g, h, i], 3, C), C=[a, b, d, e, g, h].
test4 :- drop([a, b, c], 1, D), D=[].
test5 :- drop([[a], b, [c, d], e, [f, g, h]], 3, E), E=[[a], b, e, [f, g, h]].
test :- test1, test2, test3, test4, test5.
