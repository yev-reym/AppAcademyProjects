import { RECEIVE_TODO, RECEIVE_TODOS} from '../actions/todo_actions';
import {merge} from 'lodash';

const initialState = {
    1: {
        id: 1,
        title: 'wash car',
        body: 'with soap',
        done: false
    },
    2: {
        id: 2,
        title: 'wash dog',
        body: 'with shampoo',
        done: true
    },
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_TODOS:
            const newState = {};
            action.todos.forEach((todo) => {
                newState[todo.id] = todo;
            });
            return newState;
        case RECEIVE_TODO:
            const {id, title, body = "", done = false} = action.todo;
            const newTodo = {
                [id]: {
                    id,
                    title,
                    body,
                    done
                }
            };
            return merge({}, state, newTodo);
        default:
            return state;
    }
};

export default todosReducer;