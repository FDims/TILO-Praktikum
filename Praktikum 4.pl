%pr�fix(Xs,Ys) : Ys beginnt mit der Liste Ys.
pr�fix(Xs,Ys):- append(Xs,Hs,Ys).

%postfix(Xs,Ys) : Liste Ys endet mit der Liste Xs.
postfix(Xs,Ys):-reverse(Xs,Rxs), reverse(Ys,Rys), pr�fix(Rxs,Rys).
postfix(Xs,Ys):-append(Hs,Xs,Ys).

%membertree(X,Xb): Baum Xb enth�lt den Eintrag X.
membertree(X,node(X,Lb,Rb)).
membertree(X,node(Root,Lb,Rb)):-membertree(X,Lb).
membertree(X,node(Root,Lb,Rb)):-membertree(X,Rb).

%pr�order(Xb,Ys):Ys ist die Liste der Knotenbeschriftungen des Bin�rbaumes Xb in Pr�order.
pr�order(empty,[]).
pr�order(node(X,Lb,Rb),[X|Xs]):-pr�order(Lb,Xls),pr�order(Rb,Xrs),append(Xls,Xrs,Xs).

%postorder(Xb,Ys):Ys ist die Liste der Knotenbeschriftungen des Bin�rbaumes Xb in Postorder.
postorder(empty,[]).
postorder(node(X,Lb,Rb),Ys):-postorder(Lb,Yls),postorder(Rb,Yrs),append(Yls,Yrs,Ya),append(Ya,[X],Ys).

%roots(Xbs,Ys):Xbs ist eine Liste von Bin�rb�umen (geschachtelte Induktion).
% Die Liste Ys ist die Liste der Wurzelbeschriftungen der Bin�rb�ume in Xbs in der richtigen Reihen- folge.
roots([],[]).
roots([empty|Xbs],Ys):-roots(Xbs,Ys).
roots([node(X,Lb,Rb)|Xbs],[X|Ys]):-roots(Xbs,Ys).
