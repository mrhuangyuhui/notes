# Ansible - Facts

[Information discovered from systems: Facts](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#information-discovered-from-systems-facts)

获取远程主机的系统信息

```bash
ansible 192.168.31.119 -m setup
```