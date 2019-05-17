import React from 'react';

class Tab extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            index: 0
        };

        this.callback = this.callback.bind(this);
    }

    callback(event){
        const index = event.currentTarget.getAttribute('id');
        this.setState({index});
    }

    render(){
        const titles = this.props.arrObjects.map( (obj,idx)=>{
           return( 
                <li onClick={this.callback} id={idx} key={idx}>  
                     {obj.title}
                </li>
            );
        });
       
        return (
         <div className="tab-div">
            <ul className="tab">
                {titles}
            </ul>
            <article> {this.props.arrObjects[this.state.index].content} </article>
         </div>
        );
    }
}

export default Tab;