# Домашнее задание к занятию 11 «Teamcity»

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.
![01_teamcity_server](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/01_teamcity_server.png?raw=true)

2. Дождитесь запуска teamcity, выполните первоначальную настройку.
![02_teamcity_server_run](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/02_teamcity_server_run.png?raw=true)

3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.
![03_teamcity_agent](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/03_teamcity_agent.png?raw=true)

4. Авторизуйте агент.
![04_auth_agent](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/04_auth_agent.png?raw=true)
![04_auth_agent_done](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/04_auth_agent_done.png?raw=true)

5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).
Ссылка: <https://github.com/spasmaaan/example-teamcity-fork>

6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).
![06_teamcity_target](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/06_teamcity_target.png?raw=true)
![06_playbook_1](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/06_playbook_1.png?raw=true)
![06_playbook_2](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/06_playbook_2.png?raw=true)

## Основная часть

1. Создайте новый проект в teamcity на основе fork.
![1_new_project](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/1_new_project.png?raw=true)
![1_add_git](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/1_add_git.png?raw=true)

2. Сделайте autodetect конфигурации.
![2_start_autodetect](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/2_start_autodetect.png?raw=true)
![2_end_autodetect](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/2_end_autodetect.png?raw=true)

3. Сохраните необходимые шаги, запустите первую сборку master.
![3_build](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/3_build.png?raw=true)

4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.
![4_deploy](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/4_deploy.png?raw=true)
![4_build](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/4_build.png?raw=true)

5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.
![5_settings](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/5_settings.png?raw=true)

6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.
![6_nexus_link](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/6_nexus_link.png?raw=true)

7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.
![7_deploy](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/7_deploy.png?raw=true)
![7_nexus](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/7_nexus.png?raw=true)

8. Мигрируйте `build configuration` в репозиторий.
![8_repository](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/8_repository.png?raw=true)

9. Создайте отдельную ветку `feature/add_reply` в репозитории.
![9_new_branch](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/9_new_branch.png?raw=true)

10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.
![10_say_hunter](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/10_say_hunter.png?raw=true)

11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.
![11_test](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/11_test.png?raw=true)

12. Сделайте push всех изменений в новую ветку репозитория.
![12_push](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/12_push.png?raw=true)

13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.
![13_ready](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/13_ready.png?raw=true)

14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.
![14_merge](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/14_merge.png?raw=true)

15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.
![15_artifacts](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/15_artifacts.png?raw=true)

16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.
![16_jar](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/16_jar.png?raw=true)

17. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.
![17_build_artifacts](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/17_build_artifacts.png?raw=true)

18. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.


19. В ответе пришлите ссылку на репозиторий.
https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/05/
https://github.com/spasmaaan/example-teamcity-fork/tree/master
