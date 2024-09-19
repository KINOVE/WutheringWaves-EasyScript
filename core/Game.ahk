Class Game {
    static name := IniRead("../config.ini", "GameSettings", "game_name")
    static size := {
        width: 0,
        height: 0
    }

    ; 获取游戏尺寸
    static get_game_pos() {
        if (ProcessExist(this.name) && this.is_game_exist()) {
            WinGetClientPos(, , &width, &height, 'ahk_exe' this.name)
            this.size.width := width
            this.size.height := height
            return
        }
        this.size.width := 0
        this.size.height := 0
    }

    ; 游戏窗口是否存在
    static is_game_exist() {
        return WinExist('ahk_exe ' this.name)
    }

    ; 游戏窗口是否在最前面
    static is_game_active() {
        ; 首先获取一次窗口大小
        this.get_game_pos()
        return WinActive('ahk_exe ' this.name)
    }

    ; 关闭游戏
    static close_game() {
        if WinExist('ahk_exe ' this.name)
            WinClose
        ExitApp
    }

    ; 获取游戏进程pid
    static get_pid() {
        if WinExist('ahk_exe ' this.name)
            return WinGetPID('ahk_exe ' this.name)
        return -1
    }
}