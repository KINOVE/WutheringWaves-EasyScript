#Include ../init.ahk
#Include Game.ahk
Class ScriptMode {
    switch := true  ; 功能开关
    mode := 1       ; 当前模式
    tip := ScriptTooltip()  ; Tooltip实例

    ; 功能开关----------------------------------------start
    ; 获取功能是否开启 -> script_mode.switch
    open() {
        this.switch := true
        this.tip.show_msg()
    }

    close() {
        this.switch := false
        this.tip.hide_msg()
    }
    ; 功能开关----------------------------------------end


    ; 设置模式----------------------------------------start
    ; 1 -> 模式1
    set_mode(code) {
        ; 如果模式没有改变，则不做任何事
        if code == this.mode
            return
        ; 根据 code 编号更换模式
        switch code {
            case 1:
                this.tip.change_msg("模式1")
            default:
                MsgBox("当前模式编号" code "没有设置内容，请检查代码")
        }
        this.mode := code   ; 变更模式
    }

    ; 判断是否为模式
    is_mode(code) {
        if this.switch == false
            return false
        return code == this.mode
    }

    ; 进入下一个模式
    next_mode() {
        this.set_mode(Mod(this.mode + 1, 2))
    }
    ; 设置模式----------------------------------------end
}

Class ScriptTooltip {
    msg := ""                   ; tooltip 显示的内容
    x := 0                      ; tooltip 显示的坐标 x
    y := Game.size.height / 2   ; tooltip 显示的坐标 y

    change_msg(str, need_show := false) {
        this.msg := str
        if need_show {
            ToolTip(this.msg, this.x, this.y, 20)
        }
    }

    show_msg() {
        ToolTip(this.msg, this.x, this.y, 20)
    }

    hide_msg() {
        ToolTip("")
    }
}