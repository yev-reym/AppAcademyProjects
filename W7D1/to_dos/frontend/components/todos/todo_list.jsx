import React from "react";
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form_container';

export const TodoList = ({todos, receiveTodo}) => {
    const liTodos = todos.map((todo, idx) => (
        <TodoListItem key={idx} todo={todo} receiveTodo={receiveTodo}/>
    ));

    return (
        <>
        <ul>
            {liTodos}
        </ul>
        <TodoForm />
        </>
    )
};