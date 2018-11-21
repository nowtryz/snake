#include <utils/constants.h>
#include <models/config.h>

static config configutations = {
    // clock_delay
    DEFAULT_CLOCK_DELAY,
    // board_height
    DEFAULT_BOARD_HEIGHT,
    // board_width
    DEFAULT_BOARD_WIDTH
};

void reset_conf()
{
    configutations.clock_delay = DEFAULT_CLOCK_DELAY;
    configutations.board_height = DEFAULT_BOARD_HEIGHT;
    configutations.board_width = DEFAULT_BOARD_WIDTH;
}

config* snake_configutations()
{
    return &configutations;
}