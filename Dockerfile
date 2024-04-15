# Используем официальный образ Jenkins
FROM jenkins/jenkins:lts

# Переключаемся на пользователя root для установки пакетов
USER root

# Обновление списка пакетов и установка Python и pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv

# Создание виртуального окружения
RUN python3 -m venv /opt/venv

# Активация виртуального окружения и установка пакетов
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip && \
    pip install numpy pandas scikit-learn matplotlib seaborn jupyter

# Копируем скрипты и другие необходимые файлы в контейнер
COPY scripts/ /usr/src/app/scripts/
COPY Jenkinsfile /usr/src/app/
WORKDIR /usr/src/app

# Предоставляем права на выполнение скриптов
RUN chmod +x /usr/src/app/scripts/*.py

# Возвращаем пользователя Jenkins
USER jenkins
