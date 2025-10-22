#!/bin/bash

# 1. Borrar todas las reglas existentes para limpieza
iptables -F
iptables -X

# 2. Bloquear NUEVAS conexiones TCP del atacante (Kali: 192.168.1.146)
# Bloquea el Puerto 21 (FTP - Riesgo Crítico)
iptables -A INPUT -p tcp -s 192.168.1.146 --dport 21 -j DROP

# Bloquea el Puerto 22 (SSH)
iptables -A INPUT -p tcp -s 192.168.1.146 --dport 22 -j DROP

# Bloquea el Puerto 3306 (MySQL)
iptables -A INPUT -p tcp -s 192.168.1.146 --dport 3306 -j DROP

# 3. Muestra las reglas de iptables aplicadas para verificación
iptables -L -n -v