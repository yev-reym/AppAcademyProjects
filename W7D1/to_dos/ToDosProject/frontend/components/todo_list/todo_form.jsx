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
       this.props.createTodo(this.state).then(() => this.setState({body:"", title:""}));
    }

    update(field) {
        return (e) => {
            this.setState({[field]: e.target.value});
        };
    }

    render() {
        return (
            <form onSubmit={this.handleSubmit}>
                <label htmlFor="title">Title:</label>
                <input type="text" name="title" id="title" onChange={this.update('title')} value={this.state.title} />
                <label htmlFor="body">Body:</label>
                <textarea name="body" id="body" onChange={this.update('body')} value={this.state.body}></textarea>
                <input type="submit" value="Create Todo!"/>
            </form>
        );
    }

}

export default TodoForm;