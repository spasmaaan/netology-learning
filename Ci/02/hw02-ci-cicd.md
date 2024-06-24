# Домашнее задание к занятию 9 «Процессы CI/CD»

## Подготовка к выполнению

1. Создайте два VM в Yandex Cloud с параметрами: 2CPU 4RAM Centos7 (остальное по минимальным требованиям).

**+**

2. Пропишите в [inventory](./infrastructure/inventory/cicd/hosts.yml) [playbook](./infrastructure/site.yml) созданные хосты.

**+**

3. Добавьте в [files](./infrastructure/files/) файл со своим публичным ключом (id_rsa.pub). Если ключ называется иначе — найдите таску в плейбуке, которая использует id_rsa.pub имя, и исправьте на своё.

**+**

4. Запустите playbook, ожидайте успешного завершения.

**+**

5. Проверьте готовность SonarQube через [браузер](http://localhost:9000).

**+**

6. Зайдите под admin\admin, поменяйте пароль на свой.

**+**

7.  Проверьте готовность Nexus через [бразуер](http://localhost:8081).

**+**

8. Подключитесь под admin\admin123, поменяйте пароль, сохраните анонимный доступ.

**+**


## Знакомоство с SonarQube

### Основная часть

1. Создайте новый проект, название произвольное.

![1_1_project](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/1_1_project.png?raw=true)

2. Скачайте пакет sonar-scanner, который вам предлагает скачать SonarQube.

![1_2_wget_scanner](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/1_2_wget_scanner.png?raw=true)

3. Сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).

![1_3_link](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/1_3_link.png?raw=true)

4. Проверьте `sonar-scanner --version`.

![1_4_scanner_version](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/1_4_scanner_version.png?raw=true)

5. Запустите анализатор против кода из директории [example](./example) с дополнительным ключом `-Dsonar.coverage.exclusions=fail.py`.

![1_5_scan_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/1_5_scan_1.png?raw=true)
![1_5_scan_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/1_5_scan_2.png?raw=true)

6. Посмотрите результат в интерфейсе.

![1_6_result](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/1_6_result.png?raw=true)

7. Исправьте ошибки, которые он выявил, включая warnings.

**+**

8. Запустите анализатор повторно — проверьте, что QG пройдены успешно.

![1_8_fix_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/1_8_fix_1.png?raw=true)
![1_8_fix_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/1_8_fix_2.png?raw=true)

9. Сделайте скриншот успешного прохождения анализа, приложите к решению ДЗ.

![1_9_fixed](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/1_9_fixed.png?raw=true)


## Знакомство с Nexus

### Основная часть

1. В репозиторий `maven-public` загрузите артефакт с GAV-параметрами:

 *    groupId: netology;
 *    artifactId: java;
 *    version: 8_282;
 *    classifier: distrib;
 *    type: tar.gz.

![2_1_load](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/2_1_load.png?raw=true)
   
2. В него же загрузите такой же артефакт, но с version: 8_102.

![2_2_prev](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/2_2_prev.png?raw=true)

3. Проверьте, что все файлы загрузились успешно.

**+**

4. В ответе пришлите файл `maven-metadata.xml` для этого артефекта.

```xml
<metadata modelVersion="1.1.0">
    <groupId>netology</groupId>
    <artifactId>java</artifactId>
    <versioning>
        <latest>8_282</latest>
        <release>8_282</release>
        <versions>
            <version>8_102</version>
            <version>8_282</version>
        </versions>
        <lastUpdated>20240624202452</lastUpdated>
    </versioning>
</metadata>
```


### Знакомство с Maven

### Подготовка к выполнению

1. Скачайте дистрибутив с [maven](https://maven.apache.org/download.cgi).

![3_0_1_download](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/3_0_1_download.png?raw=true)

2. Разархивируйте, сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).

![3_0_2_unpack](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/3_0_2_unpack.png?raw=true)

3. Удалите из `apache-maven-<version>/conf/settings.xml` упоминание о правиле, отвергающем HTTP- соединение — раздел mirrors —> id: my-repository-http-unblocker.

![3_0_3_config](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/3_0_3_config.png?raw=true)

4. Проверьте `mvn --version`.

![3_0_4_version](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/3_0_4_version.png?raw=true)

5. Заберите директорию [mvn](./mvn) с pom.

![3_0_5_mvn](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/3_0_5_mvn.png?raw=true)


### Основная часть

1. Поменяйте в `pom.xml` блок с зависимостями под ваш артефакт из первого пункта задания для Nexus (java с версией 8_282).

![3_1_pom](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/3_1_pom.png?raw=true)

2. Запустите команду `mvn package` в директории с `pom.xml`, ожидайте успешного окончания.

![3_2_package](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/3_2_package.png?raw=true)

3. Проверьте директорию `~/.m2/repository/`, найдите ваш артефакт.

![3_3_dir](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/3_3_dir.png?raw=true)

4. В ответе пришлите исправленный файл `pom.xml`.

[mvn/pom.xml](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/02/src/mvn/pom.xml?raw=true)
