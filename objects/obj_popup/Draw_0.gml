
draw_set_color(c_black);
draw_rectangle(50, 50, 300, 200, false);
draw_set_color(c_white);
draw_text(100, 70, "Você deseja sair?");

for (var i = 0; i < array_length(options); i++) {
    if (i == selected_option) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    draw_text(100 + 100 * i, 150, options[i]);
}
