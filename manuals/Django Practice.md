# Django Practice

https://www.djangoproject.com/

https://github.com/django/django

https://www.djangoproject.com/download/

https://www.djangoproject.com/start/

https://docs.djangoproject.com/

## Installation

[What Python version can I use with Django?](https://docs.djangoproject.com/en/stable/faq/install/#faq-python-version-support)

[Quick install guide](https://docs.djangoproject.com/en/stable/intro/install/)

[How to install Django](https://docs.djangoproject.com/en/stable/topics/install/)

Installing an official release with pip¶
```
$ pip install Django
```

Verifying
```
$ python -m django --version
```

```
>>> import django
>>> print(django.get_version())
1.11
```

## [Documentation](https://docs.djangoproject.com/)

### [Getting started](https://docs.djangoproject.com/en/stable/intro/)

Create a project
```
$ django-admin startproject mysite
```

Start the development server on the internal IP at port 8000
```
$ python manage.py runserver
```

Change the server’s port
```
$ python manage.py runserver 8080
```

Listen on all available public IPs
```
$ python manage.py runserver 0:8000
```
Notice: You may need to add public IPs to `ALLOWED_HOSTS` field of `settings.py`.

