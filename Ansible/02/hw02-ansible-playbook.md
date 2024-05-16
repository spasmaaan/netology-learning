
## Основная часть

1. Подготовьте свой inventory-файл `prod.yml`.

**+**

2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install). не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!

**+**

3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.

**+**

4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.

**+**

![04_playbook](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/02/04_playbook.png?raw=true)

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

Было:
![05_lint](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/02/05_lint.png?raw=true)

Стало:
![05_lint_fixed](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/02/05_lint_fixed.png?raw=true)


6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

![06_check](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/02/06_check.png?raw=true)

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

![07_diff_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/02/07_diff_1.png?raw=true)
![07_diff_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/02/07_diff_2.png?raw=true)

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

![08_rediff](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/02/08_rediff.png?raw=true)

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook). Так же приложите скриншоты выполнения заданий №5-8

![README](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/02/src/playbook/README.md?raw=true)

10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

![site](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/02/src/playbook/site.yml?raw=true)

