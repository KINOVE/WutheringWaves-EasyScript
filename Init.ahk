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
#Include module/Nircmd.ahk

; 初始化全局变量
global script_mode := ScriptMode()  ; 构建脚本模式实例

; Mode
#Include mode\Normal.ahk
#Include mode\Switch.ahk


#HotIf
!`:: PointExtractor.getPoint()

!^`:: PointExtractor.searchColor()

; 大世界
#HotIf Game.is_game_active()
!1:: Team.choose_target_team(1)
!2:: Team.choose_target_team(2)
!3:: Team.choose_target_team(3)
!4:: Team.choose_target_team(4)
!5:: Team.choose_target_team(5)


; 队伍界面
#HotIf Game.is_game_active() && Scenes.IsTeamScene()
^A:: Team.choose_previous_team()
^D:: Team.choose_next_team()
^Space:: Team.confirm()


; 地图界面
#HotIf Game.is_game_active() && Scenes.IsMapScene()
; ^T:: Teleport.fastTeleport()
