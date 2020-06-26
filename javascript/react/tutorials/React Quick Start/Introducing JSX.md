# [Introducing JSX](https://reactjs.org/docs/introducing-jsx.html)

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
    <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
    <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>
</head>
<body>
    <div id="root"></div>
    <script type="text/babel">
        function formatName(user) {
            return user.firstName + ' ' + user.lastName;
        }

        const user = {
            firstName: 'Harper',
            lastName: 'Perez'
        }

        const element = (
            <h1>
                Hello, {formatName(user)}!
            </h1>
        )

        ReactDOM.render(
            element,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

