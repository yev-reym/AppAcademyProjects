import {connect} from 'react-redux';
import {receiveTodo} from '../../actions/todo_actions';
import TodoForm from './todo_form';

const mdp = (dispatch) => {
    return {
        addTodo: (todo) => dispatch(receiveTodo(todo))
    }
};

export default connect(null, mdp)(TodoForm);