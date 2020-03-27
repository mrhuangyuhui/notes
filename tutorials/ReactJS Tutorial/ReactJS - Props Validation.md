# [ReactJS - Props Validation](https://www.tutorialspoint.com/reactjs/reactjs_props_validation.htm)

```js
import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types'

class App extends React.Component {
  render() {
    return (
      <div>
        <h1>{this.props.title}</h1>
        <h3>Array: {this.props.propArray}</h3>
        <h3>Bool: {this.props.propBool ? 'True' : 'False'}</h3>
        <h3>Func: {this.props.propFunc(3)}</h3>
        <h3>Number: {this.props.propNumber}</h3>
        <h3>String: {this.props.propString}</h3>
      </div>
    );
  }
}

App.propTypes = {
  title: PropTypes.string,
  propArray: PropTypes.array.isRequired,
  propBool: PropTypes.bool.isRequired,
  propFunc: PropTypes.func,
  propNumber: PropTypes.number,
  propString: PropTypes.string,
};

App.defaultProps = {
  title: 'Props Validation',
  propArray: [1, 2, 3, 4, 5],
  propBool: true,
  propFunc: function (val) {
    return val;
  },
  propNumber: 1,
  propString: 'Hello, Tutorialspoint.com!'
};

ReactDOM.render(<App />, document.getElementById('root'));
```