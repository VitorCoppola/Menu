
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
var button_x1 = 10;
var button_y1 = 10;
var button_x2 = 110;
var button_y2 = 40;

// Verificar se o mouse está sobre o botão
if (m_x > button_x1 && m_x < button_x2 && m_y > button_y1 && m_y < button_y2) {
    mouse_over_button = true;
} else {
    mouse_over_button = false;
}

// Verificar se o botão do mouse foi clicado
if (mouse_over_button && mouse_check_button_pressed(mb_left)) {
    room_goto(rm_main_menu); // Redireciona para o menu principal
}
