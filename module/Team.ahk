#Include ../core/Point.ahk
#Include ../core/Game.ahk
#Include ../core/Tools.ahk
Class Team {

    ; 团队总数（上限）
    static TOTAL_TEAM_COUNT := 6

    ; 确认按钮的坐标
    static confirmBtnCoord := Point(Pos(2311, 979), Pos(1666, 984))

    ; 小绿标（代表当前队伍）的颜色
    static currentTeamMarkColor := Color("")

    ; 小绿标（代表当前队伍）所在的位置
    static currentTeamMarkRange := [
        Point(Pos(), Pos()),
        Point(Pos(), Pos()),
    ]

    ; 每个队伍按钮所在的坐标范围
    static teamBtnCoordinateRange := [
        [
            Point(Pos(), Pos()),
            Point(Pos(), Pos()),
        ],
        [
            Point(Pos(), Pos()),
            Point(Pos(), Pos()),
        ],
        [
            Point(Pos(), Pos()),
            Point(Pos(), Pos()),
        ],
        [
            Point(Pos(), Pos()),
            Point(Pos(), Pos()),
        ],
        [
            Point(Pos(), Pos()),
            Point(Pos(), Pos()),
        ],
        [
            Point(Pos(), Pos()),
            Point(Pos(), Pos()),
        ],
    ]

    /**
     * 获取当前的队伍
     * @return {index} 
     */
    static get_current_team() {
        x := 0, y := 0
        Tools.pixel_search_plus(
            this.currentTeamMarkRange[1],
            this.currentTeamMarkRange[2],
            this.currentTeamMarkColor,
            &x,
            &y,
        )

        for i, v in this.teamBtnCoordinateRange
            if v[1].y <= y
                return i + 1
        return -1
    }


    /**
     * 获取目标队伍按钮的坐标
     * @param index 
     * @return {Pos(x,y)}
     */
    static get_target_btn_coord(index) {
        x := (this.currentTeamMarkRange[index][1].x + this.currentTeamMarkRange[index][2].x) / 2
        y := (this.currentTeamMarkRange[index][1].y + this.currentTeamMarkRange[index][2].y) / 2
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
        nextTeamIndex := this.get_current_team() - 1
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
        if target_index == this.get_current_team()
            return
        Tools.click_return(this.get_target_btn_coord(target_index))
        Tools.click_return(this.confirmBtnCoord)
    }

}