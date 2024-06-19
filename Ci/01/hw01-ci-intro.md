## Основная часть

![0_1_statuses](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/0_1_statuses.png?raw=true)

Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

1. Open -> On reproduce.
2. On reproduce -> Open, Done reproduce.
3. Done reproduce -> On fix.
4. On fix -> On reproduce, Done fix.
5. Done fix -> On test.
6. On test -> On fix, Done.
7. Done -> Closed, Open.

![0_2_bugs](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/0_2_bugs.png?raw=true)

Остальные задачи должны проходить по упрощённому workflow:

1. Open -> On develop.
2. On develop -> Open, Done develop.
3. Done develop -> On test.
4. On test -> On develop, Done.
5. Done -> Closed, Open.

![0_3_tasks](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/0_3_tasks.png?raw=true)

Т.к. истории и эпики это не задачи, у них отдельный workflow:

![0_4_epics](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/0_4_epics.png?raw=true)


**Что нужно сделать**

1. Создайте задачу с типом bug, попытайтесь провести его по всему workflow до Done.

*Увлёкся и перевёл дальше в **Closed**, ну а из этого статуса уже не вывести.*
![1_bug_to_done](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/1_bug_to_done.png?raw=true)

2. Создайте задачу с типом epic, к ней привяжите несколько задач с типом task, проведите их по всему workflow до Done.

![2_epic](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/2_epic.png?raw=true)

3. При проведении обеих задач по статусам используйте kanban.

![3_tasks_done](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/3_tasks_done.png?raw=true)

4. Верните задачи в статус Open.

![4_tasks_to_open](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/4_tasks_to_open.png?raw=true)

5. Перейдите в Scrum, запланируйте новый спринт, состоящий из задач эпика и одного бага, стартуйте спринт, проведите задачи до состояния Closed. Закройте спринт.

![5_1_sprint](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/5_1_sprint.png?raw=true)

![5_2_close](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/5_2_close.png?raw=true)

![5_3_close_sprint](https://github.com/spasmaaan/netology-learning/blob/cource/ShDevOps/Ci/01/5_3_close_sprint.png?raw=true)

6. Если всё отработалось в рамках ожидания — выгрузите схемы workflow для импорта в XML. Файлы с workflow и скриншоты workflow приложите к решению задания.

**Нечем выгрузить workflows.**
Скриншоты с workflow выше.