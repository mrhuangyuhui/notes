# [Forms](https://reactjs.org/docs/forms.html)

## Controlled Components

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
        class NameForm extends React.Component {
            constructor(props) {
                super(props)
                this.state = {value: ''}

                this.handleChange = this.handleChange.bind(this)
                this.handleSubmit = this.handleSubmit.bind(this)
            }

            handleChange(event) {
                this.setState({value: event.target.value})
            }

            handleSubmit(event) {
                alert('A name was submitted: ' + this.state.value)
                event.preventDefault()
            }

            render() {
                return (
                    <form onSubmit={this.handleSubmit}>
                        <label>
                            Name: 
                            <input type="text" value={this.state.value} onChange={this.handleChange} />
                        </label>
                        <input type="submit" value="Submit" />
                        <br />
                        <p>{this.state.value}</p>
                    </form>
                )
            }
        }

        ReactDOM.render(
            <NameForm />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## The select Tag

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
        class FlavorForm extends React.Component {
            constructor(props) {
                super(props)
                this.state = {value: 'coconut'}
                this.handleChange = this.handleChange.bind(this)
                this.handleSubmit = this.handleSubmit.bind(this)
            }

            handleChange(event) {
                this.setState({value: event.target.value})
            }

            handleSubmit(event) {
                alert('Your favorite flavor is: ' + this.state.value)
                event.preventDefault()
            }

            render() {
                return (
                    <form onSubmit={this.handleSubmit}>
                        <label>
                            Pick your favorite La Croix flavor:
                            <select value={this.state.value} onChange={this.handleChange}>
                                <option value="grapefruit">Grapefruit</option>
                                <option value="lime">Lime</option>
                                <option value="coconut">Coconut</option>
                                <option value="mango">Mango</option>
                            </select>
                        </label>
                        <input type="submit" value="Submit" />
                    </form>
                )
            }
        }

        ReactDOM.render(
            <FlavorForm />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## Handling Multiple Inputs

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
        class Reservation extends React.Component {
            constructor(props) {
                super(props)
                this.state = {
                    isGoing: true,
                    numberOfGuests: 2
                }

                this.handleInputChange = this.handleInputChange.bind(this)
            }

            handleInputChange(event) {
                const target = event.target
                const value = (target.type === 'checkbox' ? target.checked : target.value)
                const name = target.name

                this.setState({
                    [name]: value
                })
            }

            render() {
                return (
                    <form>
                        <label>
                            Is going: 
                            <input
                                name="isGoing"
                                type="checkbox"
                                checked={this.state.isGoing}
                                onChange={this.handleInputChange}
                            />
                        </label>
                        <p>{'isGoing: ' + this.state.isGoing}</p>
                        <hr />
                        <label>
                            Number of guests: 
                            <input
                                name="numberOfGuests"
                                type="number"
                                value={this.state.numberOfGuests}
                                onChange={this.handleInputChange}
                            />
                        </label>
                        <p>{'numberOfGuests: ' + this.state.numberOfGuests}</p>
                    </form>
                )
            }
        }

        ReactDOM.render(
            <Reservation />,
            document.getElementById('root')
        )
    </script>
</body>
</html>
```

## Controlled Input Null Value

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
        const mountNode = document.getElementById('root')

        ReactDOM.render(<input value="hi" />, mountNode);

        setTimeout(function () { ReactDOM.render(<input value={null} />, mountNode) }, 5000);
    </script>
</body>
</html>
```