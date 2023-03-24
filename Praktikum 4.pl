%präfix(Xs,Ys) : Ys beginnt mit der Liste Ys.
präfix(Xs,Ys):- append(Xs,Hs,Ys).

%postfix(Xs,Ys) : Liste Ys endet mit der Liste Xs.
postfix(Xs,Ys):-reverse(Xs,Rxs), reverse(Ys,Rys), präfix(Rxs,Rys).
postfix(Xs,Ys):-append(Hs,Xs,Ys).

%membertree(X,Xb): Baum Xb enthält den Eintrag X.
membertree(X,node(X,Lb,Rb)).
membertree(X,node(Root,Lb,Rb)):-membertree(X,Lb).
membertree(X,node(Root,Lb,Rb)):-membertree(X,Rb).

%präorder(Xb,Ys):Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb in Präorder.
präorder(empty,[]).
präorder(node(X,Lb,Rb),[X|Xs]):-präorder(Lb,Xls),präorder(Rb,Xrs),append(Xls,Xrs,Xs).

%postorder(Xb,Ys):Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb in Postorder.
postorder(empty,[]).
postorder(node(X,Lb,Rb),Ys):-postorder(Lb,Yls),postorder(Rb,Yrs),append(Yls,Yrs,Ya),append(Ya,[X],Ys).

%roots(Xbs,Ys):Xbs ist eine Liste von Binärbäumen (geschachtelte Induktion).
% Die Liste Ys ist die Liste der Wurzelbeschriftungen der Binärbäume in Xbs in der richtigen Reihen- folge.
roots([],[]).
roots([empty|Xbs],Ys):-roots(Xbs,Ys).
roots([node(X,Lb,Rb)|Xbs],[X|Ys]):-roots(Xbs,Ys).
