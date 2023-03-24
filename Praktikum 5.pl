/*G={V,Sigma,S,P}
G({S,A,B,C},{a,b},S,P)
V = {S,A,B,C}
Sigma = {a,b}
S = Startsymbol
P ={ S -> aS
     S -> bS
     S -> bA
     A -> aB
     B -> bC
     B -> b
     C -> aC
     C -> bC
     C -> a
     C -> b
     }
Eine Sprache, die das Wort "bab" enthalten muss.*/

%Aufgabe A.
%NEA = (Z,Sigma,Delta,Z0,Ed).

%Z=endliche Zustandmenge.
zustand(vS).
zustand(vA).
zustand(vB).
zustand(vC).
zustand(vEd).

%Sigma(ab).
sigma(a).
sigma(b).

%Z0 = Startzustand.
startzustand(vS).

%Ed = Endzustand.
endzustand(vEd).

%Delta = Transitionsfunktion.
delta(vS,a,vS).
delta(vS,b,vS).
delta(vS,b,vA).
delta(vA,a,vB).
delta(vB,b,vC).
delta(vB,b,vEd).
delta(vC,a,vC).
delta(vC,b,vC).
delta(vC,a,vEd).
delta(vC,b,vEd).


%Aufgabe B.
%delta_stern(AktZ,Ws,NeuZ) = erweiterung der Transitionsrelation.
delta_stern(AktZ,[],AktZ).
delta_stern(AktZ,[A|Ws],NeuZ):- delta_stern(X1,Ws,NeuZ),delta(AktZ,A,X1).

%sigma_stern(Ws) = der Menge Ws der Wörter über Sigma benötigt.
sigma_stern([]).
sigma_stern([A|Ws]):-sigma_stern(Ws),sigma(A).

%lvonN(Ws)= oben definierte NEA zu erkennen.
lvonN(Ws):-sigma_stern(Ws),startzustand(S),endzustand(Ed),delta_stern(S,Ws,Ed).
