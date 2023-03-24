%männlich(X) : X ist männlich.
mannlich(terach).
mannlich(abraham).
mannlich(nachor).
mannlich(isaak).
mannlich(lot).
mannlich(klaus).

%weiblich(X) : X ist weiblich.
weiblich(sarah).
weiblich(milcah).
weiblich(yiscah).

%elter(X,Y) : X ist Elter von Y.
elter(terach,abraham).
elter(terach,nachor).
elter(terach,sarah).
elter(yiscah,abraham).
elter(yiscah,nachor).
elter(yiscah,sarah).
elter(isaak,terach).
elter(isaak,lot).
elter(lot,milcah).
elter(lot,klaus).


%vater(X,Y):X ist vater von Y.
vater(X,Y):-elter(X,Y),mannlich(X).

%mutter(X,Y):X ist Mutter von Y.
mutter(X,Y):-elter(X,Y),weiblich(X).

%sohn(X,Y):X ist Sohn von Y.
sohn(X,Y):-elter(Y,X),mannlich(X).

%tochter(X,Y):X ist Tochter von Y.
tochter(X,Y):-elter(Y,X),weiblich(Y).

%bruder(X,Y): X ist Bruder von Y.
bruder(X,Y):-elter(Zelter,X),elter(Zelter,Y),mannlich(X),X\=Y.

%schwester(X,Y): X ist Schwester von Y.
schwester(X,Y):-elter(Zelter,X),elter(Zelter,Y),weiblich(X),X\=Y.

%onkel(X,Y):X ist Onkel von Y.
onkel(X,Y):-elter(Zelter,Y),bruder(X,Zelter).

%cousine(X,Y): X ist Cousine von Y.
cousine(X,Y):-elter(Zonkeltante,X),elter(Zelter,Y),elter(Zgrosselter,Zonkeltante),elter(Zgrosselter,Zelter),weiblich(X),Zelter\=Zonkeltante.

%grossvater(X,Y): X ist Großvater von Y.
grossvater(X,Y):-elter(Zelter,Y),elter(X,Zelter),mannlich(X).







