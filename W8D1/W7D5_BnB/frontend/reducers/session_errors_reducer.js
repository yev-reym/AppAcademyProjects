import {RECEIVE_CURRENT_USER, RECEIVE_SESSION_ERRORS} from '../actions/session_actions';

const sessionErrorsReducer = (state = [], action) => {
    const oldState = Object.freeze(state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            return [];
        case RECEIVE_SESSION_ERRORS:
            return [
                ...oldState,
                ...action.errors
            ];
        default:
            return state;

    }
};

export default sessionErrorsReducer;