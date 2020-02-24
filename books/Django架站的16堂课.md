# Django架站的16堂课

示例源码：http://pan.baidu.com/s/1pLIuFXp

## 第一堂

### 搭建开发环境

操作系统：Ubuntu 14.04.4 x64

安装pip和git
```
$ apt-get update; apt-get -y install python-pip git
```

安装Django
```
$ pip install django==1.8.13
```

配置git提交信息
```
$ git config --global user.name "Yuhui Huang"
$ git config --global user.email mrhuangyuhui@gmail.com
```

创建公钥和私钥，用于GitHub认证。
```
$ ssh-keygen
```

下载练习代码
```
$ git clone git@github.com:mrhuangyuhui/demo-django.git
```

切换到本书练习代码的分支
```
$ git checkout book1
```

## 第二堂

```
$ django-admin startproject mblog
```

```
$ python manage.py startapp mainsite
```

42页：在mblog/mblog/settings.py上修改
```
ALLOWED_HOSTS = ['128.199.153.136',]
```

42页：启动服务器
```
$ python manage.py runserver 128.199.153.136
```

```
$ python manage.py migrate
```



47页：定义数据模型

mblog/mainsite/models.py
```
from django.db import models
from django.utils import timezone

class Post(models.Model):
    title = models.CharField(max_length=200)
    slug = models.CharField(max_length=200)
    body = models.TextField()
    pub_date = models.DateTimeField(default=timezone.now)

    class Meta:
	ordering = ('-pub_date',)

    def __unicode__(self):
	return self.title
```

47页：安装pytz模块
```
$ pip install pytz
```

47页：让数据模型生效
```
$ python manage.py makemigrations mainsite
$ python manage.py migrate
```

48页：创建数据库内容管理界面的账号及密码
```
$ python manage.py createsuperuser
```

48页：注册数据模型Post

mblog/mainsite/admin.py
```
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

52页：设置数据项的显示字段
```
from django.contrib import admin
from .models import Post

class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'pub_date')

admin.site.register(Post, PostAdmin)
```

53页：读取数据库中的内容

mblog/mainsite/views.py
```
from django.shortcuts import render
from django.http import HttpResponse
from .models import Post

def homepage(request):
    posts = Post.objects.all()
    post_lists = list()
    for count, post in enumerate(posts):
        post_lists.append("No.{}: ".format(str(count)) + str(post) + "<br>")
    return HttpResponse(post_lists)
```

## 第4堂

114页：创建项目
```
$ django-admin startproject mynewsite
```

114页：创建App
```
$ cd mynewsite/
$ python manage.py startapp myapp
```



将mblog/mainsite/migrations/0001_initial.py转化为SQL语句
```
$ python manage.py sqlmigrate mainsite 0001
BEGIN;
CREATE TABLE "mainsite_post" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(200) NOT NULL, "slug" varchar(200) NOT NULL, "body" text NOT NULL, "pub_date" datetime NOT NULL);

COMMIT;
```







 
