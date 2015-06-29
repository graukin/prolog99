% 1.15 (**) Duplicate the elements of a list a given number of times.
%     Example:
%     ?- dupli([a,b,c],3,X).
%     X = [a,a,a,b,b,b,c,c,c]
% 
%     What are the results of the goal:
%     ?- dupli(X,3,Y).
el_append([], X, [X]).
el_append([X], Y, [X,Y]).
el_append([H|T], X, [H|T2]) :- el_append(T,X,T2).

list_append([], X, X).
list_append(X, [], X).
list_append(X, [H|T], R) :- el_append(X, H, RT), list_append(RT, T, R).

duplicateN([], _, []).
duplicateN([_], 0, []).
duplicateN([X], 1, [X]).
duplicateN([X], K, [X|T]) :- K1 is K-1, duplicateN([X], K1, T).
duplicateN([H|T], K, R) :- duplicateN([H], K, H1), duplicateN(T, K, T1), list_append(H1, T1, R).

% tests
test1 :- duplicateN([a], 1, A), A=[a].
test2 :- duplicateN([a], 2, B), B=[a, a].
test3 :- duplicateN([a], 3, C), C=[a, a, a].
test4 :- duplicateN([a, b, c], 3, D), D=[a, a, a, b, b, b, c, c, c].
test5 :- duplicateN([a, a, a, b, b, c, d, d, d], 4, E), E=[a, a, a, a, a, a, a, a, a, a, a, a, b, b, b, b, b, b, b, b, c, c, c, c, d, d, d, d, d, d, d, d, d, d, d, d].

test :- test1, test2, test3, test4, test5.
