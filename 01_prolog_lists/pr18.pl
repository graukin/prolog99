% 1.18 (**) Extract a slice from a list.
%     Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.
%
%     Example:
%     ?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
%     X = [c,d,e,f,g]

slice([], _, _, []).
slice(_, S, E, []) :- S<2, E<1.
slice([H|T], 1, N, [H|B]) :- N1 is N-1, slice(T, 1, N1, B).
slice([_|T], S, E, B) :- S>0, S1 is S-1, E1 is E-1, slice(T,S1,E1,B).

test1 :- slice([a,b,c,d,e,f,g], 1, 1, [a]).
test2 :- slice([a,b,[c,d],e,f,g], 3, 4, [[c,d],e]).
test :- test1, test2.
