import React from "react";
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form_container';

export class TodoList extends React.Component {

    componentDidMount() {
        this.props.fetchTodos();
    }

    render() {

        const liTodos = this.props.todos.map((todo, idx) => (
            <TodoListItem key={idx} todo={todo} receiveTodo={this.props.receiveTodo} />
        ));

        return (
            <>
                <ul>
                    {liTodos}
                </ul>
                <TodoForm createTodo={this.props.createTodo}/>
            </>
        );
    }
}
