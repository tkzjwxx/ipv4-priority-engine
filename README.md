# 🌐 Linux IPv4 Priority Engine / 双栈出站优先级调度引擎

[English](#english) | [简体中文](#chinese)

---

<h2 id="english">🇺🇸 English</h2>

A **Global Priority Scheduler** designed for pure IPv6 VPS (like Woiden, Hax) that use WARP for IPv4 access.

### 🎯 Core Pain Point
When you install WARP on a pure IPv6 VPS, tools like `curl` or `wget` will still stubbornly prioritize the native IPv6 route when connecting to dual-stack sites (like GitHub). This often causes endless timeouts. 

This script elegantly modifies the `/etc/gai.conf` weights to **force the system to 100% prioritize the IPv4 route** without breaking your network or disabling IPv6.

### ✨ Features
* ⚡ **Instant Effect**: No reboot required. Takes effect immediately.
* ⌨️ **Global Shortcut**: Automatically registers the `v4` command. Type `v4` anytime to open the menu.
* 🛡️ **100% Safe**: Does not modify routing tables or disable IPv6. Zero risk of losing SSH connection.
* ♻️ **Reversible**: Built-in interactive menu to force IPv4 or restore system defaults.

### 🛠️ Quick Start
Run the following command in your terminal (requires root):

```bash
bash <(curl -sL https://raw.githubusercontent.com/tkzjwxx/ipv4-priority-engine/main/v4_first.sh)
```

*(💡 Note: After the first run, you can simply type `v4` in the terminal to invoke the menu anytime!)*

---

<h2 id="chinese">🇨🇳 简体中文</h2>

专为纯 IPv6 VPS (如 Woiden、Hax) 挂载 WARP IPv4 后打造的**全局底层优先级调度器**。

### 🎯 解决的核心痛点
当你在纯 IPv6 机器上安装了 WARP (拥有了 IPv4 出口) 后，使用 `curl` 或 `wget` 从 GitHub 等双栈网站拉取脚本时，系统底层的 `getaddrinfo` 依然会**头铁地优先走 IPv6 物理线路**，从而导致无尽的超时卡死。

本脚本通过优雅修改 Linux 核心的 `/etc/gai.conf` 权重，**在不破坏任何网络配置、不卸载 IPv6 的前提下，让系统全局 100% 优先使用 IPv4 出口**。一秒打通任督二脉，告别拉取失败！

### ✨ 核心特性
* ⚡ **极速生效**：无需重启网卡或系统，敲下回车的瞬间直接接管系统网络行为。
* ⌨️ **全局快捷键**：自动注册 `v4` 指令，以后随时随地敲 `v4` 即可秒开调度大盘！
* 🛡️ **绝对安全**：不修改内核路由表，不禁用系统 IPv6，彻底杜绝机器失联变砖风险。
* ♻️ **支持闭环**：自带“强制开启”与“一键恢复原状”菜单，随时进退。

### 🛠️ 一键运行命令
在纯 IPv6 机器（已挂载 WARP）的终端中，直接粘贴以下命令回车：

```bash
bash <(curl -sL https://raw.githubusercontent.com/tkzjwxx/ipv4-priority-engine/main/v4_first.sh)
```

*(💡 提示：首次运行后，你的机器已永久激活 `v4` 快捷键，下次无需再复制长代码！)*
