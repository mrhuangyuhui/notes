# Ansible - Inventory

[Working with Inventory](http://docs.ansible.com/ansible/latest/intro_inventory.html)

[第 2 章 Ansible 基础元素介绍](https://gitee.com/mrhuangyuhui/notes/blob/master/books/ansible/ansible-guide/ch02.md)

```bash
# 使用默认主机清单 /etc/ansible/hosts
ansible webs -m ping
# 指定主机清单
ansible -i ./myhosts webs -m ping
```