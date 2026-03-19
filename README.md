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
