# [State and Lifecycle](https://reactjs.org/docs/state-and-lifecycle.html)

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
        function Clock(props) {
            return (
                <div>
                    <h1>Hello, world!</h1>
                    <h2>It is {props.date.toLocaleTimeString()}.</h2>
                </div>
            )
        }

        function tick() {
            ReactDOM.render(
                <Clock date={new Date()} />,
                document.getElementById('root')
            )
        }

        setInterval(tick, 1000)
    </script>
</body>
</html>
```

## Converting a Function to a Class

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
        class Clock extends React.Component {
            render() {
                return (
                    <div>
                        <h1>Hello, world!</h1>
                        <h2>It is {this.props.date.toLocaleTimeString()}.</h2>
                    </div>
                )
            }
        }

        function tick() {
            ReactDOM.render(
                <Clock date={new Date()} />,
                document.getElementById('root')
            )
        }

        setInterval(tick, 1000)
    </script>
</body>
</html>
```

## Adding Local State to a Class

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
        class Clock extends React.Component {
            constructor(props) {
                super(props)
                this.state = {date: new Date()}
            }
            render() {
                return (
                    <div>
                        <h1>Hello, world!</h1>
                        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
                    </div>
                )
            }
        }

        ReactDOM.render(
            <Clock />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## Adding Lifecycle Methods to a Class

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
        class Clock extends React.Component {
            constructor(props) {
                super(props)
                this.state = {date: new Date()}
            }

            componentDidMount() {
                this.timerID = setInterval(
                    () => this.tick(),
                    1000
                )
            }

            componentWillUnmount() {
                clearInterval(this.timerID)
            }

            tick() {
                this.setState({
                    date: new Date()
                })
            }

            render() {
                return (
                    <div>
                        <h1>Hello, world!</h1>
                        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
                    </div>
                )
            }
        }

        ReactDOM.render(
            <Clock />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## The Data Flows Down

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
        function FormattedDate(props) {
            return <h2>It is {props.date.toLocaleTimeString()}.</h2>
        }

        class Clock extends React.Component {
            constructor(props) {
                super(props)
                this.state = {date: new Date()}
            }

            componentDidMount() {
                this.timerID = setInterval(
                    () => this.tick(),
                    1000
                )
            }

            componentWillUnmount() {
                clearInterval(this.timerID)
            }

            tick() {
                this.setState({
                    date: new Date()
                })
            }

            render() {
                return (
                    <div>
                        <h1>Hello, world!</h1>
                        <FormattedDate date={this.state.date} />
                    </div>
                )
            }
        }

        ReactDOM.render(
            <Clock />,
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
        function FormattedDate(props) {
            return <h2>It is {props.date.toLocaleTimeString()}.</h2>
        }

        class Clock extends React.Component {
            constructor(props) {
                super(props)
                this.state = {date: new Date()}
            }

            componentDidMount() {
                this.timerID = setInterval(
                    () => this.tick(),
                    1000
                )
            }

            componentWillUnmount() {
                clearInterval(this.timerID)
            }

            tick() {
                this.setState({
                    date: new Date()
                })
            }

            render() {
                return (
                    <div>
                        <h1>Hello, world!</h1>
                        <FormattedDate date={this.state.date} />
                    </div>
                )
            }
        }

        function App() {
            return (
                <div>
                    <Clock />
                    <Clock />
                    <Clock />
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

