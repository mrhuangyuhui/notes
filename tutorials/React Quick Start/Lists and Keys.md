# [Lists and Keys](https://reactjs.org/docs/lists-and-keys.html)

## Rendering Multiple Components

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
        const numbers = [1, 2, 3, 4, 5]
        const listItems = numbers.map((number) => <li>{number}</li>)

        ReactDOM.render(
            <ul>{listItems}</ul>,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## Basic List Component

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
        function NumberList(props) {
            const numbers = props.numbers
            const listItems = numbers.map((number) => 
                <li key={number.toString()}>{number}</li>
            )
            return (
                <ul>{listItems}</ul>
            )
        }
        const numbers = [1, 2, 3, 4, 5]

        ReactDOM.render(
            <NumberList numbers={numbers} />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## Extracting Components with Keys

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
        function ListItem(props) {
            return <li>{props.value}</li>
        }

        function NumberList(props) {
            const numbers = props.numbers
            const listItems = numbers.map((number) => 
                <ListItem key={number.toString()} value={number} />
            )
            return (
                <ul>{listItems}</ul>
            )
        }
        const numbers = [1, 2, 3, 4, 5]

        ReactDOM.render(
            <NumberList numbers={numbers} />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## Keys Must Only Be Unique Among Siblings

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
        function Blog(props) {
            const sidebar = (
                <ul>
                    {props.posts.map((post) => 
                        <li key={post.id}>
                            {post.title}
                        </li>
                    )}
                </ul>
            )

            const content = props.posts.map((post) => 
                <div key={post.id}>
                    <h3>{post.title}</h3>
                    <p>{post.content}</p>
                </div>
            )

            return (
                <div>
                    {sidebar}
                    <hr />
                    {content}
                </div>
            )
        }

        const posts = [
            {id: 1, title: 'Hello World', content: 'Welcome to learning React!'},
            {id: 2, title: 'Installation', content: 'You can install React from npm.'}
        ]

        ReactDOM.render(
            <Blog posts={posts} />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## Embedding map() in JSX

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
        function ListItem(props) {
            return <li>{props.value}</li>
        }

        function NumberList(props) {
            const numbers = props.numbers
            return (
                <ul>
                    {numbers.map((number) => 
                        <ListItem key={number.toString()} value={number} />
                    )}
                </ul>
            )
        }
        const numbers = [1, 2, 3, 4, 5]

        ReactDOM.render(
            <NumberList numbers={numbers} />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```
