## Подготовка к выполнению

1. Создайте пустой публичный репозиторий в своём любом проекте: `my_own_collection`.

**+**

2. Скачайте репозиторий Ansible: `git clone https://github.com/ansible/ansible.git` по любому, удобному вам пути.

**+**

3. Зайдите в директорию Ansible: `cd ansible`.

**+**

4. Создайте виртуальное окружение: `python3 -m venv venv`.

**+**

5. Активируйте виртуальное окружение: `. venv/bin/activate`. Дальнейшие действия производятся только в виртуальном окружении.

**+**

6. Установите зависимости `pip install -r requirements.txt`.

**+**

7. Запустите настройку окружения `. hacking/env-setup`.

**+**

8. Если все шаги прошли успешно — выйдите из виртуального окружения `deactivate`.

**+**

9. Ваше окружение настроено. Чтобы запустить его, нужно находиться в директории `ansible` и выполнить конструкцию `. venv/bin/activate && . hacking/env-setup`.

**+**


## Основная часть

**Шаг 1.** В виртуальном окружении создайте новый `my_own_module.py` файл.

Создан файл **file_content.py**


**Шаг 2.** Наполните его содержимым:

**+**


**Шаг 3.** Заполните файл в соответствии с требованиями Ansible так, чтобы он выполнял основную задачу: module должен создавать текстовый файл на удалённом хосте по пути, определённом в параметре `path`, с содержимым, определённым в параметре `content`.

```python
#!/usr/bin/python

# Copyright: (c) 2018, Terry Jones <terry.jones@example.org>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
from __future__ import (absolute_import, division, print_function)
__metaclass__ = type
import os.path

DOCUMENTATION = r'''
---
module: file_content

short_description: This is my test module

# If this is part of a collection, you need to use semantic versioning,
# i.e. the version is of the form "2.5.0" and not "2.4".
version_added: "1.0.0"

description: This is my longer description explaining my test module.

options:
    path:
        description: Path to target file location.
        required: true
        type: str
    content:
        description: Content for setted into a file.
        required: false
        type: str
# Specify this value according to your collection
# in format of namespace.collection.doc_fragment_name
extends_documentation_fragment:
    - spasmaaan.yandex_cloud_elk.file_content_doc

author:
    - Evgeniy Litvinov (@spasmaaan)
'''

EXAMPLES = r'''
# Pass in a path
- name: Path to target file
  spasmaaan.yandex_cloud_elk.file_content:
    path: text.txt

# pass in a path and have content
- name: Test with a message and changed output
  spasmaaan.yandex_cloud_elk.file_content:
    path: text.txt
    content: Text for a file.

# fail the module
- name: Test failure of the module
  spasmaaan.yandex_cloud_elk.file_content:
    content: any text
'''

RETURN = r'''
# These are examples of possible return values, and in general should use other names for return values.
changed:
    description: Whether the specified content text was added to the target file.
    type: bool
    returned: always
    sample: True
'''

from ansible.module_utils.basic import AnsibleModule


def run_module():
    module_args = dict(
        path=dict(type='str', required=True),
        content=dict(type='str', required=False, default='')
    )

    result = dict(
        changed=False
    )

    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=True
    )

    if module.check_mode:
        module.exit_json(**result)

    target_path = module.params['path']
    target_content = module.params['content']
      
    if not os.path.isfile(target_path):
        open(target_path, 'w').close()
        result['changed'] = True

    current_target_content = ""
    try:
        with open(target_path, 'r') as target_reader:
            current_target_content = target_reader.read()
    except:
        module.fail_json(msg='Error reading content from target file', **result)
    
    if current_target_content != target_content:
        try:
            with open(target_path, 'w') as target_file:
                target_file.write(target_content)
            result['changed'] = True
        except:
            module.fail_json(msg='Error writing content into target file', **result)

    module.exit_json(**result)


def main():
    run_module()


if __name__ == '__main__':
    main()
```

**Шаг 4.** Проверьте module на исполняемость локально.

![1_4_run](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/06/1_4_run.png?raw=true)


**Шаг 5.** Напишите single task playbook и используйте module в нём.

![1_5_playbook](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/06/1_5_playbook.png?raw=true)


**Шаг 6.** Проверьте через playbook на идемпотентность.

![1_6_idempotent](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/06/1_6_idempotent.png?raw=true)


**Шаг 7.** Выйдите из виртуального окружения.

**+**


**Шаг 8.** Инициализируйте новую collection: `ansible-galaxy collection init spasmaaan.yandex_cloud_elk`.

**+**

[Ansible/06/src/spasmaaan/yandex_cloud_elk](https://github.com/spasmaaan/netology-learning/tree/yc_elk_1.0.0/Ansible/06/src/spasmaaan/yandex_cloud_elk)


**Шаг 9.** В эту collection перенесите свой module в соответствующую директорию.

**+**


**Шаг 10.** Single task playbook преобразуйте в single task role и перенесите в collection. У role должны быть default всех параметров module.

**+**


**Шаг 11.** Создайте playbook для использования этой role.

**+**


**Шаг 12.** Заполните всю документацию по collection, выложите в свой репозиторий, поставьте тег `1.0.0` на этот коммит.

**+**


**Шаг 13.** Создайте .tar.gz этой collection: `ansible-galaxy collection build` в корневой директории collection.

**+**

[spasmaaan-yandex_cloud_elk-1.0.0.tar.gz](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/06/src/spasmaaan/yandex_cloud_elk/spasmaaan-yandex_cloud_elk-1.0.0.tar.gz?raw=true)


**Шаг 14.** Создайте ещё одну директорию любого наименования, перенесите туда single task playbook и архив c collection.

[Ansible/06/src/test_collection](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/06/src/test_collection)


**Шаг 15.** Установите collection из локального архива: `ansible-galaxy collection install <archivename>.tar.gz`.

![1_15_install_collection](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/06/1_15_install_collection.png?raw=true)


**Шаг 16.** Запустите playbook, убедитесь, что он работает.

![1_16_run](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ansible/06/1_16_run.png?raw=true)


**Шаг 17.** В ответ необходимо прислать ссылки на collection и tar.gz архив, а также скриншоты выполнения пунктов 4, 6, 15 и 16.

**+**


## Необязательная часть

1. Реализуйте свой модуль для создания хостов в Yandex Cloud.



2. Модуль может и должен иметь зависимость от `yc`, основной функционал: создание ВМ с нужным сайзингом на основе нужной ОС. Дополнительные модули по созданию кластеров ClickHouse, MySQL и прочего реализовывать не надо, достаточно простейшего создания ВМ.



3. Модуль может формировать динамическое inventory, но эта часть не является обязательной, достаточно, чтобы он делал хосты с указанной спецификацией в YAML.



4. Протестируйте модуль на идемпотентность, исполнимость. При успехе добавьте этот модуль в свою коллекцию.



5. Измените playbook так, чтобы он умел создавать инфраструктуру под inventory, а после устанавливал весь ваш стек Observability на нужные хосты и настраивал его.



6. В итоге ваша коллекция обязательно должна содержать: clickhouse-role (если есть своя), lighthouse-role, vector-role, два модуля: my_own_module и модуль управления Yandex Cloud хостами и playbook, который демонстрирует создание Observability стека.


