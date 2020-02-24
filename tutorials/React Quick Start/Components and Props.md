# [Components and Props](https://reactjs.org/docs/components-and-props.html)

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
        function Welcome(props) {
            return <h1>Hello, {props.name}</h1>
        }

        const element = <Welcome name="Sara" />
        ReactDOM.render(
            element,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

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
        class Welcome extends React.Component {
            render() {
                return <h1>Hello, {this.props.name}</h1>
            }
        }

        const element = <Welcome name="Sara" />
        ReactDOM.render(
            element,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

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
        function Welcome(props) {
            return <h1>Hello, {props.name}</h1>
        }

        function App() {
            return (
                <div>
                    <Welcome name="Sara" />
                    <Welcome name="Cahal" />
                    <Welcome name="Edite" />
                </div>
            )
        }

        ReactDOM.render(
            <App />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

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
        function formatDate(date) {
            return date.toLocaleDateString();
        }

        function Avatar(props) {
            return (
                <img
                    className="Avatar"
                    src={props.user.avatarUrl}
                    alt={props.user.name}
                />
            )
        }

        function UserInfo(props) {
            return (
                <div className="UserInfo">
                    <Avatar user={props.user} />
                    <div className="UserInfo-name">
                        {props.user.name}
                    </div>
                </div>
            )
        }

        function Comment(props) {
            return (
                <div className="Comment">
                    <UserInfo user={props.author} />
                    <div className="Comment-text">
                        {props.text}
                    </div>
                    <div className="Comment-date">
                        {formatDate(props.date)}
                    </div>
                </div>
            )
        }

        const comment = {
            date: new Date(),
            text: 'I hope you enjoy learning React!',
            author: {
                name: 'Hello Kitty',
                avatarUrl: 'http://placekitten.com/g/64/64',
            }
        }

        ReactDOM.render(
            <Comment
                author={comment.author}
                text={comment.text}
                date={comment.date}
            />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

