set_global_assignment -entity "fp_to_fix" -library "lib_fp_to_fix" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_to_fix" -library "lib_fp_to_fix" -name IP_TOOL_VERSION "23.1"
set_global_assignment -entity "fp_to_fix" -library "lib_fp_to_fix" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_to_fix" -name SPD_FILE [file join $::quartus(sip_path) "fp_to_fix.spd"]

set_global_assignment -library "lib_fp_to_fix" -name MISC_FILE [file join $::quartus(sip_path) "fp_to_fix_sim/fp_to_fix.vo"]
