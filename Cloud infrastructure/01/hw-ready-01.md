# Задание 1

1. *Перейдите в каталог **src**. Скачайте все необходимые зависимости, использованные в проекте.*
   **+**
2. *Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?*
   В **personal.auto.tfvars**.
3. *Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.*
   ```terraform
   {
      "resources": [
      {
         "mode": "managed",
         "type": "random_password",
         "name": "random_string",
         "provider": "provider[\"registry.terraform.io/hashicorp/random\"]",
         "instances": [
         {
            "schema_version": 3,
            "attributes": {
               "bcrypt_hash": "$2a$10$YmD2q156mR/AqwUlLdb8HOR5h05xZX71rpSW7ehcWWeP4sd9XE36C",
               "id": "none",
               "keepers": null,
               "length": 16,
               "lower": true,
               "min_lower": 1,
               "min_numeric": 1,
               "min_special": 0,
               "min_upper": 1,
               "number": true,
               "numeric": true,
               "override_special": null,
               "result": "",
               "special": false,
               "upper": true
            },
            "sensitive_attributes": []
         }
         ]
      }
      ]
   }
   ```
   Значение ключа: **n2FZStUAY7nGGtIF**
4. *Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.*
*Выполните команду ```terraform validate```. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.*
   1. В строке 25, в `resource "docker_image"` не задано поле указывающее на конкретный образ. 
      Долно быть `resource "docker_image" "nginx"`.
   2. В строке 28, в `resource "docker_container" "1nginx"` в названии 2го поля допущена опечатка.
      Должно быть `resource "docker_container" "nginx"`.
   3. В строке 30, в `name  = "example_${random_password.random_string_FAKE.resulT}"` допущена ошибка в названии поля **random_string_FAKE** ресурса **random_password**. Название поля должно быть **random_string**.
   4. В строке 30, в `name  = "example_${random_password.random_string.resulT}"` допущена ошибка в названии атрибута поля. Последня буква написана не в том регистре.
   Вместо `random_password.random_string.resulT` должно быть `random_password.random_string.result`.
5. *Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды ```docker ps```.*
```terraform
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 9090
  }
}
```   
```sh
leo-jek@economy-vm:~/netology-learning/Cloud infrastructure/01/src$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
f98f430e3ecf   b690f5f0a2d5   "/docker-entrypoint.…"   13 minutes ago   Up 13 minutes   0.0.0.0:9090->80/tcp   example_mxVL296CI2Y52moP
```
6. *Замените имя docker-контейнера в блоке кода на ```hello_world```. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду ```terraform apply -auto-approve```.*
*Объясните своими словами, в чём может быть опасность применения ключа  ```-auto-approve```. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды ```docker ps```.*

Опасность состоит в том, что т.к. ключ `-auto-approve` позволяет выполнять код Terraform без подтверждения действий, то могут произойти нежелательный действия, которые нельзя будет отменить. Эти действия могут нанести тот или иной ущерб системе.

```sh
leo-jek@economy-vm:~/netology-learning/Cloud infrastructure/01/src$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
4fafbc957db2   b690f5f0a2d5   "/docker-entrypoint.…"   22 seconds ago   Up 22 seconds   0.0.0.0:9090->80/tcp   hello_world
```
7. *Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**. *
```terraform-state
{
  "version": 4,
  "terraform_version": "1.5.7",
  "serial": 14,
  "lineage": "a286bbba-fb13-bbdd-7c03-cb832291c1ea",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```
8. *Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **обязательно** подкрепите строчкой из документации [**terraform провайдера docker**](https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs).  (ищите в классификаторе resource docker_image)*

Для этого ресурса задан атрибут `keep_locally = true`, который отменяет удаление docker-образа после уничтожения инфраструктуры в terraform.
> **keep_locally (Boolean)** - If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.



# Задание 2*

1. *Создайте в облаке ВМ. Сделайте это через web-консоль, чтобы не слить по незнанию токен от облака в github(это тема следующей лекции). Если хотите - попробуйте сделать это через terraform, прочитав документацию yandex cloud. Используйте файл ```personal.auto.tfvars``` и гитигнор или иной, безопасный способ передачи токена!*


2. *Подключитесь к ВМ по ssh и установите стек docker.*


3. *Найдите в документации docker provider способ настроить подключение terraform на вашей рабочей станции к remote docker context вашей ВМ через ssh.*


4. *Используя terraform и  remote docker context, скачайте и запустите на вашей ВМ контейнер ```mysql:8``` на порту ```127.0.0.1:3306```, передайте ENV-переменные. Сгенерируйте разные пароли через random_password и передайте их в контейнер, используя интерполяцию из примера с nginx.(```name  = "example_${random_password.random_string.result}"```  , двойные кавычки и фигурные скобки обязательны!)*
```
    environment:
      - "MYSQL_ROOT_PASSWORD=${...}"
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - "MYSQL_PASSWORD=${...}"
      - MYSQL_ROOT_HOST="%"
```


5. *Зайдите на вашу ВМ , подключитесь к контейнеру и проверьте наличие секретных env-переменных с помощью команды ```env```. Запишите ваш финальный код в репозиторий.*


