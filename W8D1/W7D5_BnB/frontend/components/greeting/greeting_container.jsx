import {connect} from 'react-redux';
import Greeting from './greeting';
import {logout} from '../../actions/session_actions';

const msp = (state) => {
    const {entities, session} = state;
    const {users} = entities;
    return {
        currentUser: users[session.id]
    };
};

const mdp = (dispatch) => {
    return {
        logout: () => dispatch(logout())
    };
};

export default connect(msp,mdp)(Greeting);