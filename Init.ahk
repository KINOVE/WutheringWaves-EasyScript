; 推荐安装官网的统一新环境，可以兼容多版本的AHK，按以下格式声明版本即可（缺少的它会自动下载）
#Requires AutoHotkey v2.0
#SingleInstance Force

; Core
#Include core/Game.ahk
#Include core/Mode.ahk
#Include core/Point.ahk
#Include core/PointExtractor.ahk
#Include core/Scenes.ahk
#Include core/Tools.ahk

; Module <-- 如果你想写新功能，请在这里引入
#Include module/Teleport.ahk
#Include module/Achievement.ahk
#Include module/Team.ahk

; 构建脚本模式实例
script_mode := ScriptMode()

; 脚本只在以下条件满足时执行
#HotIf Game.is_game_active()

; Game.get_game_pos()
; SetTimer () => StarRail.get_game_pos(), -3000

; 快速退出游戏
^Esc:: Game.close_game()

; 调试用功能，快速Reload脚本
^!r:: Reload

; 快速强化
^Space:: {
    MouseGetPos(&x, &y)
    strengthenBtn := Point(Pos(2284, 987), Pos(1644, 987))
    Tools.MClick(strengthenBtn)
    Sleep(200)
    SendInput('{Esc}')
    Sleep(500)
    SendInput('{Esc}')
    MouseMove(x, y)
}

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

; 还没适配16:9，最后再搞


; 调用nircmd调整星铁的音量


; 在场景为大世界的时候启用以下功能
#HotIf Game.is_game_active() && Scenes.IsWorldScene()

^F3:: Achievement.ClaimAchievementRewards()

; 场景为地图时启用
#HotIf Game.is_game_active() && Scenes.IsMapScene()
^T:: Teleport.fastTeleport()

#HotIf
!`:: PointExtractor.getPoint()

!^`:: PointExtractor.searchColor()

; =::Test.test()


; 拓展场景功能
#Include KeySwitch.ahk