# SF DevOps

### Репозиторий
```
https://github.com/ab-413/somerepo
```

### Внесение правок

- Разработчик вносит правки в отдельной ветке от ``` master ``` в своем локальном репозитории.

- Разработчик отправляет эту ветку в публичный репозиторий командой `push`.

- Разработчик создает pull-request через GitHub.

- Остальные участники команды проверяют код, обсуждают его и вносят изменения.

- Человек, ответсвенный за проект, сливает функцию в ``` master ``` и закрывает pull-request.

Ветки называть по шаблону ` *jira_tag*_*short task name* ` (Example: ```OP-12_Add-API```)

### Настройка Git

- Имя `git config --global user.name "You name"`
- E-Mail `git config --global user.email "You email"`


##### Пример действий:

```
$ git config --global user.name "You name"
$ git config --global user.email "You email"

$ git clone https://github.com/ab-413/somerepo.git
$ git checkout -b OP-12_Add-API

*edit code*

$ git add .
$ git commit -m "Comment"
$ git push --set-upstream origin OP-12_Add-API

*create pull-request on GitHub*
```