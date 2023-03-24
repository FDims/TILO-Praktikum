%Aufgabe 1

%A)
%lisListe(Xs) : Xs handelt sich um eine gültige Liste.
linListe(nil).
linListe(list(X,Xs)) :- linListe(Xs).

%B)
%zusätzliche funktion.
%app(Xs,Ys,Rs) :- Rs ist die angehängte Liste Ys an die Liste Xs.
app(nil,Ys,Ys).
app(list(X,Xs),Ys,list(X,Rs)):- app(Xs,Ys,Rs).

%member2(X,Ys) : Liste Ys enthält das Element X.
member2(X,list(X,Xs)):- linListe(Xs).
member2(X,list(Y,Ys)):- member2(X,Ys),linListe(Ys).

%infix(Xs,Ys) : Liste Ys enthält die Liste Xs.
infix(Xs,Ys):- app(As,Xs,Es),app(Es,Bs,Ys).

%attach(Xs,X,Ys) : Liste Ys ist die Liste Xs verlängert um das Element X.
attach(nil,X,list(X,nil)).
attach(Xs,X,Ys):- app(Xs,list(X,nil),Ys).

%rev(Xs,Ys) : Liste Ys ist die gespiegelte Liste Xs.
rev(nil,nil).
rev(list(X,Xs),Ys):- rev(Xs,X1),app(X1,list(X,nil),Ys).


%Aufgabe 2
%binbaum(Xb) : Xb ist ein Binärbaum.
binbaum(empty).
binbaum(node(X,Lb,Rb)):- binbaum(Lb),binbaum(Rb).

%construct(Root,Lb,Rb,Xneub):Xneub ist der Baum mit
%////Wurzelbeschriftung Root, linkem Teilbaum Lb und rechtem Teilbaum Rb.
construct(Root,Lb,Rb,node(Root,Lb,Rb)):- binbaum(Lb),binbaum(Rb).

%zusätzliche funktion.
%add(X,Y,X1): X1 = X+Y.
add(o,X,X).
add(s(X),Y,s(X1)) :- add(X,Y,X1).

%knotenanz(Xb,N) : N (nat. Zahl in symbolischer Darstellung) ist
%////////die Anzahl der Knoten des Baumes Xb.
knotenanz(empty,o).
knotenanz(node(Root,empty,empty),s(o)).
knotenanz(node(Xb,Lb,Lr),s(N)) :-  knotenanz(Rb,Nr), knotenanz(Lb,Nl), add(Nr,Nl,N).
