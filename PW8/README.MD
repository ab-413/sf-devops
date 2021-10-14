### Что нужно сделать:
1. Создать в Я.Облаке виртуальную машину со следующими характеристиками: 2vCPU, 2GB, RAM, 20GB, HDD.
2. Поднять на этой машине CI-сервер на ваш выбор.
3. Создать репозиторий (github/gitlab/проч. на ваше усмотрение) и создать там файл `index.html`.
4. Настроить CI:
- Запускающий контейнер с `nginx` (версия на ваше усмотрение) с пробросом порта 80 в порт 9889 хостовой системы. При обращении к `nginx` в контейнере по HTTP, `nginx` должен выдавать измененный файл `index.html`.
- Проверяющий код ответа запущенного контейнера при HTTP-запросе (код должен быть 200).
- Сравнивающий md5-сумму измененного файла с md5-суммой файла, отдаваемого `nginx` при HTTP-запросе (суммы должны совпадать).
- Триггер для старта CI: внесение изменений в созданный вами файл `index.html` из п.3. В случае выявления ошибки (в двух предыдущих пунктах), должно отправляться оповещение вам в удобный канал связи — Telegram/Slack/email. Текст оповещения — на ваше усмотрение.
- После выполнения CI созданный контейнер удаляется.
5. Прислать ментору написанный вами для CI код (или скрин с описанием джоба), а также ссылку на репозиторий и на развернутую CI-систему.
---

### Решение

[Jenkinsfile](https://github.com/AleXDev25/sf-devops/blob/PW8/PW8/Jenkinsfile)\
[Job log](https://github.com/AleXDev25/sf-devops/blob/PW8/PW8/job.log)

Proof:
![](https://github.com/AleXDev25/sf-devops/blob/PW8/PW8/Pics/jenkins-job-1.jpg)
![](https://github.com/AleXDev25/sf-devops/blob/PW8/PW8/Pics/jenkins-job-2.jpg)
![](https://github.com/AleXDev25/sf-devops/blob/PW8/PW8/Pics/jenkins-job-3.jpg)
![](https://github.com/AleXDev25/sf-devops/blob/PW8/PW8/Pics/jenkins-job-4.jpg)
![Success job](https://github.com/AleXDev25/sf-devops/blob/PW8/PW8/Pics/jenkins-pipeline-success.jpg)
![Message in telegram](https://github.com/AleXDev25/sf-devops/blob/PW8/PW8/Pics/jenkins-telegram.jpg)
