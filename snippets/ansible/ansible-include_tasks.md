# Ansible - `include_tasks`

[Creating Reusable Playbooks](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse.html)

<https://github.com/geerlingguy/ansible-role-nginx/blob/master/tasks/main.yml>

```yml
- include_tasks: setup-RedHat.yml
  when: ansible_os_family == 'RedHat'
```