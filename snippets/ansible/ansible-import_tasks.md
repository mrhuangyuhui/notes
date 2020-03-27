# Ansible - `import_tasks`

[Creating Reusable Playbooks](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse.html)

<https://github.com/geerlingguy/ansible-role-nginx/blob/master/tasks/main.yml>

```yml
- import_tasks: vhosts.yml
```