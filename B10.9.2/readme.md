### Задание B10.9.2

1. Создайте Ansible-роль, настраивающую кэширующий DNS-сервер `dnsmasq`. Примените ее.
2. Напишите Ansible-playbook, создающий группу пользователей superusers, куда входят пользователи user2 и user3, и которая, выполнив `sudo -i`, сможет повысить свои полномочия и стать root-пользователем. Можете использовать модуль `lineinfile`. У него есть параметр validate, позволяющий проверять сделанные изменения в файле. В документации есть пример валидации sudoers-файла.
3. Самостоятельно напишите Ansible-роль, настраивающую связку nginx+php-fpm и выдающую при обращении к главной странице веб-сервера информацию о **php** (содержимое **index.php** — `<?php phpinfo();?>`).
4. Дополните роль из п.3: пусть **DocumentRoot** будет в директории `/opt/nginx/ansible`. Используйте **handler** для перечитывания конфигурации **nginx**.

---

### Решение:

1. [**Playbook**](../B10.9.2/dns.yml)
   <details>

   <summary>Screenshots</summary>

   <div align="center">
   <img src="../B10.9.2/pics/ansible-dnsmasq.jpg">
   </div>

   </details>

---

2. [**Playbook**](../B10.9.2/superusers/superusers-playbook.yml)
   <details>

   <summary>Screenshots</summary>

   <div align="center">
   <img src="../B10.9.2/pics/ansible-log-superusers.jpg">
   <br>
   <img src="../B10.9.2/pics/proof-superusers.jpg">
   </div>

   </details>

---

3. [**Playbook**](../B10.9.2/nginx-phpfpm.yml) 
   
   *Задания 3 и 4 объединены*
   
   <details>

   <summary>Screenshots</summary>

   <div align="center">
   <img src="../B10.9.2/pics/ansible-nginxphp.jpg">
   <br>
   <img src="../B10.9.2/pics/uname-nginxphp.jpg">
   <br>
   <img src="../B10.9.2/pics/phpinfo-nginxphp.jpg">
   </div>

   </details>