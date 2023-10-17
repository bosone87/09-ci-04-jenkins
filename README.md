# Домашнее задание к занятию 10 «Jenkins»

## Подготовка к выполнению

1. Создать два VM: для jenkins-master и jenkins-agent.
**VM в Yandex Cloud разворачиваются по средствам terraform, создаётся динамический hosts-файл**
2. Установить Jenkins при помощи playbook.
<p align="center">
    <img width="1200 height="600" src="/scr/ansible-playbook.png">
</p>

3. Запустить и проверить работоспособность.
<p align="center">
    <img width="1200 height="600" src="/scr/unlock_jenkins.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/initialadminpass_jenkins.png">
</p>
4. Сделать первоначальную настройку.
<p align="center">
    <img width="1200 height="600" src="/scr/add_agent-ssh.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/agetns_jenkins.png">
</p>

## Основная часть

1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.
<p align="center">
    <img width="1200 height="600" src="/scr/freestyle_items.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/freestyle_molecule1.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/freestyle_molecule2.png">
</p>

2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.
<p align="center">
    <img width="1200 height="600" src="/scr/pipeline_molecule1.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/pipeline_molecule2.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/items_jenkins.png">
</p>

3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.
<p align="center">
    <img width="1200 height="600" src="/scr/declarative_pipeline1.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/declarative_pipeline2.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/declarative_pipeline3.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/declarative_pipeline4.png">
</p>

4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.
<p align="center">
    <img width="1200 height="600" src="/scr/multibranch_pipeline1.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/multibranch_pipeline2.png">scripted_pipeline3
</p>

5. Создать Scripted Pipeline, наполнить его скриптом из [pipeline](./pipeline).
6. Внести необходимые изменения, чтобы Pipeline запускал `ansible-playbook` без флагов `--check --diff`, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами `--check --diff`.
<p align="center">
    <img width="1200 height="600" src="/scr/scripted_pipeline1.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/scripted_pipeline2.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/scripted_pipeline3.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/scripted_pipeline4.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/scripted_pipeline5.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/scripted_pipeline6.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/scr/scripted_pipeline7.png">
</p>

7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл
**[ScriptedJenkinsfile](./ScriptedJenkinsfile)**.

8. Отправить ссылку на репозиторий с ролью и Declarative Pipeline и Scripted Pipeline.

## Необязательная часть

1. Создать скрипт на groovy, который будет собирать все Job, завершившиеся хотя бы раз неуспешно. Добавить скрипт в репозиторий с решением и названием `AllJobFailure.groovy`.
2. Создать Scripted Pipeline так, чтобы он мог сначала запустить через Yandex Cloud CLI необходимое количество инстансов, прописать их в инвентори плейбука и после этого запускать плейбук. Мы должны при нажатии кнопки получить готовую к использованию систему.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
