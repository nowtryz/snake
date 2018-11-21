#include <utils/constants.h>
#include <gui/menu.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
    int action = KEEP_PLAYING;

    do {
        action = snake_game_menu();

        switch (action) {
            default: printf("Things are going bad...\n");
        }
    } while(action != STOP_PLAYING);
    
    return 0;
}
