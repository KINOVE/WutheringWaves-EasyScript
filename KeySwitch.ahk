#Include init.ahk
#Include core/Mode.ahk
#HotIf Game.is_game_active()
^a:: {
    script_mode.set_mode(1)
}
#HotIf Game.is_game_active() && script_mode.switch == true

; 连续按下Space
Space:: {
    SendInput('{Space}')
}
Space Up:: {
    SendInput('{Space Up}')
}