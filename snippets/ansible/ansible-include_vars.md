# Ansible - `include_vars`

[Creating Reusable Playbooks](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse.html)

<https://github.com/geerlingguy/ansible-role-nginx/blob/master/tasks/main.yml>

```yml
- name: Include OS-specific variables.
  include_vars: "{{ ansible_os_family }}.yml"
```