% orangtua (nama orang tua, nama anak, nomor urut)
orangtua(danang,joko,1).
orangtua(danang,agus,2).
orangtua(joko,gisel,3).
orangtua(agus,jamal,4).
orangtua(ayu,jamal,5).
orangtua(agus,harto,6).
orangtua(jamal,bagas,7).
orangtua(gisel,bagas,8).
orangtua(bagas,tiara,9).
orangtua(rani,tiara,10).
orangtua(joko,karina,11).
orangtua(karina,rendi,12).
orangtua(ayu,farhan,13).
orangtua(agus,farhan,14).
orangtua(farhan, lili,15).
orangtua(sinta, lili,16).
orangtua(farhan, gabriel,17).
orangtua(sinta, gabriel,18).
orangtua(karina,jeno,19).

% anak
anak(X,Y) :- orangtua(Y,X,_).

% pasangan
pasangan(X,Y) :- orangtua(X,Z,_), orangtua(Y,Z,_), X \== Y.

% kakak
kakak(X,Y) :- orangtua(Z,X,N), orangtua(Z,Y,M), N < M.

% adik 
adik(X,Y) :- kakak(Y,X).

% pria
pria(agus).
pria(joko).
pria(jefry).
pria(jamal).
pria(harto).
pria(farhan).
pria(jeno).
pria(rendi).
pria(bagas).
pria(gabriel).

% wanita
wanita(ayu).
wanita(karina).
wanita(gisel).
wanita(sinta).
wanita(rani).
wanita(tiara).
wanita(lili).
	
% kakek
kakek(X, Z) :- pria(X), orangtua(X, Y, _), orangtua(Y, Z, _).

% nenek
nenek(X, Z) :- wanita(X), orangtua(X, Y, _), orangtua(Y, Z, _).

% buyut
buyut(X, Z) :- orangtua(X,Y,_), kakek(Y,Z).
buyut(X, Z) :- orangtua(X,Y,_), nenek(Y,Z).

% pakde
pakde(X, Z) :- pria(X),  kakak(X, Y), orangtua(Y, Z, _).

% bude
bude(X, Z) :- wanita(X),  kakak(X, Y), orangtua(Y, Z, _).

% paklik
paklik(X, Z) :- pria(X),  adik(X, Y), orangtua(Y, Z, _).

% bulik
bulik(X, Z) :- wanita(X),  adik(X, Y), orangtua(Y, Z, _).

% mertua
mertua(X,Y) :- pria(X), orangtua(X,Z,_), pasangan(Z, Y).

% keponakan
saudarakandung(Y,Z):-anak(Y,X),anak(Z,X).
ponakan(X,Y):-anak(X,Z),saudarakandung(Z,Y),not(anak(X,Y)).

% kakak ipar
kakakipar(X,Y) :- pasangan(Y,Z), kakak(X,Z).

% adik ipar
adikipar(X,Y) :- pasangan(Y,Z), adik(X,Z).