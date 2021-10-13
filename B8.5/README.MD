### Что необходимо сделать:

1. Требуется настроить пайплайн, который будет запускаться при изменении SQL-скрипта, хранящегося в репозитории (его выбор также на ваше усмотрение).
2. Пайплайн должен запускать изменившийся скрипт и выводить результат запроса.

Для примера предлагается два запроса:

- простейший select, который будет просто выводить первую строку таблицы:

```
select * from fr.fram_acc limit 1;
```
- и вторую выборку. Она будет выбирать все РНК крыс, хранящиеся в этой базе данных:

```
SELECT fr.rfam_acc, fr.rfamseq_acc, fr.seq_start, fr.seq_end
FROM full_region fr, rfamseq rf, taxonomy tx
WHERE rf.ncbi_id = tx.ncbi_id
AND fr.rfamseq_acc = rf.rfamseq_acc
AND tx.ncbi_id = 10116 -- NCBI taxonomy id of Rattus norvegicus
AND is_significant = 1 -- exclude low-scoring matches from the same clan
```

### Решение:

Jenkins выполняет джобу про триггеру из GitHub (push), берет пайплайн из репозитория и выполняет его.
- Stage `Run script` - Запуск клиента mysql и выполнение запроса к БД с сохраниением вывода в файл `output.txt`
- Stage `Print output` - Вывод результата запроса, первые 20 строк.

[Console output](https://github.com/AleXDev25/sf-devops/blob/B8.5/B8.5/job.log)

### Настройки джобы:
![](https://github.com/AleXDev25/sf-devops/blob/B8.5/B8.5/Pics/jenkins-job-1.jpg)
![](https://github.com/AleXDev25/sf-devops/blob/B8.5/B8.5/Pics/jenkins-job-2.jpg)
![](https://github.com/AleXDev25/sf-devops/blob/B8.5/B8.5/Pics/jenkins-job-3.jpg)
![](https://github.com/AleXDev25/sf-devops/blob/B8.5/B8.5/Pics/jenkins-job-4.jpg)