; 脚本只在以下条件满足时执行 -------------> 全局功能
#HotIf Game.is_game_active()

; Game.get_game_pos()
; SetTimer () => Game.get_game_pos(), -3000

; 快速退出游戏
^Esc:: Game.close_game()

; 调试用功能，快速Reload脚本
^!r:: Reload

; 鼠标快速连点
^!LButton:: {
    Click
    clickPlus() {
        if GetKeyState('LButton', 'P') {
            Sleep(Random(100, 150))
            Click
        } else {
            SetTimer(clickPlus, 0)
        }
    }
    SetTimer(clickPlus, 50)
}

; 调用nircmd调整游戏的音量
^3:: Nircmd.adjust_volume()