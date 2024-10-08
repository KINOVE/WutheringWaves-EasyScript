# WutheringWaves-EasyScript

用于游戏 鸣潮（Wuthering Waves） PC 端的快捷键增强脚本，简化操作。

此系列脚本更新的核心目的是为了减少无效操作，提高游戏体验。（拯救腱鞘炎）

脚本不会做任何全自动战斗功能，因为这样的功能违背了本脚本的初衷。

## 分辨率适配情况

| 目标分辨率  | 屏幕比例 | 适配情况 | 当前开发主要目标 |
| :---------: | :------: | :------: | :--------------: |
| `2560*1080` |  `21:9`  |  ❕[^!]  |                  |
| `3440*1440` |  `21:9`  |  ❕[^!]  |                  |
|  `Any16:9`  |  `16:9`  |  ❕[^!]  |        ✅        |

[^!]: 已做兼容处理，但缺少点位数据，需要自行利用截图工具对照点位进行适配。

## 注意事项

1. 个人主力设备为`16:9`分辨率，一切更新围绕`1920*1080`分辨率进行。
2. 想要兼容自己的分辨率（如`21:9`），请参考 `->` [多分辨率兼容](./files/docs/Multiresolution.md)
3. GUI 在看了
4. 有功能需要的话提一下`issue`，或者`fork`后自己开发
5. 项目是看着`AHK2`的文档一点点啃的，没写过`AHK1`，需要什么看什么，所以可能会有部分旧功能的实现方式很奇怪。

## 安装&使用方式

> 唯一建议方式如下，不提供打包好的`.exe`。原因如下：
> 脚本编写过程中测试困难（测试环境做完一次就没了，每日刷新）。
> 因此稳定版本很难保证，最稳定的版本往往是最新的仓库代码。

1. 前往[`AutoHotKey`官网](https://www.autohotkey.com/)，下载`AHK2`统一脚本环境（该环境兼容`AHK1`，不影响其他 AHK 脚本）
2. 使用`git`克隆仓库代码
3. 以管理员模式启动启动`Init.ahk`，否则无法在游戏窗口使用
4. 需要更新时，`pull`仓库即可

## 目前功能

### 基础功能列表

|       键位        | 使用场景 |      模式      |           功能           |   实现状态   |
| :---------------: | :------: | :------------: | :----------------------: | :----------: |
|   `Ctrl+Alt+R`    | `无限制` |     `ALL`      | 重载脚本，调试功能用[^*] |      ✅      |
|    `Ctrl+Esc`     | `无限制` |     `ALL`      |      关闭游戏和脚本      |      ✅      |
|    长按`Space`    | `无限制` | `脚本状态为开` |     高频循环触发空格     |      ✅      |
|     原`Space`     | `无限制` | `脚本状态为关` |      只单词触发空格      |      ✅      |
|      短按`~`      | `无限制` |     `ALL`      |      控制脚本开/关       |      ✅      |
|      长按`~`      | `无限制` |     `ALL`      |       调整脚本模式       | `TODO`(待定) |
|      `Alt+V`      | `无限制` |     `ALL`      |     开关游戏声音[^2]     |      ✅      |
| `Ctrl+Alt+LClick` | `无限制` |     `ALL`      |       鼠标快速连点       |      ✅      |

### 队伍调整界面（场景：队伍调整界面）

|     键位     |                 功能                 | 实现状态 |
| :----------: | :----------------------------------: | :------: |
|   `Ctrl+A`   |           切换到上一个队伍           |    ✅    |
|   `Ctrl+D`   |           切换到下一个队伍           |    ✅    |
| `Ctrl+Space` |             确认队伍选择             |    ✅    |
|  `Alt+1~7`   | 快速切换到对应队伍（大世界场景可用） |    ✅    |

### 常用功能分类

|  键位  |   使用场景   |      模式      |       功能       |              实现状态               |
| :----: | :----------: | :------------: | :--------------: | :---------------------------------: |
| `待定` | `游戏主界面` | `脚本状态为开` | 自动领取邮件奖励 |               `TODO`                |
| `待定` | `游戏主界面` | `脚本状态为开` | 自动领取成就奖励 |               `TODO`                |
| `待定` | `游戏主界面` | `脚本状态为开` |   快速点击传送   | `TODO`（等 1.3 上线以后有时间再做） |

> 使用了`nircmd`工具来进行单应用音量调整，体积很小，功能很足，强烈推荐
>
> [这是官网链接，下载链接在页面最下方](http://www.nirsoft.net/utils/nircmd.html)
>
> 建议使用管理员权限双击打开复制到 C 盘，这样使用 cmd 即可全局调用

[^*]: 可用于脚本功能异常时紧急重置
[^1]: 目前只做了获取奖励+重复上一次派遣，没有需求就不做指定派遣了
[^2]: 使用了`nircmd`工具来进行单应用音量调整

## TODO

- [ ] 完善基本功能
- [ ] 评判是否需要多模式控制 -> 如不需要，则暂时只开发脚本功能开关
- [ ] 尝试快捷轮盘
- [ ] 尝试 GUI
- [ ] 尝试自定义键位
- [ ] 尝试构建 Rust 版本 ？

## 免责声明

> 1. 脚本为自用，利用空余时间更新，一切以个人习惯优先
> 2. 脚本不盈利，只对软件窗口取色识别+键鼠固定操作复现，未修改游戏数据，无利益相关
> 3. 不会做任何大世界自动战斗相关，仅服务于游戏体验
> 4. 如有任何传播时添油加醋的行为，与本人无关
> 5. 请遵守`GPLv3`协议，禁止打包出售（或修改后打包出售）
> 6. 参与讨论默认你已理解本脚本的原理，并知晓一定计算机知识
> 7. 未修改游戏数据，不是外挂，理清楚再说话，别当小丑
> 8. 脚本仅供娱乐，写的烂那就写的烂吧，脚本更新以个人体验优先，实现功能优先
