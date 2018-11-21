/* ******************* *
 * Game constants file *
 * ******************* */

/*
 * Default properties
 */

// Delay in seconds
#define DEFAULT_CLOCK_DELAY  1
// Height in char
#define DEFAULT_BOARD_HEIGHT 15
// Width in char
#define DEFAULT_BOARD_WIDTH  35

/*
 * Logic constants
 */

#define START_NEW_GAME 1
#define SEE_SCOREBOARD 2
#define EDIT_SETTINGS  3
#define STOP_PLAYING   4

#define KEEP_PLAYING  START_NEW_GAME
#define MAX_SELECTION STOP_PLAYING

/*
 * Texts
 */

#define GAME_MENU_TITLE     "           >> SNAKE <<           "
#define START_NEW_GAME_MENU   "Commencer une nouvelle partie"
#define SEE_SCOREBOARD_MENU   "Voir le tableau des scores"
#define EDIT_SETTINGS_MENU    "Modifier les configurations"
#define STOP_PLAYING_MENU     "Quiter"
/*
 * Characters
 */

#define SELECT_CHARACTER '>'