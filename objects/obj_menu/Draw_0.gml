
draw_set_font(fnt_menu);

// Dimensões da tela
var gui_width = display_get_gui_width();

draw_set_font(fnt_menu);

for (var i = 0; i < op_max; i++) {
    var button_x1 = 100;
    var button_y1 = 150 + i * 30;
    var button_x2 = button_x1 + 200;
    var button_y2 = button_y1 + 50;

    // Verificar se o mouse está sobre o botão
    if (index == i) {
        draw_set_color(c_yellow); // Cor para o botão selecionado
    } else {
        draw_set_color(c_white); // Cor padrão
    }

    // Desenhar o botão
    draw_rectangle(button_x1, button_y1, button_x2, button_y2, false);
    
    // Desenhar o texto
    draw_set_color(c_black);
    draw_text(button_x1 + 10, button_y1 + 10, options[i]);
}
