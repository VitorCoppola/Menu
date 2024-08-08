

// Navegação com o teclado
if (keyboard_check_pressed(vk_up)) {
    selected_option = (selected_option - 1 + array_length(options)) mod array_length(options);
}
if (keyboard_check_pressed(vk_down)) {
    selected_option = (selected_option + 1) mod array_length(options);
}

// Navegação e interação com o mouse
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
var button_x = 100;
var button_y_start = 150;
var button_spacing = 30;
var button_width = 200;
var button_height = 30;

for (var i = 0; i < array_length(options); i++) {
    var button_y1 = button_y_start + i * button_spacing;
    var button_y2 = button_y1 + button_height;

    if (m_x > button_x && m_x < button_x + button_width &&
        m_y > button_y1 && m_y < button_y2) {
        selected_option = i; // Muda a opção selecionada com base no mouse

        // Verifica se o botão esquerdo do mouse foi pressionado
        if (mouse_check_button_pressed(mb_left)) {
            switch (selected_option) {
                case 0: // Volume
                    // Clique no botão de volume faz nada aqui, ajuste é feito abaixo
                    break;
                case 1: // Tela Cheia
                    fullscreen = !fullscreen;
                    window_set_fullscreen(fullscreen);
                    break;
                case 2: // Voltar
                    instance_create_layer(0, 0, "Instances", obj_menu);
                    instance_destroy();
                    break;
            }
        }
    }
}

// Ajuste de Volume via Mouse
if (selected_option == 0) {
    var volume_button_x1 = button_x + button_width + 10;
    var volume_button_x2 = button_x + button_width + 60;
    var volume_button_y1 = button_y_start;
    var volume_button_y2 = button_y_start + button_height;

    var decrease_button_x1 = button_x - 60;
    var decrease_button_x2 = button_x - 10;

    if (m_x > volume_button_x1 && m_x < volume_button_x2 &&
        m_y > volume_button_y1 && m_y < volume_button_y2) {
        if (mouse_check_button_pressed(mb_left)) {
            volume = min(100, volume + 1);
            global.volume = volume; // Sincronize o volume global
            audio_master_gain(global.volume / 100); // Atualiza o volume
        }
    }
    if (m_x > decrease_button_x1 && m_x < decrease_button_x2 &&
        m_y > volume_button_y1 && m_y < volume_button_y2) {
        if (mouse_check_button_pressed(mb_left)) {
            volume = max(0, volume - 1);
            global.volume = volume; // Sincronize o volume global
            audio_master_gain(global.volume / 100); // Atualiza o volume
        }
    }
}

// Ajuste de Volume via Teclado
if (selected_option == 0) { // Se a opção selecionada é Volume
    if (keyboard_check(vk_left)) {
        volume = max(0, volume - 1);
        global.volume = volume; // Sincronize o volume global
        audio_master_gain(global.volume / 100); // Atualiza o volume
    }
    if (keyboard_check(vk_right)) {
        volume = min(100, volume + 1);
        global.volume = volume; // Sincronize o volume global
        audio_master_gain(global.volume / 100); // Atualiza o volume
    }
}

// Verifica a seleção do teclado e realiza ações
switch (selected_option) {
    case 0: // Volume
        // Já lidamos com o ajuste de volume acima
        break;
    case 1: // Tela Cheia
        if (keyboard_check_pressed(vk_enter)) {
            fullscreen = !fullscreen;
            window_set_fullscreen(fullscreen);
        }
        break;
    case 2: // Voltar
        if (keyboard_check_pressed(vk_enter)) {
            instance_create_layer(0, 0, "Instances", obj_menu);
            instance_destroy();
        }
        break;
}
