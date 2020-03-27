# [ReactJS - Components](https://www.tutorialspoint.com/reactjs/reactjs_components.htm)

## Stateless Example

```js
import React from 'react';
import ReactDOM from 'react-dom';

class Header extends React.Component {
  render() {
    return (
      <div>
        <h1>Header</h1>
      </div>
    );
  }
}

class Content extends React.Component {
  render() {
    return (
      <div>
        <h2>Content</h2>
        <p>This is the content!!!</p>
      </div>
    );
  }
}

class App extends React.Component {
  render() {
    return (
      <div>
        <Header />
        <Content />
      </div>
    );
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

## Stateful Example

```js
import React from 'react';
import ReactDOM from 'react-dom';

class Header extends React.Component {
  render() {
    return (
      <div>
        <h1>Stateful Example</h1>
      </div>
    );
  }
}

class TableRow extends React.Component {
  render() {
    return (
      <tr>
        <td>{this.props.data.id}</td>
        <td>{this.props.data.name}</td>
        <td>{this.props.data.age}</td>
      </tr>
    );
  }
}

class App extends React.Component {
  constructor() {
    super();
    this.state = {
      data: [
        {
          'id': 1,
          'name': 'Mike',
          'age': '20'
        },
        {
          'id': 2,
          'name': 'Tom',
          'age': '30'
        },
        {
          'id': 3,
          'name': 'Jim',
          'age': '40'
        },
      ]
    };
  }
  render() {
    return (
      <div>
        <Header />
        <table>
          <tbody>
            {this.state.data.map( (person, i) => <TableRow key={i} data={person} /> )}
          </tbody>
        </table>
      </div>
    );
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```