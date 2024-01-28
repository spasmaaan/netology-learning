# Задание 1

Yandex Cloud Toolbox версии 3.12.2023 г.

```bash
> terraform -v
Your version of Terraform is out of date! The latest version
is 1.6.6.

> packer -v
1.9.1

> pulumi version
v3.70.0

> helm version
version.BuildInfo{Version:"v3.12.0", GitCommit:"c9f554d75773799f72ceef38c51210f1842a1dea", GitTreeState:"clean", GoVersion:"go1.20.3"}

> kubectl version
Client Version: version.Info{Major:"1", Minor:"27", GitVersion:"v1.27.2", GitCommit:"7f6f68fdabc4df88cfea2dcf9a19b2b830f1e647", GitTreeState:"clean", BuildDate:"2023-05-17T14:20:07Z", GoVersion:"go1.20.4", Compiler:"gc", Platform:"linux/amd64"}

> grpcurl –version
grpcurl v1.8.7

> jq –version
jq-1.6

> yq –version
yq (https://github.com/mikefarah/yq/) version v4.34.1

> docker –version
Docker version 20.10.21, build 20.10.21-0ubuntu1~22.04.3

> git –version
git version 2.34.1

> tree –version
tree v2.0.2 (c) 1996 - 2022 by Steve Baker, Thomas Moore, Francesc Rocher, Florian Sesser, Kyosuke Tokoro

> tmux -V
tmux 3.2a
```

# Задание 2

Выбор в зависимости от типа платформы:

* Физический сервер.
**VMWare vSphere**, **VMWare ESXi**, **Hyper-V**, **Xen**, **Citrix**.
* Паравиртуализация.
**Parallelrs**, **VirtualBox**, **Hyper-V**, **ProxMox**, **KVM**.
* Виртуализация уровня ОС.
**LXV**, **OpenVZ**, **Docker**, **PodMan**.

Выбор в зависимости от задачи:

* Высоконагруженная БД MySql, критичная к отказу.
**Xen**
* Раличные web-приложения.
**LXV**, **OpenVZ**, **Docker**, **PodMan**.
* Windows-системы для использования бухгалтерским отделом.
**Hyper-V**
* Системы, выполняющие высокопроизводительные расчёты на GPU.
**VMWare**

# Задание 3

Выберите подходящую систему управления виртуализацией для предложенного сценария. Опишите ваш выбор.

**Сценарии**:

* 100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows based-инфраструктура, требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий.
**VMWare**.

* Требуется наиболее производительное бесплатное open source-решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.
**KVM**, **ProxMox**.

* Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows-инфраструктуры.
**Hyper-V**.

* Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.
**VirtualBox**, **ProxMox**.

# Задание 4

Опишите возможные проблемы и недостатки гетерогенной среды виртуализации (использования нескольких систем управления виртуализацией одновременно) и что необходимо сделать для минимизации этих рисков и проблем. Если бы у вас был выбор, создавали бы вы гетерогенную среду или нет?

Проблемы такой среды: конкуренция за ресурсы компьютера.
Для минимизации рисков необходимо каждую среду виртуализации поместить в гостевую ОС и работать с ними уже там.
Т.е. необходимо жёсткое разделение ресурсов между разными средами виртуализации, для исключения конкуренции за ресурсы.