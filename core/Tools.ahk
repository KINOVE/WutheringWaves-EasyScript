Class Tools {
    ; 在目标点位附近搜素颜色相近的目标，可选择是否提供目标输出
    static pixel_exist(target, colorId, range := 10, colorDeviation := 10, &outputX?, &outputY?) {
        ; 假如提供了输出（被找到的点位坐标）
        if IsSet(outputX) {
            return PixelSearch(&outputX, &outputY, target.x - range / 2, target.y - range / 2, target.x + range / 2, target.y + range / 2, colorId, colorDeviation)
        }
        else {
            temp := 0
            return PixelSearch(&temp, &temp, target.x - range / 2, target.y - range / 2, target.x + range / 2, target.y + range / 2, colorId, colorDeviation)
        }
    }

    ; 只是用于简化调用
    ; 提供区域A/B坐标，即可搜素范围内是否有满足要求的点
    static pixel_search_plus(targetA, targetB, colorId, &outputX?, &outputY?, colorDeviation := 10) {
        if IsSet(outputX) {
            return PixelSearch(&outputX, &outputY, targetA.x, targetA.y, targetB.x, targetB.y, colorId, colorDeviation)
        }
        else {
            local temp
            return PixelSearch(&temp, &temp, targetA.x, targetA.y, targetB.x, targetB.y, colorId, colorDeviation)
        }
    }

    ; 简化的鼠标移动
    static move_plus(target, speed := 1) {
        MouseMove(target.x, target.y, speed)
    }

    ; 简化的鼠标点击
    static click_plus(target, speed := 1) {
        MouseClick(, target.x, target.y, , speed)
    }


    /**
     * 点击目标位置后，返回原来的位置
     * @param target(Point/Pos)
     */
    static click_return(target, speed := 1) {
        MouseGetPos(&x, &y)
        this.click_plus(target, speed)
        this.move_plus(Pos(x, y), speed)
    }

    ; 检查多个点位的多个颜色是否一一对应
    static multi_point_check(Points, Colors) {
        while (A_Index <= Points.Length) {
            Points[A_Index].refresh_pos()
            if (!Tools.pixel_exist(Points[A_Index], Colors[A_Index].c)) {
                return false
            }
        }
        return true
    }
}