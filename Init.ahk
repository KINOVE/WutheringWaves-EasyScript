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


; TODO 调整以下内容
; 在场景为大世界的时候启用以下功能
; #HotIf Game.is_game_active() && Scenes.IsWorldScene()

; ^F3:: Achievement.ClaimAchievementRewards()

; 场景为地图时启用
; #HotIf Game.is_game_active() && Scenes.IsMapScene()
; ^T:: Teleport.fastTeleport()

#HotIf
!`:: PointExtractor.getPoint()

!^`:: PointExtractor.searchColor()

#HotIf Game.is_game_active() && Scenes.IsTeamScene()
!A:: Team.choose_previous_team()
!D:: Team.choose_next_team()
!Space:: Team.confirm()