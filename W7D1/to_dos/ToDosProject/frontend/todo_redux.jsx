import React from "react";
import ReactDOM from "react-dom";
import store from "./store/store";
import { receiveTodos, receiveTodo, fetchTodos} from './actions/todo_actions';
import Root from "./components/root";
import { allTodos} from './reducers/selectors';

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store}/>, root);
});

window.store = store;
window.receiveTodo  = receiveTodo;
window.receiveTodos = receiveTodos;
window.allTodos = allTodos;
window.fetchTodos = fetchTodos;

