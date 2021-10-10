#### Что нужно сделать
1. Создать три виртуальные машины в Я.Облаке (одна будет мастером, две другие — рабочими нодами). Минимальные требования к ресурсам: 2vCPU, 2GB RAM, 20GB HDD.
2. Собрать из них Kubernetes-кластер.
3. Запустить на нем nginx, настроить его на прослушивание порта 8888.
---
Получилось реализовать путем создания кластера через консоль управления Я.Облаком, и далее применить [k8s-манифест](https://github.com/AleXDev25/sf-devops/blob/master/PW7/nginx.yaml).
Иначе, если кластер создавал руками, не создавался LoadBalancer (висел в состоянии pending)

---

![](https://github.com/AleXDev25/sf-devops/blob/master/PW7/k8s-nginx-1.jpg)
![](https://github.com/AleXDev25/sf-devops/blob/master/PW7/k8s-nginx-2.jpg)
