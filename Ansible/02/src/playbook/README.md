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


# Tags

* **clickhouse** - Только для Clickhouse.
* **vector** - Только для Vector.
* **get** - Загрузка файлов для устновки.
* **install** - Установка демонов.
* **prepare** - Подготовка демонов к работе и их запуск.

# Configure

## Clickhouse

Файл: `group_vars/clickhouse/vars.yml`

* **clickhouse_version** - версия Clickhouse. 
* **clickhouse_packages** - пакеты для установк Clickhouse.
  Если не задано, то будет загружен *clickhouse-common-static*.

## Vector

Файл: `group_vars/vector/vars.yml`

* **vector_version** - версия Vector.
* **vector_config** - параметры конфига Vector. 
