# [Conditional Rendering](https://reactjs.org/docs/conditional-rendering.html)

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
        function UserGreeting(props) {
            return <h1>Welcome back!</h1>
        }

        function GuestGreeting(props) {
            return <h1>Please sign up.</h1>
        }

        function Greeting(props) {
            const isLoggedIn = props.isLoggedIn
            if (isLoggedIn) {
                return <UserGreeting />
            }
            return <GuestGreeting />
        }

        ReactDOM.render(
            <Greeting isLoggedIn={false} />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## Element Variables

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
        class LoginControl extends React.Component {
            constructor(props) {
                super(props)
                this.handleLoginClick = this.handleLoginClick.bind(this)
                this.handleLogoutClick = this.handleLogoutClick.bind(this)
                this.state = {isLoggedIn: false}
            }

            handleLoginClick() {
                this.setState({isLoggedIn: true})
            }

            handleLogoutClick() {
                this.setState({isLoggedIn: false})
            }

            render() {
                const isLoggedIn = this.state.isLoggedIn

                let button = null
                if (isLoggedIn) {
                    button = <LogoutButton onClick={this.handleLogoutClick} />
                } else {
                    button = <LoginButton onClick={this.handleLoginClick} />
                }

                return (
                    <div>
                        <Greeting isLoggedIn={isLoggedIn} />
                        {button}
                    </div>
                )
            }

        }

        function UserGreeting(props) {
            return <h1>Welcome back!</h1>
        }

        function GuestGreeting(props) {
            return <h1>Please sign up.</h1>
        }

        function Greeting(props) {
            const isLoggedIn = props.isLoggedIn
            if (isLoggedIn) {
                return <UserGreeting />
            }
            return <GuestGreeting />
        }

        function LoginButton(props) {
            return (
                <button onClick={props.onClick}>
                    Login
                </button>
            )
        }

        function LogoutButton(props) {
            return (
                <button onClick={props.onClick}>
                    Logout
                </button>
            )
        }

        ReactDOM.render(
            <LoginControl />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## Inline `If` with Logical `&&` Operator

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
        function Mailbox(props) {
            const unreadMessages = props.unreadMessages
            return (
                <div>
                    <h1>Hello!</h1>
                    {unreadMessages.length > 0 && 
                        <h2>
                            You have {unreadMessages.length} unread messages.
                        </h2>
                    }
                </div>
            )
        }

        const messages = ['React', 'Re: React', 'Re:Re: React']

        ReactDOM.render(
            <Mailbox unreadMessages={messages} />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## Preventing Component from Rendering

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
        function WarningBanner(props) {
            if (!props.warn) {
                return null
            }
            return (
                <div className="warning">
                    Warning!
                </div>
            )
        }

        class Page extends React.Component {
            constructor(props) {
                super(props)
                this.state = {showWarning: true}
                this.handleToggleClick = this.handleToggleClick.bind(this)
            }

            handleToggleClick() {
                this.setState(prevState => ({
                    showWarning: !prevState.showWarning
                }))
            }

            render() {
                return (
                    <div>
                        <WarningBanner warn={this.state.showWarning} />
                        <button onClick={this.handleToggleClick}>
                            {this.state.showWarning ? 'Hide' : 'Show'}
                        </button>
                    </div>
                )
            }
        }

        ReactDOM.render(
            <Page />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```
