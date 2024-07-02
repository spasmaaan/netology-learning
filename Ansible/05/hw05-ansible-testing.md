## Подготовка к выполнению

1. Установите molecule и его драйвера: `pip3 install "molecule molecule_docker molecule_podman`.

**+**

2. Выполните `docker pull aragast/netology:latest` —  это образ с podman, tox и несколькими пайтонами (3.7 и 3.9) внутри.

**+**


## Основная часть

Ваша цель — настроить тестирование ваших ролей. 

Задача — сделать сценарии тестирования для vector. 

Ожидаемый результат — все сценарии успешно проходят тестирование ролей.

### Molecule

1. Запустите  `molecule test -s ubuntu_xenial` (или с любым другим сценарием, не имеет значения) внутри корневой директории clickhouse-role, посмотрите на вывод команды. Данная команда может отработать с ошибками или не отработать вовсе, это нормально. Наша цель - посмотреть как другие в реальном мире используют молекулу И из чего может состоять сценарий тестирования.

![1_1_molecule](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_1_molecule.png?raw=true)

2. Перейдите в каталог с ролью vector-role и создайте сценарий тестирования по умолчанию при помощи `molecule init scenario --driver-name docker`.

![1_2_init](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_2_init.png?raw=true)

3. Добавьте несколько разных дистрибутивов (oraclelinux:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.

![1_3_test](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_3_test.png?raw=true)

Первое исправление:

![1_3_fix](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_3_fix.png?raw=true)

Второе исправление:

![1_3_ready_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_3_ready_1.png?raw=true)
![1_3_ready_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_3_ready_2.png?raw=true)
![1_3_ready_3](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_3_ready_3.png?raw=true)
![1_3_ready_4](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_3_ready_4.png?raw=true)
![1_3_ready_5](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_3_ready_5.png?raw=true)

4. Добавьте несколько assert в verify.yml-файл для  проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.). 

**+**

5. Запустите тестирование роли повторно и проверьте, что оно прошло успешно.

![1_5_ready_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_5_ready_1.png?raw=true)
![1_5_ready_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_5_ready_2.png?raw=true)
![1_5_ready_3](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_5_ready_3.png?raw=true)
![1_5_ready_4](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_5_ready_4.png?raw=true)
![1_5_ready_5](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_5_ready_5.png?raw=true)
![1_5_ready_6](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/1_5_ready_6.png?raw=true)

6. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

[ansible-role-vector-test release 1.1](https://github.com/spasmaaan/ansible-role-vector-test/releases/tag/1.1)


### Tox

1. Добавьте в директорию с vector-role файлы из [директории](./example).

**+**

2. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo — путь до корня репозитория с vector-role на вашей файловой системе.

```bash
docker run --privileged=True -v /home/leo-jek/ansible-role-vector-test:/opt/ansible-role-vector-test -w /opt/ansible-role-vector-test -it aragast/netology:latest /bin/bash
```


3. Внутри контейнера выполните команду `tox`, посмотрите на вывод.

![2_3_tox_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/2_3_tox_1.png?raw=true)
![2_3_tox_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/05/2_3_tox_2.png?raw=true)

4. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.

**+**

5. Пропишите правильную команду в `tox.ini`, чтобы запускался облегчённый сценарий.

```bash
molecule test -s compatibility --destroy always
```

6. Запустите команду `tox`. Убедитесь, что всё отработало успешно.



7. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.




## Необязательная часть

1. Проделайте схожие манипуляции для создания роли LightHouse.



2. Создайте сценарий внутри любой из своих ролей, который умеет поднимать весь стек при помощи всех ролей.



3. Убедитесь в работоспособности своего стека. Создайте отдельный verify.yml, который будет проверять работоспособность интеграции всех инструментов между ними.



4. Выложите свои roles в репозитории.


