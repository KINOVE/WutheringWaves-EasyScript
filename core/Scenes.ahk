#Include Game.ahk
#Include Point.ahk
#Include Tools.ahk
Class Scenes {
    ; 该类用来识别当前所处的场景
    ; 模板脚本，可随时修改

    static IsWorldScene() {
        static worldPoints := [
            Point(Pos(43, 82), Pos(43, 82)),
        ]
        static worldColors := [
            Color("#e7e7e7"),
        ]

        while (A_Index <= worldPoints.Length) {
            worldPoints[A_Index].refresh_pos()
            if (!Tools.pixel_exist(worldPoints[A_Index], worldColors[A_Index].c)) {
                return false
            }
        }

        return true
    }

    static IsMapScene() {
        static Points_1 := [
            Point(Pos(2444, 57), Pos(0, 0)),
            Point(Pos(2456, 69), Pos(0, 0)),
        ]
        static Colors_1 := [
            Color("#72664d"),
            Color("#72664d"),
        ]

        static Points_2 := [
            Point(Pos(66, 58), Pos(0, 0)),
            Point(Pos(2443, 57), Pos(0, 0)),
        ]
        static Colors_2 := [
            Color("#fdfdfe"),
            Color("#fffacf"),
        ]

        return Tools.multi_point_check(Points_1, Colors_1) || Tools.multi_point_check(Points_2, Colors_2)
    }

    static IsTeamScene() {
        static Points := [
            Point(Pos(68, 62), Pos(0, 0)),
            Point(Pos(72, 82), Pos(0, 0)),
        ]
        static Colors := [
            Color("#ece5d8"),
            Color("#ece5d8"),
        ]

        while (A_Index <= Points.Length) {
            Points[A_Index].refresh_pos()
            if (!Tools.pixel_exist(Points[A_Index], Colors[A_Index].c)) {
                return false
            }
        }

        return true
    }

    static GetScene() {
        ; 1:游戏主界面
        ; 2:地图界面
        ; 3:队伍界面

        if (this.IsWorldScene())
            return 1
        else if (this.IsMapScene())
            return 2
        else if (this.IsTeamScene())
            return 3
        else
            return 0

    }

}