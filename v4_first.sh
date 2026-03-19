#!/bin/bash
# =========================================================
# Linux 全局出站优先级调度器 (IPv4 / IPv6 切换)
# 专为纯 IPv6 + WARP 机器解决 GitHub 等双栈环境解析卡死痛点
# =========================================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}请使用 root 权限运行此脚本！${NC}"
  exit 1
fi

# 🚀 独家魔法：自动安装全局快捷键 v4
if [ ! -f /usr/bin/v4 ]; then
    echo -e "${CYAN}📦 正在注册全局快捷键 'v4'...${NC}"
    curl -sL https://raw.githubusercontent.com/tkzjwxx/ipv4-priority-engine/main/v4_first.sh -o /usr/bin/v4 2>/dev/null
    chmod +x /usr/bin/v4
fi

if [ ! -f /etc/gai.conf ]; then
    touch /etc/gai.conf
fi

clear
echo -e "${CYAN}======================================================${NC}"
echo -e "${GREEN}      🌐 Linux 全局双栈出站优先级调度引擎${NC}"
echo -e "${CYAN}======================================================${NC}"
echo -e "痛点：在纯 IPv6 机器挂载 WARP 后，极易导致双栈网站拉取卡死"
echo -e "💡 ${YELLOW}快捷键已激活：以后随时在终端输入 v4 即可唤出本菜单！${NC}"
echo -e "------------------------------------------------------"
echo -e "${YELLOW} 1.${NC} 🚀 强制设置 IPv4 优先 (解决拉取卡死问题，推荐)"
echo -e "${YELLOW} 2.${NC} ♻️ 恢复系统默认设置 (恢复 IPv6 优先)"
echo -e "${YELLOW} 0.${NC} 退出"
echo -e "------------------------------------------------------"
read -p "👉 请输入选项 [0-2]: " choice

case $choice in
    1)
        echo -e "\n${CYAN}⚙️ 正在修改系统底层 DNS 权重...${NC}"
        sed -i '/^precedence ::ffff:0:0\/96/d' /etc/gai.conf 2>/dev/null
        echo "precedence ::ffff:0:0/96  100" >> /etc/gai.conf
        echo -e "${GREEN}✅ 设置成功！系统现已全局优先走 IPv4 出口。${NC}\n"
        ;;
    2)
        echo -e "\n${CYAN}⚙️ 正在清除自定义权重...${NC}"
        sed -i '/^precedence ::ffff:0:0\/96/d' /etc/gai.conf 2>/dev/null
        echo -e "${GREEN}✅ 恢复成功！系统已交回默认路由调度。${NC}\n"
        ;;
    0)
        echo -e "${GREEN}已退出。${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}❌ 无效选项，已退出。${NC}"
        exit 1
        ;;
esac

echo -e "${YELLOW}📡 正在测试当前优先级出站 IP (如果不通请检查 WARP 状态):${NC}"
curl -s4m5 https://ip.gs || curl -s6m5 https://ip.gs
echo ""
