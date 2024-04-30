## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.

`some_fact = 12`

![01_some_fact](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/01_some_fact.png?raw=true)


2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

Файл: `src/playbook/group_vars_all/examp.yml`

![02_new_some_fact](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/02_new_some_fact.png?raw=true)


3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

На образе **ubuntu:latest** отсутствует **python**, поэтому его пришлось установить:
```bash
docker exec -it ubuntu /bin/bash
apt update
apt install python3
alias python='python3'
```

![03_docker](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/03_docker.png?raw=true)

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

* centos7
    `some_fact = CentOS`
* ubuntu
    `some_fact = Ubuntu`

![04_prod](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/04_prod.png?raw=true)


5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

**+**

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

![05_prod_change_vars](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/05_prod_change_vars.png?raw=true)


7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

![07_vault](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/07_vault.png?raw=true)


8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

![08_decrypt](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/08_decrypt.png?raw=true)


9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

Будет использоваться плагин для подключения `local`.

![09_plugins](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/09_plugins.png?raw=true)

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

![10_localhost](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/10_localhost.png?raw=true)


11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

![11_vars](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/11_vars.png?raw=true)


12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.

**+**


13. Предоставьте скриншоты результатов запуска команд.

**+**


## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.

Изначально зашифрованных целиком файлов нет.
В качестве примера будет зашифрован файл `src/playbook/grup_vars/all/examp.yml`.

![a01_encrypt](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/a01_encrypt.png?raw=true)

Расшифровка файла.

![a01_decrypt](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/a01_decrypt.png?raw=true)


2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.

![a02_var](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/a02_var.png?raw=true)


3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.

![a03_value](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/a03_value.png?raw=true)


4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).

![a04_fedora](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/a04_fedora.png?raw=true)


5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.

Чтобы в `ubuntu` всегда устанавливался `python3` при пересоздании контейнера, был добавлен `Dockerfile.unbuntu`.

Bash скрипт `manage.sh`:
* Запустить конейнеры и выполнить playbook:
    `./manage.sh up`
    ![a05_up](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/a05_up.png?raw=true)

* Остановить контейнеры:
    `./manage.sh down`
    ![a05_down](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/01/a05_down.png?raw=true)


6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.
    **+**

