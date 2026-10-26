<div align="center">
<img src="docs/images/icon.png" width="112" alt="Osmotic 图标">

# Osmotic 简体中文版

**在 Mac 上通过 Wi-Fi 浏览、预览和下载 DJI Osmo 相机素材，无需手机。**

支持简体中文、English 和西班牙语。默认跟随系统语言，也可在设置中手动切换。

[下载中文版 DMG](https://github.com/NF404301/Osmotic/releases/latest) · [原项目](https://github.com/smithplus/Osmotic) · 原作者 [smithplus](https://smithplus.me)

macOS 15 及以上 · Apple 芯片与 Intel · Swift 6.2 · MIT 许可证
</div>

## 这个分支增加了什么

本项目基于 **smithplus/Osmotic**，新增简体中文界面和系统权限说明，以及应用内语言选择器。原项目的代码、作者署名、提交历史和许可证均保留。

在 **设置 → 通用 → 语言** 中选择 **跟随系统 / 简体中文 / English**。默认跟随系统；手动切换后点击“立即重启”生效。重启前会断开相机连接，传输过程中不能重启。语言选项只影响本应用。

## 主要功能

### 无线素材库

直接通过相机自己的 Wi-Fi 读取存储卡，按日期浏览缩略图，并筛选视频、照片、已收藏和新素材。点击“下载新素材”，即可下载本地尚未保存的内容。

- 默认保存到“下载”目录中的 `DJI` 文件夹，可更改位置。
- 可按拍摄日期建立文件夹，并保留拍摄时间，方便访达和剪辑软件排序。
- 已存在的文件会跳过，不会覆盖；中断的下载可继续，包括超过 4 GB 的视频。
- 按空格使用相机的轻量 `.LRF` 文件预览，避免先下载完整 4K 视频。原画质需下载原文件。
- 可同时下载照片的 RAW `.DNG` 和视频的备份音频 `.WAV`，也可在设置中关闭。
- 支持方向键选择、Shift 扩选、空格预览、⌘D 下载所选、⇧⌘D 下载新素材。

### 自动无线连接

Mac 通过蓝牙发现相机，获取 Wi-Fi 信息，再加入相机热点并读取素材。首次连接需在相机屏幕确认配对。界面显示蓝牙、配对、Wi-Fi、连接和素材库五个步骤。

连接期间 Mac 使用相机热点，通常无法同时通过 Wi-Fi 上网。可使用以太网或通过 USB 共享 iPhone 网络保持互联网连接。断开后应用会尝试恢复原来的 Wi-Fi。

### USB 存储卡读取

相机通过 USB-C 连接 Mac 并选择文件传输后，可以直接读取存储卡，不切换 Wi-Fi。应用可显示连接规格与实际读取速度，支持浏览、复制和推出存储卡。

### 实时画面与拍摄控制

受支持的 Pocket 机型可通过 Wi-Fi 查看实时画面、开始或停止录像、拍照，以及切换录像、拍照、慢动作和低光模式。**Action 4 当前不支持此应用的实时画面功能**。

### USB 网络摄像头

使用 USB-C 连接相机并在相机上选择“网络摄像头”，可在应用中查看画面，也可在 Zoom、Meet、FaceTime 和 OBS 中选用。此功能尚未在本分支进行实机验证。

## 下载与使用

1. 前往本仓库的 [Releases](https://github.com/NF404301/Osmotic/releases/latest)，下载中文版 DMG。
2. 打开 DMG，将 **Osmotic.app** 拖入“应用程序”。
3. 打开相机并放在 Mac 附近。在应用中点击“连接”，首次连接时在相机屏幕确认配对。
4. 连接完成后浏览素材，按空格预览或选择素材下载。

**系统要求：**macOS 15 Sequoia 或更新版本，Apple 芯片或 Intel Mac，蓝牙与 Wi-Fi。

本分支 DMG 使用本地临时签名，未经过 Apple 公证。首次打开时 macOS 可能提示无法验证开发者。发布页会提供 SHA-256 校验文件。

应用内更新器仍指向原作者的发行版本；原版不包含本分支新增的中文和语言开关。若需保留汉化，请从本仓库 Releases 手动更新，不要安装应用内提示的原版更新。

## 相机兼容性与验证状态

| 相机 | 素材浏览与下载 | Wi-Fi 实时画面 | 验证情况 |
|---|---|---|---|
| Osmo Pocket 3 | 支持 | 支持 | 原作者已实测连接、列表、下载、拍摄控制和实时画面 |
| Osmo Pocket 4 / 4 Pro | 协议支持 | 协议支持 | 原作者尚未实测此 Mac 应用，兼容性仍需验证 |
| Osmo Action 4 | 协议支持 | 不支持 | 本机观察到配对和素材列表；稳定性、视频预览及下载仍需进一步实测 |
| Osmo Action 5 Pro / 6 | 协议支持 | 不支持 | 上游协议已有适配，此 Mac 应用仍需实测 |
| Osmo Nano | 协议支持 | 不支持 | 上游协议已有适配，此 Mac 应用仍需实测 |

本分支已在 macOS 15.6.1、Swift 6.2.4 上编译和打包；已检查中文主界面、设置页面及英文启动界面。上传源码前完整运行的 105 项测试全部通过。软件测试不等于所有相机的实机测试。

## 权限与隐私

| 权限 | 用途 |
|---|---|
| 蓝牙 | 发现相机并配对 |
| 本地网络 | 通过相机热点读取素材 |
| 定位 | macOS 需要此权限才向应用提供当前 Wi-Fi 名称，用于断开后恢复原网络；应用不读取或保存位置 |
| 下载文件夹 | 保存视频与照片 |
| 可移动宗卷 | 通过 USB 读取相机存储卡 |
| 摄像头 | 显示 USB 网络摄像头画面 |
| 通知 | 下载完成时提醒 |

无需账号，不包含分析统计。素材保留在相机与 Mac 上；应用可能向 GitHub 查询更新。相机 Wi-Fi 密码如需保存，使用 macOS 钥匙串。详细说明见 [安全与隐私说明](SECURITY.md)。

## 常见问题

**会删除相机里的素材吗？** 不会。应用不会删除或修改相机里已有的文件。

**重复下载会覆盖吗？** 不会。已存在的文件会跳过，未完成的文件会继续下载。

**找不到相机怎么办？** 确认相机已开机、靠近 Mac，蓝牙已开启，且相机没有被手机上的 DJI Mimo 占用。首次配对要在相机屏幕确认。

**连接后不能上网怎么办？** 相机热点用于素材传输，不提供互联网。断开相机后应用会尝试恢复原网络，也可手动从菜单栏选择原 Wi-Fi。

**出现问题如何排查？** 在“窗口 → 技术日志”（⌥⌘L）中查看。分享日志前自行检查内容，避免上传个人信息。原项目完整英文手册见 [使用指南](docs/GUIDE.md)。

## 源码构建

需要 Xcode 26、Swift 6.2 或更高版本。

```bash
git clone https://github.com/NF404301/Osmotic.git
cd Osmotic
swift test
bash scripts/package_app.sh debug
open build/Osmotic.app
```

生成 Apple 芯片与 Intel 通用 DMG：

```bash
bash scripts/package_chinese_dmg.sh
```

| 目录 | 内容 |
|---|---|
| `Sources/OsmoticCore` | 蓝牙配对、相机通信协议、文件列表解码、HTTP 下载和实时画面重组 |
| `Sources/Osmotic` | SwiftUI 应用与系统接口 |
| `Resources` | 多语言资源、权限说明、图标和应用配置 |
| `Tests` | 实际协议样本、模拟相机、模拟 HTTP 服务与健壮性测试 |
| `scripts` | 构建、签名、打包、截图与发行工具 |
| `docs` | 原项目使用指南、架构和协议说明 |
| `site` | 原项目的静态展示网站 |

## 原作者与致谢

Osmotic 原生 Mac 应用由 [smithplus](https://smithplus.me) 制作。若它帮到了你，可以[请原作者喝杯咖啡](https://buymeacoffee.com/smithplus)。本仓库维护简体中文翻译和语言选择功能。

原项目基于以下工作，完整保留相关署名与许可证：

- [Osmosis](https://github.com/KonradIT/osmosis)，Konrad Iturbe：相机协议、配对流程与文件列表解码器，MIT。
- [Kaze for DJI](https://github.com/brianmerchant/Kaze-for-DJI)，Brian Merchant：拍摄控制与实时画面，MIT。
- [OpenPocketCine](https://github.com/erik-sutton95/OpenPocketCine)，erik-sutton95：实时画面和控制协议文档，Apache-2.0；原项目按其文档重新实现。
- 协议研究：[DJI OGs](https://github.com/o-gs)、[dji-remote](https://github.com/dimadesu/dji-remote)、[osmo-download](https://github.com/SemiConscious/osmo-download)、[DJI-Wifi-Connect](https://github.com/sniffingpickles/DJI-Wifi-Connect)、[lib-osmo-ble](https://github.com/yigitkonur/lib-osmo-ble)、[dji_protocol](https://github.com/samuelsadok/dji_protocol)、[reverse-engineering-dji](https://github.com/xaionaro/reverse-engineering-dji)。
- 测试样本贡献者：[Rhoenschrat](https://www.rhoenschrat.de/)、[Juan Irache](https://github.com/JuanIrache)、[GetHypoxic](https://gethypoxic.com/) 和 [Ave](https://github.com/aveao)。

## 许可证

采用 [MIT 许可证](LICENSE)。本项目是独立开源项目，与 DJI 无关联，也未获得 DJI 背书。“DJI”和“Osmo”商标属于其各自所有者。原项目中的截图使用演示数据。
