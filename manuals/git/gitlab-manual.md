# [GitLab Manual](https://github.com/mrhuangyuhui/gitlab)

https://gitlab.com/

https://about.gitlab.com/

## [Installation](https://about.gitlab.com/installation/)

> We strongly recommend at least 4GB of free memory to run GitLab.

[Ubuntu](https://about.gitlab.com/installation/#ubuntu)

[Debian](https://about.gitlab.com/installation/#debian)

[CentOS 6](https://about.gitlab.com/installation/#centos-6)

### [CentOS 7](https://about.gitlab.com/installation/#centos-7)

https://github.com/mrhuangyuhui/gitlab/blob/master/install-gitlab-centos7.sh

```bash
./install-gitlab-centos7.sh http://example.com
```

### [Docker](https://docs.gitlab.com/ce/install/docker.html)

https://docs.gitlab.com/omnibus/docker/

https://hub.docker.com/r/gitlab/

https://github.com/mrhuangyuhui/gitlab/blob/master/docker-compose.yml

```
docker-compose up

docker exec -it gitlab /bin/bash

docker exec -it gitlab vi /etc/gitlab/gitlab.rb

docker restart gitlab
```

### [SMTP settings](https://docs.gitlab.com/omnibus/settings/smtp.html)

```bash
vim /etc/gitlab/gitlab.rb
```

```bash
gitlab-ctl reconfigure
```

```bash
gitlab-rails console
```

```
irb> Notify.test_email('mrhuangyuhui@qq.com', 'Message Subject', 'Message Body').deliver_now
```

mail.qq.com
```
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.exmail.qq.com"
gitlab_rails['smtp_port'] = 465
gitlab_rails['smtp_user_name'] = "mrhuangyuhui@qq.com"
gitlab_rails['smtp_password'] = "fwwjbmjacmcmbbhc"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = true
gitlab_rails['gitlab_email_from'] = 'mrhuangyuhui@qq.com'
```

mail.163.com
```
gitlab_rails['smtp_enable'] = true  
gitlab_rails['smtp_address'] = "smtp.163.com"  
gitlab_rails['smtp_port'] = 25   
gitlab_rails['smtp_user_name'] = "mrhuangyuhui@163.com"  
gitlab_rails['smtp_password'] = "Passw0rd"  
gitlab_rails['smtp_domain'] = "163.com"  
gitlab_rails['smtp_authentication'] = :login  
gitlab_rails['smtp_enable_starttls_auto'] = true  
gitlab_rails['gitlab_email_from'] = "mrhuangyuhui@163.com"
```

### [Third-party applications that support GitLab](https://about.gitlab.com/applications)

## Configuration

https://gitlab.com/gitlab-org/omnibus-gitlab/raw/master/files/gitlab-config-template/gitlab.rb.template

## Documentation

https://docs.gitlab.com/

