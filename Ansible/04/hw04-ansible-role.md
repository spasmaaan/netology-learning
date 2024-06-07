## Подготовка к выполнению

1. * Необязательно. Познакомьтесь с [LightHouse](https://youtu.be/ymlrNlaHzIY?t=929).

**+**

2. Создайте два пустых публичных репозитория в любом своём проекте: vector-role и lighthouse-role.

* [Vector](https://github.com/spasmaaan/ansible-role-vector-test)
* [Lighthouse](https://github.com/spasmaaan/ansible-role-lighthouse-test)
  


3. Добавьте публичную часть своего ключа к своему профилю на GitHub.

**+**



## Основная часть

Ваша цель — разбить ваш playbook на отдельные roles. 

Задача — сделать roles для ClickHouse, Vector и LightHouse и написать playbook для использования этих ролей. 

Ожидаемый результат — существуют три ваших репозитория: два с roles и один с playbook.

**Что нужно сделать**

1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:

   ```yaml
   ---
     - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
       scm: git
       version: "1.13"
       name: clickhouse 
   ```

**+**


2. При помощи `ansible-galaxy` скачайте себе эту роль.

**+**

3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.

**+**

4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`. 

**+**

5. Перенести нужные шаблоны конфигов в `templates`.

**+**

6. Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).

**+**

7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.

**+**

8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.

**+**

9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.

**+**

10. Выложите playbook в репозиторий.

**+**

11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

* [Playbook](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/04/src/playbook/site.yml)
* [Vector role](https://github.com/spasmaaan/ansible-role-vector-test)
* [Lighthouse role](https://github.com/spasmaaan/ansible-role-lighthouse-test)

![01_Install_requirements](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/04/01_Install_requirements.png?raw=true)
![02_Upgrade_requirements](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/04/02_Upgrade_requirements.png?raw=true)
![03_Result_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/04/03_Result_1.png?raw=true)
![03_Result_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/04/03_Result_2.png?raw=true)
![03_Result_3](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/04/03_Result_3.png?raw=true)
