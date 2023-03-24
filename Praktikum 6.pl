%Aufgabe a.
%PDA fuer gerade Palindrome.
%M =(Z,Sigma,Gamma,Delta,vZ0,hashtag).

%Zustandmenge:Zustaende, die im PDa gebraucht werden.
zustand(vZ0).
zustand(vZ1).

%Sigma:Woerter.
sigma(0).
sigma(1).

%Gamma: Woerter auf dem Keller.
gamma(0).
gamma(1).
gamma(hashtag).

%Startvariable : Anfang Zustand.
start(vZ0).

%symbol(#) : unterste Symbol auf dem Keller.
symbol(hashtag).
 
%delta : Transitionsrelation.
%1.Haelfte (lesen).
delta(vZ0,1,hashtag,vZ0,[1,hashtag]).
delta(vZ0,1,0,vZ0,[1,0]).
delta(vZ0,1,1,vZ0,[1,1]).
 
delta(vZ0,0,hashtag,vZ0,[0,hashtag]).
delta(vZ0,0,0,vZ0,[0,0]).
delta(vZ0,0,1,vZ0,[0,1]).

%1.Haelfte -> 2.Haelfte.
delta(vZ0,nix,hashtag,vZ1,[hashtag]).
delta(vZ0,nix,0,vZ1,[0]).
delta(vZ0,nix,1,vZ1,[1]).

%2.Haelfte (Vergleichen).
delta(vZ1,1,1,vZ1,[]).
delta(vZ1,nix,hashtag,vZ1,[]).
delta(vZ1,0,0,vZ1,[]).

%Aufgabe b.

%sigma_stern: Menge der Woerter(Sigma).
sigma_stern([]).
sigma_stern([X|Xs]):-sigma_stern(Xs),sigma(X).


%einzelschrittrelation.
es(X,[A|Ws],[G|Ss],X1,Ws,Send) :- delta(X,A,G,X1,S1),append(S1,Ss,Send).
es(X,Ws,[G|Ss],X1,Ws,Send):- delta(X,nix,G,X1,S1),append(S1,Ss,Send).

%es+ : transitiven Abschluss der Einzelschrittrelation.
es_plus(X,Ws,Ss,X1,Ws1,Send):-es(X,Ws,Ss,X1,Ws1,Send).
es_plus(X,Ws,Ss,X1,Ws1,Send):-es(X,Ws,Ss,HX1,HWs1,HSs),es_plus(HX1,HWs1,HSs,X1,Ws1,Send).

%lvonM:die allgemein der Sprache entspricht, die von dem in a) definierten PDA erkannt wird.
lvonM(Ws):-sigma_stern(Ws),zustand(Y1),start(K0),es_plus(K0,Ws,[hashtag],Y1,[],[]).

