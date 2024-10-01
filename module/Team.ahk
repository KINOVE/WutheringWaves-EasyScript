#Include ../core/Point.ahk
#Include ../core/Game.ahk
#Include ../core/Tools.ahk
Class Team {

    ; 团队总数（上限）
    static TOTAL_TEAM_COUNT := 5

    ; 确认按钮的坐标
    static confirmBtnCoord := Point(Pos(2339, 979), Pos(0, 0))

    ; 小绿标（代表当前队伍）的颜色
    static currentTeamMarkColor := Color("#ceb997")

    ; 小绿标（代表当前队伍）所在的位置
    static currentTeamMarkRange := [
        Point(Pos(153, 118), Pos(0, 0)),
        Point(Pos(162, 797), Pos(0, 0)),
    ]

    ; 每个队伍按钮所在的坐标范围
    static teamBtnCoordinateRange := [
        [
            Point(Pos(0, 118), Pos(0, 0)),
            Point(Pos(158, 255), Pos(0, 0)),
        ],
        [
            Point(Pos(0, 255), Pos(0, 0)),
            Point(Pos(157, 390), Pos(0, 0)),
        ],
        [
            Point(Pos(0, 393), Pos(0, 0)),
            Point(Pos(158, 525), Pos(0, 0)),
        ],
        [
            Point(Pos(0, 523), Pos(0, 0)),
            Point(Pos(158, 660), Pos(0, 0)),
        ],
        [
            Point(Pos(0, 661), Pos(0, 0)),
            Point(Pos(158, 795), Pos(0, 0)),
        ],
    ]

    static escBtnCoord := Point(Pos(2449, 60), Pos(0, 0))

    /**
     * 获取当前的队伍
     * @return {index} 
     */
    static get_current_team() {
        x := 0, y := 0

        static search_coord() {
            local x := 0, y := 0
            search_res := Tools.pixel_search_plus(
                Team.currentTeamMarkRange[1],
                Team.currentTeamMarkRange[2],
                Team.currentTeamMarkColor.c,
                &x,
                &y,
            )
            return [search_res, x, y]
        }

        search_res := [false, 0, 0]

        while search_res[1] == false {
            search_res := search_coord()
            Sleep(20)
        }
        x := search_res[2], y := search_res[3]
        for i, v in this.teamBtnCoordinateRange {
            if (y < (v[1].y + v[2].y) / 2 + 50) {
                return i
            }
        }

        return 1
    }


    /**
     * 获取目标队伍按钮的坐标
     * @param index 
     * @return {Pos(x,y)}
     */
    static get_target_btn_coord(index) {
        x := (this.teamBtnCoordinateRange[index][1].x + this.teamBtnCoordinateRange[index][2].x) / 2
        y := (this.teamBtnCoordinateRange[index][1].y + this.teamBtnCoordinateRange[index][2].y) / 2
        return Pos(x, y)
    }


    ; 切换到上一个队伍
    static choose_previous_team() {
        previousTeamIndex := this.get_current_team() - 1
        if previousTeamIndex == 0 {
            previousTeamIndex := this.TOTAL_TEAM_COUNT
        }
        Tools.click_return(this.get_target_btn_coord(previousTeamIndex))
    }

    ; 切换到下一个队伍
    static choose_next_team() {
        nextTeamIndex := this.get_current_team() + 1
        if nextTeamIndex > this.TOTAL_TEAM_COUNT {
            nextTeamIndex := 1
        }
        Tools.click_return(this.get_target_btn_coord(nextTeamIndex))
    }

    ; 确认
    static confirm() {
        Tools.click_return(this.confirmBtnCoord)
    }

    ; 切换到指定队伍
    static choose_target_team(target_index) {
        if Scenes.IsTeamScene() == false {
            Send('L')
            Sleep(700)
        }
        if Scenes.IsTeamScene() == false {
            MsgBox("当前可能无法呼出队伍切换界面")
            return
        }
        if target_index == this.get_current_team() {
            Sleep(200)
            Tools.click_plus(this.escBtnCoord)
            return
        }
        Tools.click_return(this.get_target_btn_coord(target_index))
        Tools.click_return(this.confirmBtnCoord)
        Sleep(200)
        Tools.click_plus(this.escBtnCoord)
    }

}