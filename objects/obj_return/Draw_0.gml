
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
var button_x1 = 10;
var button_y1 = 10;
var button_x2 = 110;
var button_y2 = 40;

// Verificar se o mouse está sobre o botão
if (mouse_over_button) {
    draw_set_color(c_yellow); // Cor quando o mouse está sobre o botão
} else {
    draw_set_color(c_white); // Cor padrão do botão
}

// Desenhar o retângulo do botão
draw_rectangle(10, 10, 110, 40, false);

// Desenhar o texto do botão
draw_set_color(c_black);
draw_text(20, 20, "Retornar");