# [Handling Events](https://reactjs.org/docs/handling-events.html)

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
        class Toggle extends React.Component {
            constructor(props) {
                super(props)
                this.state = {isToggleOn: true} 
                this.handleClick = this.handleClick.bind(this)
            }

            handleClick() {
                this.setState(prevState => ({
                    isToggleOn: !prevState.isToggleOn
                }))
            }

            render() {
                return (
                    <button onClick={this.handleClick}>
                        {this.state.isToggleOn ? 'ON' : 'OFF'}
                    </button>
                )
            }
        }

        ReactDOM.render(
            <Toggle />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```
