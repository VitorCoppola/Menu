
options = ["Jogar", "Configuraçoes", "Sair"];
index = 0;
op_max = array_length(options);

audio_play_sound(snd_menu_music, 10, true);

if (!variable_global_exists("volume")) {
    global.volume = 50; // Valor padrão
}
audio_master_gain(global.volume / 100);
