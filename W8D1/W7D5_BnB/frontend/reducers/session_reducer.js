import {RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER} from '../actions/session_actions';
import { merge } from 'lodash';
const nullSession = {
    id: null
};
const sessionReducer = (state = nullSession, action) => {
    // debugger
    const oldState = Object.freeze(state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            // debugger
            const currentUser = action.currentUser
            return merge({}, oldState, { currentUser })
           
        case LOGOUT_CURRENT_USER: 
            return nullSession;

   
        default:
            return state;
    }
}



export default sessionReducer;