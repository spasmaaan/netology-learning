### Задание 1
1. Возьмите из демонстрации к лекции готовый код для создания с помощью двух вызовов remote-модуля -> двух ВМ, относящихся к разным проектам(marketing и analytics) используйте labels для обозначения принадлежности. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} . Воспользуйтесь примером. Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.

`src/vm_root/cloud-init.yml`

![01 Cloud-init](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/01%20Cloud-init.png?raw=true)

`src/vm_root/main.tf`

![01 Cloud-init vars](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/01%20Cloud-init%20vars.png?raw=true)

2. Добавьте в файл cloud-init.yml установку nginx.

![01 Nginx](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/01%20Nginx.png?raw=true)

3. Предоставьте скриншот подключения к консоли и вывод команды sudo nginx -t, скриншот консоли ВМ yandex cloud с их метками. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.marketing_vm

![01 Module](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/01%20Module.png?raw=true)

**+**

### Задание 2
1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: одну сеть и одну подсеть в зоне, объявленной при вызове модуля, например: ru-central1-a.

`src/vpc_root/vpc`

2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.

`src/vpc_root/vpc/variables.tf`:

3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev

![02 Module](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/02%20Module.png?raw=true)

4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.

![02 Outputs](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/02%20Outputs.png?raw=true)

**+**

5. Сгенерируйте документацию к модулю с помощью terraform-docs.

![02 Terraform docs](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/02%20Terraform%20docs.png?raw=true)

**+**

### Задание 3
1. Выведите список ресурсов в стейте.

![03 List resources](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/03%20List%20resources.png?raw=true)

2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.

![03 Modules removed](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/03%20Modules%20removed.png?raw=true)

4. Импортируйте всё обратно. Проверьте terraform plan. Значимых(!!) изменений быть не должно. Приложите список выполненных команд и скриншоты процессы.

![03 Import vpc_dev](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/03%20Import%20vpc_dev.png?raw=true)

![03 Import VMs](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/03%20Import%20VMs.png?raw=true)

![03 Terraform plan](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/03%20Terraform%20plan.png?raw=true)

**+**

### Задание 4
1. Измените модуль vpc так, чтобы он мог создать подсети во всех зонах доступности, переданных в переменной типа list(object) при вызове модуля.

![04 Plan](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/04%20Plan.png?raw=true)

**+**

### Задание 5
1. Напишите модуль для создания кластера managed БД Mysql в Yandex Cloud с одним или несколькими(2 по умолчанию) хостами в зависимости от переменной HA=true или HA=false. Используйте ресурс yandex_mdb_mysql_cluster: передайте имя кластера и id сети.

`src/vm_root/mysql_cluster/`

2. Напишите модуль для создания базы данных и пользователя в уже существующем кластере managed БД Mysql. Используйте ресурсы yandex_mdb_mysql_database и yandex_mdb_mysql_user: передайте имя базы данных, имя пользователя и id кластера при вызове модуля.

`src/vm_root/mysql_data/`

3. Используя оба модуля, создайте кластер example из одного хоста, а затем добавьте в него БД test и пользователя app. Затем измените переменную и превратите сингл хост в кластер из 2-х серверов.

![05 Cluster created](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/05%20Cluster%20created.png?raw=true)

4. Предоставьте план выполнения и по возможности результат. Сразу же удаляйте созданные ресурсы, так как кластер может стоить очень дорого. Используйте минимальную конфигурацию.

**Plan**:

![05 Plan 1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/05%20Plan%201.png?raw=true)

![05 Plan 2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/05%20Plan%202.png?raw=true)

![05 Plan 3](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/05%20Plan%203.png?raw=true)

**Result**:

![05 Result cluster 1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/05%20Result%20cluster%201.png?raw=true)

![05 Result cluster 2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/05%20Result%20cluster%202.png?raw=true)

![05 Result cluster 3](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/05%20Result%20cluster%203.png?raw=true)

**+**

### Задание 6
1. Используя готовый yandex cloud terraform module и пример его вызова(examples/simple-bucket): https://github.com/terraform-yc-modules/terraform-yc-s3 . Создайте и не удаляйте для себя s3 бакет размером 1 ГБ(это бесплатно), он пригодится вам в ДЗ к 5 лекции.

**-**
*Не получилось создать рабочий AWS аккаунт, т.к. не получилось привязать банковскую карту.*

### Задание 7

1. Разверните у себя локально vault, используя docker-compose.yml в проекте.
2. Для входа в web-интерфейс и авторизации terraform в vault используйте токен "education".
3. Создайте новый секрет по пути http://127.0.0.1:8200/ui/vault/secrets/secret/create Path: example
secret data key: test secret data value: congrats!
4. Считайте этот секрет с помощью terraform и выведите его в output по примеру.

![07 Vault](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/07%20Vault.png?raw=true)

5. Попробуйте самостоятельно разобраться в документации и записать новый секрет в vault с помощью terraform.

`src/vm_root/main.tf`:

![07 Vault create secret](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/07%20Vault%20create%20secret.png?raw=true)


**+**

### Задание 8
Попробуйте самостоятельно разобраться в документации с помощью terraform remote state разделить root модуль на два отдельных root-модуля: создание VPC , создание ВМ .

![08 vpc_root](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/08%20vpc_root.png?raw=true)

![08 vm_root](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/04/08%20vm_root.png?raw=true)

**+**
