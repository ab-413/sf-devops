### Задание 9.8.7
- Создайте Docker-образ приложения, которое будет при запуске контейнера скачивать favicon заданного приложению сайта.
- Затем попробуйте улучшить этот Docker-образ согласно изученным лучшим практикам. Приложение можно написать на Python при желании.
- После создания предлагаем подумать, стоит ли такое приложение располагать в контейнере? А если оно написано на Python? На Go? Если нет, то во что должно развиться подобное приложение, чтобы его стоило запускать в контейнере?
---
#### Usage
`docker build -t getfav .`

`docker run --rm getfav -u [url]`

`wget $(docker run --rm getfav -u [url])`

![](../B9.8.7/pics/example.jpg)

### Мысли

ИМХО, не вижу смысла располагать это приложение в контейнере, оно гораздо компактнее выглядит в виде скрипта. 
Например: `wget $(python get_favicon.py)`

Еще проще для GO, т.к. код можно скомпилировать в бинарник, и он уже запустится везде (Win, Linux).

Другое дело, если это будет какое-нибудь веб приложение или сервис для загрузки фавиконов =) где можно задавать параметры, или возможно будет поиск, или скачивание пачкой) или загрузка и редактирование ¯\\_(ツ)_/¯. В таком случае думаю можно расположить приложение в контейнере.