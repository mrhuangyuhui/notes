# Ansible Manual

<https://www.ansible.com/>

<https://github.com/ansible/ansible>

<https://galaxy.ansible.com/>

<http://jinja.pocoo.org/>

## [Installation](http://docs.ansible.com/ansible/intro_installation.html)

### YUM

```bash
yum install epel-release -y
yum install ansible -y
# 验证安装结果
$ ansible --version
# 查看安装文件
$ rpm -ql ansible
```

## Commands

### `ansible`

```bash
ansible -h
man ansible
```

命令行选项 | 说明
--- | ---
-a | 执行模块的参数
-b, --become | 切换至 root 身份执行
--become-user | 切换至指定身份执行，默认是 root。
-f | 并发线程数，默认是 5。
-i | 主机清单
--list-hosts | 列出匹配的客户机
-m | 执行模块，默认是 command。
-v, -vvv | 输出详细信息

### `ansible-doc`

```bash
ansible-doc -h
man ansible-doc
```

```bash
# 查看模块 yum 的说明文档
ansible-doc yum
```

### `ansible-galaxy`

```bash
ansible-galaxy -h
```

### `ansible-playbook`

```bash
ansible-playbook -h
```

## Files

```bash
# 配置文件
/etc/ansible/ansible.cfg
# 主机清单
/etc/ansible/hosts
```

## [Configurations](http://docs.ansible.com/ansible/latest/intro_configuration.html)

```bash
# 配置文件
/etc/ansible/ansible.cfg
# 主机清单
/etc/ansible/hosts
```

## References

### [User Guide](https://docs.ansible.com/ansible/latest/user_guide/index.html)

- [Working with Inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html)
- [Working With Playbooks](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html)
  - [Variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html)
    - [Magic Variables, and How To Access Information About Other Hosts](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#magic-variables-and-how-to-access-information-about-other-hosts)
  - [Templating (Jinja2)](https://docs.ansible.com/ansible/latest/user_guide/playbooks_templating.html)
  - [Conditionals](https://docs.ansible.com/ansible/latest/user_guide/playbooks_conditionals.html)
  - [Loops](https://docs.ansible.com/ansible/latest/user_guide/playbooks_loops.html)
  - Advanced Playbooks Features
    - [Setting the Environment (and Working With Proxies)](https://docs.ansible.com/ansible/latest/user_guide/playbooks_environment.html)
    - [Playbook Keywords](https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html#playbook-keywords)
- [Working with Patterns](https://docs.ansible.com/ansible/latest/user_guide/intro_patterns.html)
- [Working With Modules](https://docs.ansible.com/ansible/latest/user_guide/modules.html)
  - [Module Index](https://docs.ansible.com/ansible/latest/modules/modules_by_category.html)

## Examples

[ansible-examples](https://github.com/ansible/ansible-examples)

[language_features](https://github.com/ansible/ansible-examples/tree/master/language_features)

## Tutorials

<https://docs.ansible.com/>

## Books

[Ansible 权威指南](http://mrhuangyuhui.gitee.io/books/ZRzxpt.html)