[主文档](../../README.md)

# 兼容多分辨率

> 如果你很需要兼容自己的分辨率，请参考以下内容。

## 关于脚本结构

```
ScriptFolder
├─core      存放脚本功能的核心
├─files
│  ├─docs   存放说明文档
│  └─images 存放各类图片（主要用于图片匹配功能）
├─module    存放脚本各种功能的实现               <-- 你只需要修改这个文件夹下的文件内容
└─Init.ahk  脚本的入口与主体，快捷键等均在此设置
```

### 关于一个功能是如何编写的

> 脚本的核心围绕“点位坐标”、“目标颜色”、“目标图像”来进行识别判断。
>
> 每个`.ahk`文件都是一个新的功能
>
> 具体参考 module 文件夹下每个`.ahk`文件是如何编写的

### 如何对 16:9 分辨率增加点位

> 为了方便实现点位的编写，分别在`core`中编写了`Point`类和`Pos`类。

其中，`Pos`类包含`x`和`y`两个属性，分别用来存放位置在屏幕中的`x`和`y`坐标。

```AutoHotKey
; 初始化
static pos1 := Pos(100,100)
; 调用
MsgBox(pos1.x)
MsgBox(pos1.y)
```

`Point`类包含很多个`Pos`，分别对应不同屏幕比例下的屏幕坐标。

```AutoHotKey
; 初始化
static point1 := Point(Pos(1203, 41), Pos(888, 41)) ; 第一个pos为21:9，第二个为16:9
; 调用
point1.refresh_pos()    ; 通过实时比对游戏窗口，将对应比例的Pos中的数据设为Point的x和y
MouseMove(point1.x, point1.y)
```

因此，想要一个功能兼容`16:9`，只要打开功能对应的`.ahk`文件，找到项目开头的所有`Point`点位，在括号内第二个位置追加一个`Pos`，填入相应的坐标即可

```AutoHotKey
; 还没来得及适配16:9的点位
static testPoint := Point(Pos(Pos(1203, 41)))
; 修改为 =>
static testPoint := Point(Pos(1203, 41), Pos(888, 41))
```

> ~~我真是吃饱了撑的才会写这个.....~~
