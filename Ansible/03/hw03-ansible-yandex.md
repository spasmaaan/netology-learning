## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.

**+**

2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.

**+**

3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.

**+**

4. Подготовьте свой inventory-файл `prod.yml`.

**+**

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

Было:
![05_lint](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/03/05_lint.png?raw=true)

Стало:
![05_lint_fixed](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/03/05_lint_fixed.png?raw=true)

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

![06_check_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/03/06_check_1.png?raw=true)
![06_check_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/03/06_check_2.png?raw=true)

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

![07_diff_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/03/07_diff_1.png?raw=true)
![07_diff_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/03/07_diff_2.png?raw=true)

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

![08_rediff_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/03/08_rediff_1.png?raw=true)
![08_rediff_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/03/08_rediff_2.png?raw=true)

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.

![README](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/03/src/playbook/README.md)

10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

![site](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/03/src/playbook/site.yml)

