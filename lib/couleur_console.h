/* CALCADO Fabien 2012
 *
 * Bibliothèque permettant d'utiliser la couleur sous la console
 *
 * */

#ifndef COULEUR_CONSOLE_H
#define COULEUR_CONSOLE_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*effets*/
#define RESET 0
#define GRAS 1
#define SOULIGNE 4
#define CLIGNOTE 5
#define INVERSER 7
#define HIDDEN 8

#define GRAS_OFF 21 //on rajoute 20
#define SOULIGNE_OFF 24
#define CLIGNOTE_OFF 25

/*Couleur pour le texte*/
#define NOIR 30
#define ROUGE 31
#define VERT 32
#define JAUNE 33
#define BLEU 34
#define MAGENTA 35
#define CYAN 36
#define BLANC 37

/*Couleur pour le fond, decale de 10*/
/*
#define F_NOIR 40
#define F_ROUGE 41
#define F_VERT 42
#define F_JAUNE 43
#define F_BLEU 44
#define F_MAGENTA 45
#define F_CYAN 46
#define F_BLANC 47
*/

/*MACRO FONCTIONS*/
#define effacer_ecran() printf("\033[H\033[2J")
#define couleur_reset()	printf("\033[%dm",RESET)
#define couleur_texte(coul) printf("\033[%dm",coul)
#define couleur_fond(coul)	printf("\033[%dm",coul+10)

#define texte_effet(effet) printf("\033[%dm",effet)

#define texte_souligne_on()	printf("\033[%dm",SOULIGNE)
#define texte_souligne_off()	printf("\033[%dm",SOULIGNE_OFF)
#define texte_gras_on()	printf("\033[%dm",GRAS)
#define texte_gras_off()	printf("\033[%dm",GRAS_OFF) //marche pas :'(
#define texte_clignote_on()	printf("\033[%dm",CLIGNOTE)
#define texte_clignote_off()	printf("\033[%dm",CLIGNOTE_OFF)
#define inverser_fond_texte()	printf("\033[%dm",INVERSER)

/*SOUCIS car si c'est 0 ça fait un reset...*/
#define afficher_texte(texte,coul_texte,coul_fond,effet)	couleur_texte(coul_texte);	\
															couleur_fond(coul_fond);	\
															texte_effet(effet);			\
															printf("%s",texte);			\
															couleur_reset()

#define gotoxy(x,y) printf("\x1b[%d;%dH",y,x)

#endif
