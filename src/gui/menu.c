#include <gui/menu.h>
#include <couleur_console.h>
#include <utils/constants.h>

static int selected;

int snake_game_menu()
{
    selected = START_NEW_GAME;
    print_menu();

    return STOP_PLAYING;
}

static void print_menu()
{
    effacer_ecran();

    couleur_fond(BLANC);
    couleur_texte(GRAS);

    printf("%s\n", GAME_MENU_TITLE);

    couleur_reset();

    // new game
    snake_print_menu_item(START_NEW_GAME, START_NEW_GAME_MENU);

    // see scoreboard
    snake_print_menu_item(SEE_SCOREBOARD, SEE_SCOREBOARD_MENU);

    // edit settings
    snake_print_menu_item(EDIT_SETTINGS, EDIT_SETTINGS_MENU);

    // quit game
    snake_print_menu_item(STOP_PLAYING, STOP_PLAYING_MENU);
}

static void snake_print_menu_item(int select_condition, char* text)
{
    if (selected == select_condition)
    {
        couleur_texte(VERT);
        couleur_texte(GRAS);
        printf("%c", SELECT_CHARACTER);
        couleur_reset();
    }
    else
    {
        printf(" ");
    }

    printf(" %s\n", text);
}