#!/bin/bash

# Проверка наличия аргументов
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <remote_user> <remote_host> <password> <public_key>"
    exit 1
fi

REMOTE_USER=$1       # Пользователь для подключения к удаленному серверу
REMOTE_HOST=$2       # IP-адрес или доменное имя удаленного сервера
PASSWORD=$3          # Пароль для пользователя ansible
PUBLIC_KEY=$4        # Публичный SSH ключ для ansible

# Команды для выполнения на удаленном сервере с sudo
SSH_COMMAND="sudo bash -c ' \
    apt update && \
    apt install ansible -y && \
    useradd -m -s /bin/bash ansible && \
    echo \"ansible:$PASSWORD\" | chpasswd && \
    mkdir -p /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh && \
    chown ansible:ansible /home/ansible/.ssh && \
    touch /home/ansible/.ssh/authorized_keys && \
    chmod 600 /home/ansible/.ssh/authorized_keys && \
    chown ansible:ansible /home/ansible/.ssh/authorized_keys && \
    echo \"$PUBLIC_KEY\" >> /home/ansible/.ssh/authorized_keys && \
    chmod 600 /home/ansible/.ssh/authorized_keys && \
    chown ansible:ansible /home/ansible/.ssh/authorized_keys && \
    echo \"ansible ALL=(ALL) NOPASSWD: ALL\" >> /etc/sudoers \
'"

# Выполнение команд на удаленном сервере через ssh
ssh "$REMOTE_USER@$REMOTE_HOST" "$SSH_COMMAND"

if [ $? -eq 0 ]; then
    echo "Пользователь ansible успешно создан, ключ добавлен и права sudo настроены на удаленном сервере $REMOTE_HOST."
else
    echo "Произошла ошибка при создании пользователя ansible на удаленном сервере $REMOTE_HOST."
fi
