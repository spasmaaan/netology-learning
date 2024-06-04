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


## Install Lighthouse

Устанавливает nginx и Lighthouse на заданный хост и запускает nginx с Lighthouse.


# Tags

* **clickhouse** - Только для Clickhouse.
* **vector** - Только для Vector.
* **get** - Загрузка файлов для устновки.
* **install** - Установка демонов.
* **prepare** - Подготовка демонов к работе и их запуск.
* **lighthouse-batch** - Установка Lighthouse.
* **lighthouse** - Установка приложения Lighthouse в nginx.
* **nginx** - Установка сервера nginx.
* **dependencies** - Зависимости.

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

## Lighthouse

Файл: `group_vars/lighthouse/vars.yml`

* **lighthouse_repo** - git рупозиторий с Lighthouse.
* **lighthouse_branch** - ветка git-репозитория.
* **lighthouse_path** - путь к папке, в которую будет установлен Lighthouse. 
* **lighthouse_http_port** - http-порт, на котором будет вещать nginx.