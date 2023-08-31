#!/bin/bash

# Verifique se o serviço MySQL está em execução
if systemctl is-active --quiet mysql; then
    echo "O serviço MySQL já está em execução."
else
    echo "O serviço MySQL não está em execução. Iniciando..."
    sudo systemctl start mysql
    if [ $? -eq 0 ]; then
        echo "Serviço MySQL iniciado com sucesso."
        timestamp=$(date +"%Y-%m-%d %H:%M:%S")
        file_path="/root/mysql-crash-log.txt"
        echo "Falha em: $timestamp" >> "$file_path"
        echo "Carimbo de data e hora anexado a $file_path"
    else
        echo "Falha ao iniciar o serviço MySQL."
        exit 1
    fi
fi