#HotIf Game.is_game_active()
`:: {
    ; 复位鼠标
    if script_mode.switch {
        script_mode.close()
    }
    else
        script_mode.open()
}

; ~ 抬起时触发
` UP:: {

}


#HotIf Game.is_game_active() && script_mode.switch == true

; 连续按下Space
Space:: {
    SendInput('{Space}')
}
Space Up:: {
    SendInput('{Space Up}')
}