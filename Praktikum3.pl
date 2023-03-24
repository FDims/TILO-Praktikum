app(nil,Xs,Xs).
app(list(X,X1s),Ys,list(X,X2s)):- app(X1s,Ys,X2s).

%Überpruft, ob
linListe(nil).
linListe(list(_,Xs)):-linListe(Xs).

%member2(X,Ys) : Liste Ys enthält das Element X.
member2(X,list(X,_)).
member2(X,list(_,Ys)):-member2(X,Ys).

%infix(Xs,Ys) : Liste Ys enthält die Liste Xs.
infix(Xs,Ys):-app(_,Xs,Hs),app(Hs,_,Ys).

%attach(Xs,X,Ys) : Liste Ys ist die Liste Xs verlängert um das Element X.
attach(Xs,X,list(X,Xs)).

%rev(Xs,Ys) : Liste Ys ist die gespiegelte Liste Xs.
rev(nil,nil).
rev(list(X,Xs),Ys):-rev(Xs,Y1s),app(Y1s,list(X,nil),Ys).

binbaum(nil).
binbaum(baum(X,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).

%construct: construct(Root,Lb,Rb,Xneub)
construct(X,Lb,Rb,baum(X,Lb,Rb)).

%knotenanz(Xb,N): N ist die Konotenanzahl der Liste Xb
%Basisfall: Null Knoten Anzahl null.
%Rekursion durch linken Teilbum bis zum Ende von dort jeweils der Rechte Baum
knotenanz(nil,o).
knotenanz(baum(X,Lb,Rb),s(N)) :- knotenanz(Lb,H1),knotenanz(Rb,H2),add(H1,H2,N).
