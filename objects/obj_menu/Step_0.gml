
var up_pressed = keyboard_check_pressed(vk_up);
var down_pressed = keyboard_check_pressed(vk_down);
var enter_pressed = keyboard_check_pressed(vk_enter);

// Navegação com o teclado
if (up_pressed) {
    index = (index - 1 + op_max) % op_max;
    show_debug_message("Opção selecionada: " + string(index));
}
if (down_pressed) {
    index = (index + 1) % op_max;
    show_debug_message("Opção selecionada: " + string(index));
}

// Seleção com o Enter
if (enter_pressed) {
    show_debug_message("Enter pressionado na opção: " + string(index));
    switch (index) {
        case 0: // Jogar
            show_debug_message("Redirecionando para rm_gameplay");
            room_goto(rm_gameplay);
            break;
        case 1: // Configurações
            instance_create_layer(0, 0, "Instances", obj_settings);
            instance_destroy();
            break;
        case 2: // Sair
            instance_create_layer(0, 0, "Instances", obj_popup);
            instance_destroy();
            break;
    }
}

// Navegação com o mouse
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
var button_x = 100;
var button_y_start = 150;
var button_spacing = 30;
var button_width = 200;
var button_height = 50;

for (var i = 0; i < op_max; i++) {
    var button_y1 = button_y_start + i * button_spacing;
    var button_y2 = button_y_start + button_height + i * button_spacing;

    if (m_x > button_x && m_x < button_x + button_width &&
        m_y > button_y1 && m_y < button_y2) {
        index = i; // Muda a opção selecionada com base no mouse

        // Verifica se o botão esquerdo do mouse foi pressionado
        if (mouse_check_button_pressed(mb_left)) {
            switch (index) {
                case 0: // Jogar
                    room_goto(rm_gameplay);
                    break;
                case 1: // Configurações
                    instance_create_layer(0, 0, "Instances", obj_settings);
                    instance_destroy();
                    break;
                case 2: // Sair
                    instance_create_layer(0, 0, "Instances", obj_popup);
                    instance_destroy();
                    break;
            }
        }
    }
}

if (keyboard_check_pressed(vk_enter)) {
    show_debug_message("Enter pressionado na opção: " + string(index));
    switch (index) {
        case 0: // Jogar
            show_debug_message("Redirecionando para rm_gameplay");
            room_goto(rm_gameplay);
            break;
        case 1: // Configurações
            instance_create_layer(0, 0, "Instances", obj_settings);
            instance_destroy();
            break;
        case 2: // Sair
            instance_create_layer(0, 0, "Instances", obj_popup);
            instance_destroy();
            break;
    }
}
