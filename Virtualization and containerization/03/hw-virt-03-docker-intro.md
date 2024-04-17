# Задача 1

Сценарий выполнения задачи:
- Установите docker и docker compose plugin на свою linux рабочую станцию или ВМ.

**+**

- Зарегистрируйтесь и создайте публичный репозиторий  с именем "custom-nginx" на https://hub.docker.com;

![01_2_docker_hub](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/01_2_docker_hub.png?raw=true)

- скачайте образ nginx:1.21.1;

```bash
docker build -t "spasman/custom-nginx:1.0.0" .
```

- Создайте Dockerfile и реализуйте в нем замену дефолтной индекс-страницы(/usr/share/nginx/html/index.html), на файл index.html с содержимым:

```html
<html>
  <head>
    Hey, Netology
  </head>
  <body>
    <h1>I will be DevOps Engineer!</h1>
  </body>
</html>
```

**+**

- Соберите и отправьте созданный образ в свой dockerhub-репозитории c tag 1.0.0.

```bash
docker push "spasmaaan/custom-nginx:1.0.0"
```

- Предоставьте ответ в виде ссылки на https://hub.docker.com/<username_repo>/custom-nginx/general.

Репозиторий:
`https://hub.docker.com/repository/docker/spasmaaan/custom-nginx/general`

# Задача 2

1. Запустите ваш образ custom-nginx:1.0.0 командой docker run в соответвии с требованиями:
- имя контейнера "ФИО-custom-nginx-t2"
- контейнер работает в фоне
- контейнер опубликован на порту хост системы 127.0.0.1:8080

![02_1_run](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/02_1_run.png?raw=true)

2. Переименуйте контейнер в "custom-nginx-t2"

![02_2_rename](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/02_2_rename.png?raw=true)

3. Выполните команду ```date +"%d-%m-%Y %T.%N %Z" ; sleep 0.150 ; docker ps ; ss -tlpn | grep 127.0.0.1:8080  ; docker logs custom-nginx-t2 -n1 ; docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html```

![02_3_exec_sh](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/02_3_exec_sh.png?raw=true)

4. Убедитесь с помощью curl или веб браузера, что индекс-страница доступна.

![02_4_curl](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/02_4_curl.png?raw=true)

![02_4_curl](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/02_4_curl.png?raw=true)


# Задача 3

1. Воспользуйтесь docker help или google, чтобы узнать как подключиться к стандартному потоку ввода/вывода/ошибок контейнера "custom-nginx-t2".

![03_1_attach](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_1_attach.png?raw=true)

2. Подключитесь к контейнеру и нажмите комбинацию Ctrl-C.
3. Выполните ```docker ps -a``` и объясните своими словами почему контейнер остановился.

Конейнер остановился, потому что корневой процесс, к которому была осуществлена привязка, был остановлен после нажатия `Ctrl + C`.

![03_2_exit](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_2_exit.png?raw=true)

4. Перезапустите контейнер

![03_4_restart](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_4_restart.png?raw=true)

5. Зайдите в интерактивный терминал контейнера "custom-nginx-t2" с оболочкой bash.

![03_5_exec_bash](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_5_exec_bash.png?raw=true)

6. Установите любимый текстовый редактор(vim, nano итд) с помощью apt-get.

![03_6_install_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_6_install_1.png?raw=true)

![03_6_install_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_6_install_2.png?raw=true)

7. Отредактируйте файл "/etc/nginx/conf.d/default.conf", заменив порт "listen 80" на "listen 81".

![03_7_port](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_7_port.png?raw=true)

8. Запомните(!) и выполните команду ```nginx -s reload```, а затем внутри контейнера ```curl http://127.0.0.1:80 ; curl http://127.0.0.1:81```.

![03_8_check_port](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_8_check_port.png?raw=true)

9. Выйдите из контейнера, набрав в консоли  ```exit``` или Ctrl-D.

![03_9_exit](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_9_exit.png?raw=true)

10. Проверьте вывод команд: ```ss -tlpn | grep 127.0.0.1:8080``` , ```docker port custom-nginx-t2```, ```curl http://127.0.0.1:8080```. Кратко объясните суть возникшей проблемы.

Порт Nginx был изменён внутри контейнера.
Docker об этом не знает, и до сих пор пробразывает 80-й порт, а там уже ничего нет.

![03_10_check_port_outside](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_10_check_port_outside.png?raw=true)

11. * Это дополнительное, необязательное задание. Попробуйте самостоятельно исправить конфигурацию контейнера, используя доступные источники в интернете. Не изменяйте конфигурацию nginx и не удаляйте контейнер. Останавливать контейнер можно. [пример источника](https://www.baeldung.com/linux/assign-port-docker-container)

![03_11_stop_docker](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_11_stop_docker.png?raw=true)

![03_11_change](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_11_change.png?raw=true)

![03_11_change_hostconfig](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_11_change_hostconfig.png?raw=true)

![03_11_change_config_v2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_11_change_config_v2.png?raw=true)

![03_11_start_docker](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_11_start_docker.png?raw=true)

12. Удалите запущенный контейнер "custom-nginx-t2", не останавливая его.(воспользуйтесь --help или google)

![03_12_remove](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/03_12_remove.png?raw=true)


# Задача 4

- Запустите первый контейнер из образа ***centos*** c любым тегом в фоновом режиме, подключив папку  текущий рабочий каталог ```$(pwd)``` на хостовой машине в ```/data``` контейнера, используя ключ -v.

![04_1_centos](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/04_1_centos.png?raw=true)

- Запустите второй контейнер из образа ***debian*** в фоновом режиме, подключив текущий рабочий каталог ```$(pwd)``` в ```/data``` контейнера. 

![04_2_debian](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/04_2_debian.png?raw=true)

- Подключитесь к первому контейнеру с помощью ```docker exec``` и создайте текстовый файл любого содержания в ```/data```.

![04_3_file_from_centos](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/04_3_file_from_centos.png?raw=true)

- Добавьте ещё один файл в текущий каталог ```$(pwd)``` на хостовой машине.

![04_4_file_from_host](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/04_4_file_from_host.png?raw=true)

- Подключитесь во второй контейнер и отобразите листинг и содержание файлов в ```/data``` контейнера.

![04_5_file_from_debian](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Virtualization%20and%20containerization/03/04_5_file_from_debian.png?raw=true)


# Задача 5

1. Создайте отдельную директорию(например /tmp/netology/docker/task5) и 2 файла внутри него.

"compose.yaml" с содержимым:
```yaml
version: "3"
services:
  portainer:
    image: portainer/portainer-ce:latest
    network_mode: host
    ports:
      - "9000:9000"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

"docker-compose.yaml" с содержимым:
```yaml
version: "3"
services:
  registry:
    image: registry:2
    network_mode: host
    ports:
    - "5000:5000"
```

И выполните команду "docker compose up -d". Какой из файлов был запущен и почему? (подсказка: https://docs.docker.com/compose/compose-application-model/#the-compose-file )




2. Отредактируйте файл compose.yaml так, чтобы были запущенны оба файла. (подсказка: https://docs.docker.com/compose/compose-file/14-include/)



3. Выполните в консоли вашей хостовой ОС необходимые команды чтобы залить образ custom-nginx как custom-nginx:latest в запущенное вами, локальное registry. Дополнительная документация: https://distribution.github.io/distribution/about/deploying/



4. Откройте страницу "https://127.0.0.1:9000" и произведите начальную настройку portainer.(логин и пароль адмнистратора)



5. Откройте страницу "http://127.0.0.1:9000/#!/home", выберите ваше local  окружение. Перейдите на вкладку "stacks" и в "web editor" задеплойте следующий компоуз:

```yaml
version: '3'

services:
  nginx:
    image: 127.0.0.1:5000/custom-nginx
    ports:
      - "9090:80"
```




6. Перейдите на страницу "http://127.0.0.1:9000/#!/2/docker/containers", выберите контейнер с nginx и нажмите на кнопку "inspect". В представлении <> Tree разверните поле "Config" и сделайте скриншот от поля "AppArmorProfile" до "Driver".



7. Удалите любой из манифестов компоуза(например compose.yaml).  Выполните команду "docker compose up -d". Прочитайте warning, объясните суть предупреждения и выполните предложенное действие. Погасите compose-проект ОДНОЙ(обязательно!!) командой.



В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод, файл compose.yaml , скриншот portainer c задеплоенным компоузом.
