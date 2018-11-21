#include <gestion_clavier.h>


char snake_get_pressed_key()
{
	char key = NO_KEY;
	
	init_keyboard();
	
	if( keyboard_hit() != NO_KEY )
	{
		do{
			key = readch();
		}while( keyboard_hit() != NO_KEY  );
	}
	
	/*TO DO récupérer flèche directionnelle 
	 * 	=> pas évident car c'est une suite de caractère...*/	
	close_keyboard();
	
	return key;
}