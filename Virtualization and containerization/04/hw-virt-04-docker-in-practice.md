## Задача 0

1. Убедитесь что у вас НЕ(!) установлен ```docker-compose```, для этого получите следующую ошибку от команды 

```docker-compose --version```

```sh
Command 'docker-compose' not found, but can be installed with:

sudo snap install docker          # version 24.0.5, or
sudo apt  install docker-compose  # version 1.25.0-1

See 'snap info docker' for additional versions.
```

В случае наличия установленного в системе ```docker-compose``` - удалите его.

![00_1_docker-compose](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/00_1_docker-compose.png?raw=true)

2. Убедитесь что у вас УСТАНОВЛЕН ```docker compose```(без тире) версии не менее v2.24.X, для это выполните команду ```docker compose version```  

![00_2_docker_compose](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/00_2_docker_compose.png?raw=true)


## Задача 1

1. Сделайте в своем github пространстве fork репозитория ```https://github.com/netology-code/shvirtd-example-python/blob/main/README.md```.   

2. Создайте файл с именем ```Dockerfile.python``` для сборки данного проекта(для 3 задания изучите https://docs.docker.com/compose/compose-file/build/ ). Используйте базовый образ ```python:3.9-slim```. Протестируйте корректность сборки. Не забудьте dockerignore.

![01_2_build](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/01_2_build.png?raw=true)

3. (Необязательная часть, *) Изучите инструкцию в проекте и запустите web-приложение без использования docker в venv. (Mysql БД можно запустить в docker run).

![01_3_local_run_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/01_3_local_run_1.png?raw=true)
![01_3_local_run_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/01_3_local_run_2.png?raw=true)
![01_3_local_run_3](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/01_3_local_run_3.png?raw=true)

4. (Необязательная часть, *) По образцу предоставленного python кода внесите в него исправление для управления названием используемой таблицы через ENV переменную.

![01_4_db_name](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/01_4_db_name.png?raw=true)
![01_4_local_run](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/01_4_local_run.png?raw=true)


## Задача 2

1. Создайте в yandex cloud container registry с именем "test" с помощью "yc tool" . [Инструкция](https://cloud.yandex.ru/ru/docs/container-registry/quickstart/?from=int-console-help)

2. Настройте аутентификацию вашего локального docker в yandex container registry.

![02_1_create](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/02_1_create.png?raw=true)

3. Соберите и залейте в него образ с python приложением из задания №1.

![02_3_build](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/02_3_build.png?raw=true)

4. Просканируйте образ на уязвимости.

![02_4_security_scan](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/02_4_security_scan.png?raw=true)

5. В качестве ответа приложите отчет сканирования.

![02_5_scan_result](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/02_5_scan_result.png?raw=true)


## Задача 3

1. Изучите файл "proxy.yaml"

2. Создайте в репозитории с проектом файл ```compose.yaml```. С помощью директивы "include" подключите к нему файл "proxy.yaml".

3. Опишите в файле ```compose.yaml``` следующие сервисы: 

- ```web```. Образ приложения должен ИЛИ собираться при запуске compose из файла ```Dockerfile.python``` ИЛИ скачиваться из yandex cloud container registry(из задание №2 со *). Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.5```. Сервис должен всегда перезапускаться в случае ошибок.
Передайте необходимые ENV-переменные для подключения к Mysql базе данных по сетевому имени сервиса ```web``` 

- ```db```. image=mysql:8. Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.10```. Явно перезапуск сервиса в случае ошибок. Передайте необходимые ENV-переменные для создания: пароля root пользователя, создания базы данных, пользователя и пароля для web-приложения.Обязательно используйте уже существующий .env file для назначения секретных ENV-переменных!

![03_3_up](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/03_3_up.png?raw=true)

4. Запустите проект локально с помощью docker compose , добейтесь его стабильной работы: команда ```curl -L http://127.0.0.1:8090``` должна возвращать в качестве ответа время и локальный IP-адрес. Если сервисы не стартуют воспользуйтесь командами: ```docker ps -a ``` и ```docker logs <container_name>``` 

![03_4_curl](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/03_4_curl.png?raw=true)

5. Подключитесь к БД mysql с помощью команды ```docker exec <имя_контейнера> mysql -uroot -p<пароль root-пользователя>``` . Введите последовательно команды (не забываем в конце символ ; ): ```show databases; use <имя вашей базы данных(по-умолчанию example)>; show tables; SELECT * from requests LIMIT 10;```.

![03_5_db](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/03_5_db.png?raw=true)

6. Остановите проект. В качестве ответа приложите скриншот sql-запроса.

![03_6_down](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/03_6_down.png?raw=true)


## Задача 4

1. Запустите в Yandex Cloud ВМ (вам хватит 2 Гб Ram).

![04_1_vm](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/04_1_vm.png?raw=true)

2. Подключитесь к Вм по ssh и установите docker.

![04_2_docker](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/04_2_docker.png?raw=true)

3. Напишите bash-скрипт, который скачает ваш fork-репозиторий в каталог /opt и запустит проект целиком.

![04_3_script](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/04_3_script.png?raw=true)

4. Зайдите на сайт проверки http подключений, например(или аналогичный): ```https://check-host.net/check-http``` и запустите проверку вашего сервиса ```http://<внешний_IP-адрес_вашей_ВМ>:8090```. Таким образом трафик будет направлен в ingress-proxy.

![04_4_http_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/04_4_http_1.png?raw=true)
![04_4_http_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/04_4_http_2.png?raw=true)
![04_4_http_3](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/04_4_http_3.png?raw=true)

5. (Необязательная часть) Дополнительно настройте remote ssh context к вашему серверу. Отобразите список контекстов и результат удаленного выполнения ```docker ps -a```

![04_5_context](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/04_5_context.png?raw=true)

6. В качестве ответа повторите  sql-запрос и приложите скриншот с данного сервера, bash-скрипт и ссылку на fork-репозиторий.

![04_6_db](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/04_6_db.png?raw=true)
![04_6_git](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/04_6_git.png?raw=true)


## Задача 5

1. Напишите и задеплойте на вашу облачную ВМ bash скрипт, который произведет резервное копирование БД mysql в директорию "/opt/backup" с помощью запуска в сети "backend" контейнера из образа ```schnitzler/mysqldump``` при помощи ```docker run ...``` команды. Подсказка: "документация образа."

2. Протестируйте ручной запуск

3. Настройте выполнение скрипта раз в 1 минуту через cron, crontab или systemctl timer. Придумайте способ не светить логин/пароль в git!!

4. Предоставьте скрипт, cron-task и скриншот с несколькими резервными копиями в "/opt/backup"

*Пока не готово, попробую успеть сделать.*

## Задача 6

Скачайте docker образ ```hashicorp/terraform:latest``` и скопируйте бинарный файл ```/bin/terraform``` на свою локальную машину, используя dive и docker save.

![06_1_pull](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/06_1_pull.png?raw=true)
![06_2_run](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/06_2_run.png?raw=true)
![06_3_dive](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/06_3_dive.png?raw=true)
![06_4_copy](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/06_4_copy.png?raw=true)


## Задача 6.1

Добейтесь аналогичного результата, используя docker cp.  

![061_docker_cp](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/04/061_docker_cp.png?raw=true)


## Задача 6.2

Предложите способ извлечь файл из контейнера, используя только команду docker build и любой Dockerfile.  
Предоставьте скриншоты  действий.

*Пока не готово, попробую успеть сделать.*

## Задача 7

Запустите ваше python-приложение с помощью runC, не используя docker или containerd.  
Предоставьте скриншоты  действий.

*Пока не готово, попробую успеть сделать.*