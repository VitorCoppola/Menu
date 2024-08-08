// Evento Game End do obj_settings
ini_open("settings.ini");
ini_write_real("Audio", "Volume", global.volume); // Salvar o volume global
ini_write_bool("Display", "Fullscreen", fullscreen);
ini_close();
