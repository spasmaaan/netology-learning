# Playbook

Playbook устанавливает Clickhouse и Vector на два заданных хоста и запускает их демонов.

Пример запуска установки:
```sh
ansible-playbook -i inventory/prod.yml site.yml
```

# Plays

## Install Clickhouse

Устанавливает Clickhouse на заданный хост и запускает его демона.


## Install Vector

Устанавливает Vector на заданный хост и запускает его демона.

## Install nginx for Lighthouse

Устанавливает nginx для Lighthouse.

## Install Lighthouse

Устанавливает Lighthouse в nginx.


# Tags

* **clickhouse** - Только для Clickhouse.
* **vector** - Только для Vector.
* **install** - Установка демонов.
* **lighthouse-batch** - Установка Lighthouse.
* **lighthouse** - Установка приложения Lighthouse в nginx.
* **nginx** - Установка сервера nginx.
* **dependencies** - Зависимости.

# Configure

## Clickhouse

Файл: `group_vars/clickhouse/vars.yml`

* **clickhouse_version** - версия Clickhouse. 

## Vector

Файл: `group_vars/vector/vars.yml`

* **vector_version** - версия Vector.
* **vector_config** - параметры конфига Vector. 

## Lighthouse

Файл: `group_vars/lighthouse/vars.yml`

* **lighthouse_server_name** - имя сервера с Lighthouse.
* **lighthouse_nginx_config_path** - путь к файлу конфига Lighthouse в nginx.
