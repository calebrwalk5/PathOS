bits 16

section .text

; Include MikeOS API vectors.
%include "../include/mikedev.inc"

; Include the C runtime function.
%include "crt0.asm"

; Include the disk functions.
%include "get_file_list.asm"
%include "load_file.asm"
%include "write_file.asm"
%include "file_exists.asm"
%include "create_file.asm"
%include "remove_file.asm"
%include "rename_file.asm"
%include "get_file_size.asm"

; Include the keyboard functions.
%include "wait_for_key.asm"
%include "check_for_key.asm"

; Include the math functions.
%include "bcd_to_int.asm"
%include "long_int_negate.asm"
%include "get_random.asm"

; Inclue the misc functions.
%include "get_api_version.asm"
%include "pause.asm"
%include "fatal_error.asm"

; Include the port functions.
%include "port_byte_out.asm"
%include "port_byte_in.asm"
%include "serial_port_enable.asm"
%include "send_via_serial.asm"
%include "get_via_serial.asm"

; Include the screen functions.
%include "print_string.asm"
%include "clear_screen.asm"
%include "move_cursor.asm"
%include "get_cursor_pos.asm"
%include "print_horiz_line.asm"
%include "show_cursor.asm"
%include "hide_cursor.asm"
%include "draw_block.asm"
%include "file_selector.asm"
%include "list_dialog.asm"
%include "draw_background.asm"
%include "print_newline.asm"
%include "dump_registers.asm"
%include "dialog_box.asm"
%include "print_space.asm"
%include "dump_string.asm"
%include "print_digit.asm"
%include "print_1hex.asm"
%include "print_2hex.asm"
%include "print_4hex.asm"
%include "input_string.asm"

; Include the string functions.
%include "string_length.asm"
%include "find_char_in_string.asm"
%include "string_reverse.asm"
%include "string_charchange.asm"
%include "string_uppercase.asm"
%include "string_lowercase.asm"
%include "string_copy.asm"
%include "string_truncate.asm"
%include "string_join.asm"
%include "string_chomp.asm"
%include "string_strip.asm"
%include "string_compare.asm"
%include "string_strincmp.asm"
%include "string_parse.asm"
%include "string_to_int.asm"
%include "int_to_string.asm"
%include "sint_to_string.asm"
%include "long_int_to_string.asm"
%include "set_time_fmt.asm"
%include "get_time_string.asm"
%include "set_date_fmt.asm"
%include "get_date_string.asm"

; Include the sound functions.
%include "speaker_tone.asm"
%include "speaker_off.asm"

; Include the BASIC interpreter function.
%include "run_basic.asm"

section .data

; Include the I/O error variable.
%include "ioerr.asm"
