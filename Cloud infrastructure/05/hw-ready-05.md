### Задание 0

1. Прочтите статью: https://neprivet.com/
2. Пожалуйста, распространите данную идею в своем коллективе.
**+**

------

### Задание 1

1. Возьмите код:
- из [ДЗ к лекции 4](https://github.com/netology-code/ter-homeworks/tree/main/04/src),
- из [демо к лекции 4](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1).

**+**

2. Проверьте код с помощью tflint и checkov. Вам не нужно инициализировать этот проект.

**+**

3. Перечислите, какие **типы** ошибок обнаружены в проекте (без дублей).

* **demonstration1**:
    * Module source "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main" uses a default branch as ref (main) (terraform_module_pinned_source)
    * Missing version constraint for provider "template" in `required_providers` (terraform_required_providers)
    * Missing version constraint for provider "yandex" in `required_providers` (terraform_required_providers)
    * [Fixable] variable "public_key" is declared but not used (terraform_unused_declarations)
    * CKV_YC_4: "Ensure compute instance does not have serial console enabled."
    * CKV_YC_11: "Ensure security group is assigned to network interface."
    * CKV_YC_2: "Ensure compute instance does not have public IP."
    * CKV_TF_1: "Ensure Terraform module sources use a commit hash"
* **src**:
    * Missing version constraint for provider "yandex" in `required_providers` (terraform_required_providers)
    * [Fixable] variable "vms_ssh_root_key" is declared but not used (terraform_unused_declarations)
    * [Fixable] variable "vm_web_name" is declared but not used (terraform_unused_declarations)
    * [Fixable] variable "vm_db_name" is declared but not used (terraform_unused_declarations) 
**+**

------

### Задание 2

1. Возьмите ваш GitHub-репозиторий с **выполненным ДЗ 4** в ветке 'terraform-04' и сделайте из него ветку 'terraform-05'.
2. Повторите демонстрацию лекции: настройте YDB, S3 bucket, yandex service account, права доступа и мигрируйте state проекта в S3 с блокировками. Предоставьте скриншоты процесса в качестве ответа.

**Yandex DB**

![02_2_ydb](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/02_2_ydb.png?raw=true)

**S3 bucket**

![02_2_s3_bucket](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/02_2_s3_bucket.png?raw=true)

**Service account**

![02_2_service_account](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/02_2_service_account.png?raw=true)

**Init modules**

![02_2_init_modules](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/02_2_init_modules.png?raw=true)

3. Закоммитьте в ветку 'terraform-05' все изменения.
4. Откройте в проекте terraform console, а в другом окне из этой же директории попробуйте запустить terraform apply.

![02_4_console](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/02_4_console.png?raw=true)

5. Пришлите ответ об ошибке доступа к state.

![02_5_apply](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/02_5_apply.png?raw=true)

6. Принудительно разблокируйте state. Пришлите команду и вывод.

![02_6_force-unlock](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/02_6_force-unlock.png?raw=true)

------

### Задание 3  

1. Сделайте в GitHub из ветки 'terraform-05' новую ветку 'terraform-hotfix'.
2. Проверье код с помощью tflint и checkov, исправьте все предупреждения и ошибки в 'terraform-hotfix', сделайте коммит.

![03_2_tslint](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/03_2_tslint.png?raw=true)

![03_2_checkov](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/03_2_checkov.png?raw=true)

3. Откройте новый pull request 'terraform-hotfix' --> 'terraform-05'. 
4. Вставьте в комментарий PR результат анализа tflint и checkov, план изменений инфраструктуры из вывода команды terraform plan.

Модуль **root_vpc**:

![03_2_plan_vpc_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/03_2_plan_vpc_1.png?raw=true)

![03_2_plan_vpc_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/03_2_plan_vpc_2.png?raw=true)

Модуль **root_vm**:

![03_2_plan_vm_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/03_2_plan_vm_1.png?raw=true)

![03_2_plan_vm_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/03_2_plan_vm_2.png?raw=true)

![03_2_plan_vm_3](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/03_2_plan_vm_3.png?raw=true)

![03_2_plan_vm_4](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/03_2_plan_vm_4.png?raw=true)

5. Пришлите ссылку на PR для ревью. Вливать код в 'terraform-05' не нужно.

**PR**: https://github.com/spasmaaan/netology-learning/pull/1

------

### Задание 4

1. Напишите переменные с валидацией и протестируйте их, заполнив default верными и неверными значениями. Предоставьте скриншоты проверок из terraform console. 

- type=string, description="ip-адрес" — проверка, что значение переменной содержит верный IP-адрес с помощью функций cidrhost() или regex(). Тесты:  "192.168.0.1" и "1920.1680.0.1";

![04_1_ip](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/04_1_ip.png?raw=true)

- type=list(string), description="список ip-адресов" — проверка, что все адреса верны. Тесты:  ["192.168.0.1", "1.1.1.1", "127.0.0.1"] и ["192.168.0.1", "1.1.1.1", "1270.0.0.1"].

![04_2_ip_list](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/04_2_ip_list.png?raw=true)

------

### Задание 5*
1. Напишите переменные с валидацией:
- type=string, description="любая строка" — проверка, что строка не содержит символов верхнего регистра;

![05_1_any_string](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/05_1_any_string.png?raw=true)

- type=object — проверка, что одно из значений равно true, а второе false, т. е. не допускается false false и true true:
```
variable "in_the_end_there_can_be_only_one" {
    description="Who is better Connor or Duncan?"
    type = object({
        Dunkan = optional(bool)
        Connor = optional(bool)
    })

    default = {
        Dunkan = true
        Connor = false
    }

    validation {
        error_message = "There can be only one MacLeod"
        condition = <проверка>
    }
}
```

![05_2_dunkan](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/05_2_dunkan.png?raw=true)

![05_2_connor](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/05_2_connor.png?raw=true)

![05_2_all_true](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/05_2_all_true.png?raw=true)

![05_2_all_false](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/05_2_all_false.png?raw=true)

![05_2_empty](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Cloud%20infrastructure/05/05_2_empty.png?raw=true)

------

### Задание 6*

1. Настройте любую известную вам CI/CD-систему. Если вы ещё не знакомы с CI/CD-системами, настоятельно рекомендуем вернуться к этому заданию после изучения Jenkins/Teamcity/Gitlab.
2. Скачайте с её помощью ваш репозиторий с кодом и инициализируйте инфраструктуру.
3. Уничтожьте инфраструктуру тем же способом.

**Пока не изучал CI\CD.**

------

### Задание 7*
1. Настройте отдельный terraform root модуль, который будет создавать YDB, s3 bucket для tfstate и сервисный аккаунт с необходимыми правами. 

**Не успел сделать.**