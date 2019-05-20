import React from "react";

class TodoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {id: null, title: "", body: "", done: false};
        this.handleSubmit = this.handleSubmit.bind(this);
        this.update = this.update.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.addTodo(this.state);
    }

    update(field) {
        return (e) => {
            this.setState({[field]: e.target.value});
        };
    }

    render() {
        return (
            <form onSubmit={this.handleSubmit}>
                <label for="title">Title:</label>
                <input type="text" name="title" id="title" onChange={this.update('title')} value={this.state.title} />
                <label for="body">Body:</label>
                <textarea name="body" id="body" onChange={this.update('body')}>{this.state.body}</textarea>
                <input type="submit" value="Create Todo!"/>
            </form>
        );
    }

}

export default TodoForm;