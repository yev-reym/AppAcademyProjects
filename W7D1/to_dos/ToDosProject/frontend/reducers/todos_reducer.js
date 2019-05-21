import { RECEIVE_TODO, RECEIVE_TODOS} from '../actions/todo_actions';
import {merge} from 'lodash';



const todosReducer = (state = {}, action) => {
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