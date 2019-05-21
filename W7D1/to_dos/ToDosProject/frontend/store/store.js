import {createStore} from "redux";
import rootReducer from "../reducers/root_reducer";
import {applyMiddleware} from "redux";
import logger from "redux-logger";
import thunk from "../middleware/thunk";

const preloaded = {
        todos: {
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
}};

const configureStore = () => {

        return createStore(rootReducer, preloaded, applyMiddleware(thunk,logger));
};

export default configureStore();