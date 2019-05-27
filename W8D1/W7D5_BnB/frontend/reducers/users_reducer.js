import React from 'react';
import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from '../actions/session_actions';
import { merge } from 'lodash';

const usersReducer = (state = {}, action) => {
    const oldState = Object.freeze(state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
           
            return merge({}, oldState, {[action.currentUser.id]: action.currentUser})

        default:
            return state;
    }
};



export default usersReducer;