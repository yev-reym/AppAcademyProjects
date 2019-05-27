import React from 'react';
import { Link } from 'react-router-dom'
import Redux from 'react-redux';

class Greeting extends React.Component {
    constructor(props){
        super(props);
        
        
    }

   
    render(){
       const {logout, currentUser} = this.props;
        

        const display = currentUser ? (
        <div>
            <h1>Hey {currentUser.username}, Every Villian Is Lemons</h1>
            <button onClick={logout}>Log Out!</button>
        </div>)
         : 
         (<div>
            <Link to='/signup'> Sign Up </Link>
            <Link to='/login'> Log In </Link>
        </div>)

            return (
                <>
                    {display}
                </>
            )
       
    }
}

export default Greeting