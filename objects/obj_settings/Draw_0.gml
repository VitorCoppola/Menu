// Evento Draw do obj_settings
draw_text(100, 100, "Configurações");

for (var i = 0; i < array_length(options); i++) {
    if (i == selected_option) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    draw_text(100, 150 + 30 * i, options[i]);
}

// Mostrar o volume atual
draw_set_color(c_white);
draw_text(300, 150, string(global.volume)); // Usa global.volume para mostrar o volume

// Mostrar o estado da tela cheia
draw_text(300, 180, fullscreen ? "Ativado" : "Desativado");

// Mostrar botões de ajuste de volume
var volume_x = 300; // Ajuste a posição conforme necessário
draw_text(volume_x - 20, 150, "<");
draw_text(volume_x + 60, 150, ">");
