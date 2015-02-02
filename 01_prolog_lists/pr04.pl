% 1.04 (*) Find the number of elements of a list.

list_len([], 0).
list_len([_], 1).
list_len([_|T], L) :- list_len(T, LT), L is LT+1.

test1 :- list_len([], A), A=0.
test2 :- list_len([a], B), B=1.
test3 :- list_len([a,b,c,d], C), C=4.
test4 :- list_len([a,b,[c,d],e,f], D), D=5.

tests :- test1, test2, test3, test4.
