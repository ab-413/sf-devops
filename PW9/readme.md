### Проектная работа 9

#### Что нужно сделать

1. Создать ВМ в Я.Облаке (минимальная конфигурация: **2vCPU, 2GB RAM, 20GB HDD**).
2. Установить и запустить на ВМ **Docker**.
3. Установить и запустить на ВМ СУБД **Postgres**.
4. В **Postgres** создать БД и пользователя с произвольным именем на ваш выбор и дать этому пользователю полные права на созданную БД.
5. Создать **Docker**-образ:
- Содержащий **Python 3**, а также библиотеки для него: **Flask, Psycopg2** (для работы с СУБД **Postgres**, хранящей данные) и **ConfigParser**.
- Содержащий код приложения на **Python** (копирующий его с локальной файловой системы). На хостовой ФС код будет лежать по пути:`/srv/app/web.py`.
- Содержащий конфигурационный файл приложения (копирующий его с локальной ФС). На хостовой ФС конфигурационный файл будет лежать по пути: `/srv/app/conf/web.conf`.
- При запуске контейнера, он должен запускать описанный выше код.
- Образ должен быть оптимизирован с учетом лучших практик.
- Пришлите ментору свой **Dockerfile**, скриншот с работающим приложением и размер образа.

Для проверки работоспособности образа можно использовать [приложение из репозитория](https://github.com/SkillfactoryCoding/DEVOPS-praktikum_Docker) (не забудьте поправить конфиг-файл).

Для этого потребуется склонировать репозиторий из **GitHub**, создать директорию `/srv/app/conf` и расположить файлы из склонированного репозитория так:

- `web.py` расположить в `/srv/app/`;
- `web.conf` расположить в `/srv/app/conf/`.

Затем запустить **Docker**-контейнер, смонтировав /srv/app с хостовой ФС в контейнерную, а также пробросив порт 80 из контейнера в хостовую сеть.

---

### Решение

1. *Clone repo
2. `sudo mkdir /srv/app && sudo rsync -av --progress . $_ --exclude pics`
3. `cd /srv/app`
4. `docker build -t sfapp .`
5. `docker run -d -p 80:5000 -v /srv/app:/srv/app sfapp:latest` 
6. Go to http://yandex_vm_ext_IP
7. **Profit!!!**

![](https://github.com/AleXDev25/sf-devops/blob/master/PW9/pics/sfapp_proof.jpg)

Docker image sizes

| Docker image  | Base image      | Size     |
|---------------|:---------------:|---------:|
|sfapp:slim     |python:3.9.0-slim  |134MB     |
|sfapp:alpine*  |python:3.9.0-alpine*|505MB*    |
|sfapp:origin   |python:3.9.0       |905MB     |
|sfapp:builder  |python:3.9.0 as builder|135MB |

![](https://github.com/AleXDev25/sf-devops/blob/master/PW9/pics/image_sizes.jpg)

>*Размер sfapp:alpine больше slim, хотя базовый образ всего 46М, потому что для установки psycopg2 не хватает зависимостей, для исправления приходится запихивать это: `RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev` в Dockerfile.
