#!/bin/bash


# ========== Funktionen ==========
show_uptime() {
    echo "======== Laufzeit ==========="
    uptime
    echo
}

show_cpu() {
    echo "======== CPU LOAD ==========="
    cat /proc/loadavg
    echo
}

show_memory() {
    echo "======== Memory ============="
    free -h
    echo
}

show_processes() {
    echo "======== Top 5 Prozesse ====="
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
    echo
}

# ========== Hauptprogramm ==========
echo "============================"
echo " AOK Gesundheitscheck Script"
echo " Datum: $(date)"
echo "============================"
echo

show_uptime
show_cpu
show_memory
show_processes

echo "======== Block Devices ======"
lsblk
echo

echo "======== Disk Usage ========="
df -h | grep -E '^/dev/'
echo

echo "======== Netzwerk =========="
ip a
echo

echo "======== TCP Ports ========="
ss -tuln | grep LISTEN
echo

echo "============================"
echo " Healthcheck Beendet $(date) "
echo "============================"
