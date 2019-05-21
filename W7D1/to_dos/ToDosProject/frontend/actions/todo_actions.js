import * as APIUtil from "../utils/todo_api_util";

export const RECEIVE_TODO = "RECEIVE_TODO";
export const RECEIVE_TODOS = "RECEIVE_TODOS";

export const receiveTodos = (todos) => {
    return ({
        type: RECEIVE_TODOS,
        todos
    });
};

export const receiveTodo = (todo) => {
    return ({
        type: RECEIVE_TODO,
        todo
    });
};

export const fetchTodos = () => {
    return (dispatch) => {
        return APIUtil.fetchTodos().then((todos) => {
            return dispatch(receiveTodos(todos));
        });
    };
};

export const createTodo = (todo) => {
    return (dispatch) => {
        return APIUtil.createTodo(todo).then(todo => {
            return dispatch(receiveTodo(todo));
        });
    };
};