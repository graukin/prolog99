% 1.06 (*) Find out whether a list is a palindrome.
%    A palindrome can be read forward or backward; e.g. [x,a,m,a,x].

% reverse list // from problem 1.05
list_append([], X, [X]).
list_append([X], Y, [X,Y]).
list_append([H|T], X, [H|T2]) :- list_append(T,X,T2).

rev_list([], []).
rev_list([X], [X]).
rev_list([X,Y], [Y,X]).
rev_list([H|T], L) :- rev_list(T,T2), list_append(T2, H, L).

% check reverse
palindrome(A) :- rev_list(A, A).

test1 :- palindrome([a,b,c,d,c,b,a]).
test2 :- palindrome([a]).
test3 :- palindrome([a,[b,c],d,[b,c],a]).
test4 :- palindrome([a,b,b,a]).

test :- test1, test2, test3, test4.
