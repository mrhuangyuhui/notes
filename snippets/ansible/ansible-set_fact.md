# Ansible - `set_fact`

<https://github.com/geerlingguy/ansible-role-nginx/blob/master/tasks/main.yml>

```yml
- name: Define nginx_user.
  set_fact:
    nginx_user: "{{ __nginx_user }}"
  when: nginx_user is not defined
```