# [ReactJS - Router](https://www.tutorialspoint.com/reactjs/reactjs_router.htm)

```bash
npm install react-router --save
npm install react-router-dom --save
```

```js
import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Switch, Route, Link } from 'react-router-dom';

class Home extends React.Component {
  render() {
    return (
      <div>
        <h2>Home</h2>
      </div>
    );
  }
}

class Login extends React.Component {
  render() {
    return (
      <div>
        <h2>Login</h2>
      </div>
    );
  }
}

class App extends React.Component {
  render() {
    return (
      <div>
        <Router>
          <ul>
            <li><Link to={'/'}>Home</Link></li>
            <li><Link to={'/login'}>Login</Link></li>
            <hr/>
            <Switch>
              <Route exact path="/" component={Home}/>
              <Route exact path="/login" component={Login}/>
            </Switch>
          </ul>
        </Router>
      </div>
    );
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

# 复习到这