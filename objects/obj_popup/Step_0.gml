

// Navegação com o teclado (esquerda e direita)
if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) {
    selected_option = (selected_option + 1) % 2;
}

// Seleção com o Enter
if (keyboard_check_pressed(vk_enter)) {
    if (selected_option == 0) { // Sim
        game_end();
    } else { // Não
        instance_create_layer(0, 0, "Instances", obj_menu);
        instance_destroy();
    }
}

// Navegação com o mouse
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
var button_x_start = 100;
var button_y = 150;
var button_width = 100;
var button_height = 30;

for (var i = 0; i < array_length(options); i++) {
    var button_x1 = button_x_start + 100 * i;
    var button_x2 = button_x1 + button_width;

    if (m_x > button_x1 && m_x < button_x2 && m_y > button_y && m_y < button_y + button_height) {
        selected_option = i; // Muda a opção selecionada com base no mouse

        // Verifica se o botão esquerdo do mouse foi pressionado
        if (mouse_check_button_pressed(mb_left)) {
            if (selected_option == 0) { // Sim
                game_end();
            } else { // Não
                instance_create_layer(0, 0, "Instances", obj_menu);
                instance_destroy();
            }
        }
    }
}
