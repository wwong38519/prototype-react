import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
	render() {
		return <div>{this.props.message}</div>;
	}
}

ReactDOM.render(<App message="Hello World" />, document.getElementById('content'));
