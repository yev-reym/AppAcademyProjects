import React from 'react';

const TodoListItem = ({todo, receiveTodo}) => {
    const {id, title, body} = todo;
    return <li>
        <p>{title}</p>
        <p>{body}</p>
        <button onClick={(e) => receiveTodo(todo)}>Done</button>
    </li>;
};

export default TodoListItem;