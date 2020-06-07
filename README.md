# prepoznavanje_uporabnika_tipkovnice
Navodila za uporabo (Matlab only):

1.) Naložiti si je potrebno psychtoolbox, dostopen na naslednjem linku: http://psychtoolbox.org/download.html

2.) Najprej vam svetujem, da si kar kopirate vsebino zip-a, v določeno mapo in se z matlabom premaknete tja.

3.) Predlagam, da si nato odprete mapo "tests" in nato odprete datoteko GNU_Linux.txt v svojem izbranem txt editorju. (Saj ga boste potem, ko zažete program morali prepisati)

4.) Vsak od nas ima 5 testov prepisovanja te .txt datoteke. Predlagam, da vi storite enako.

    To pomeni poženete funkcijo saveMeasure(user, text, i) - kjer
        user predstavlja ime uporabnika,
        text predstavlja ime texta (sedaj se kar omejimo na  GNU_Linux.txt) in
        i predstavlja številko testa.
        
        Primer za 2 različna testa: 
        
            a) saveMeasure("Matej",  "GNU_Linux.txt", 1)
            b) saveMeasure("Matej",  "GNU_Linux.txt", 2)
        
Matrika se bo shranila v mapo "tests", in ustrezno mapo, kateri ime je enako user.

5.) Takoj ko v consoli poženete saveMeasure(user, text, i), se bo začelo izvajanje merjenje tipk, zato vtipkajte samo priložen txt. 
    Merjenje poteka tudi, če vi prepisujete txt kam drugam (npr. txt editor ali word - samo bodite pozorni, da ne uporabite kakšnih         "shortcutov" kot npr Alt + Tab ko zamenjate okna, vendar to naredite z miško)

6.) Ko ste prepisali tekst pritisnite tipko esc in test se bo samodejno shranil.

7.) Ko boste naredili 5 testnih primerov, lahko tudi testirate naš projekt, tako da tokrat zaženete main() in
pretipkate
 text. Tokrat, ko pritisnete esc, se ne bo shranila matrika, vendar se bo izpisal uporabnik, za katerega program meni, da je ta txt napisal.
