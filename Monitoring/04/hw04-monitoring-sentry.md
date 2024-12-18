# Домашнее задание к занятию 16 «Платформа мониторинга Sentry»

## Задание 1

Так как Self-Hosted Sentry довольно требовательная к ресурсам система, мы будем использовать Free Сloud account.

Free Cloud account имеет ограничения:

- 5 000 errors;
- 10 000 transactions;
- 1 GB attachments.

Для подключения Free Cloud account:

- зайдите на sentry.io;
- нажмите «Try for free»;
- используйте авторизацию через ваш GitHub-аккаунт;
- далее следуйте инструкциям.

В качестве решения задания пришлите скриншот меню Projects.

**Развернул Self-hosted Sentry, т.к. Cloud версия недоступна в РФ.**

![1_projects](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/1_projects.png?raw=true)

## Задание 2

1. Создайте python-проект и нажмите `Generate sample event` для генерации тестового события.

![2_1_test](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/2_1_test.png?raw=true)

2. Изучите информацию, представленную в событии.

![2_2_events](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/2_2_events.png?raw=true)

3. Перейдите в список событий проекта, выберите созданное вами и нажмите `Resolved`.

![2_3_resolve](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/2_3_resolve.png?raw=true)

4. В качестве решения задание предоставьте скриншот `Stack trace` из этого события и список событий проекта после нажатия `Resolved`.

![2_4_stackTrace](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/2_4_stackTrace.png?raw=true)
![2_4_events](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/2_4_events.png?raw=true)

## Задание 3

1. Перейдите в создание правил алёртинга.

![3_1_alerts](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/3_1_alerts.png?raw=true)

2. Выберите проект и создайте дефолтное правило алёртинга без настройки полей.

![3_2_edit](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/3_2_edit.png?raw=true)

3. Снова сгенерируйте событие `Generate sample event`.
Если всё было выполнено правильно — через некоторое время вам на почту, привязанную к GitHub-аккаунту, придёт оповещение о произошедшем событии.

![3_3_mail](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/3_3_mail.png?raw=true)

4. Если сообщение не пришло — проверьте настройки аккаунта Sentry (например, привязанную почту), что у вас не было 
`sample issue` до того, как вы его сгенерировали, и то, что правило алёртинга выставлено по дефолту (во всех полях all).
Также проверьте проект, в котором вы создаёте событие — возможно алёрт привязан к другому.
**+**
5. В качестве решения задания пришлите скриншот тела сообщения из оповещения на почте.
6. Дополнительно поэкспериментируйте с правилами алёртинга. Выбирайте разные условия отправки и создавайте sample events. 

![3_6_condition](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/3_6_condition.png?raw=true)

![3_6_mail](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/3_6_mail.png?raw=true)

## Задание повышенной сложности

1. Создайте проект на ЯП Python или GO (около 10–20 строк), подключите к нему sentry SDK и отправьте несколько тестовых событий.

![main.py](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/main.py)

2. Поэкспериментируйте с различными передаваемыми параметрами, но помните об ограничениях Free учётной записи Cloud Sentry.

![4_2_runs](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/4_2_runs.png?raw=true)

3. В качестве решения задания пришлите скриншот меню issues вашего проекта и пример кода подключения sentry sdk/отсылки событий.

![4_3_events](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Monitoring/04/4_3_events.png?raw=true)
