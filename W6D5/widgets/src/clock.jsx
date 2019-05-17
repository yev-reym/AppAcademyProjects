import React from "react";
import { formatTime, formatDay, formatMonth } from './util';


class Clock extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            date: null,
        };
        this.interval = null;

        this.tick = this.tick.bind(this);
    }

    componentDidMount(){
        this.tick();
        this.interval = setInterval(this.tick, 1000);
    }

    componentWillUnmount(){
        console.log(" clock unmounted ");
        clearInterval(this.interval);
    }

    tick(){
        const date = new Date();
        this.setState({ date });
    }

    createDate(){
        return {
            seconds: formatTime(this.state.date.getSeconds()),
            minutes: formatTime(this.state.date.getMinutes()),
            hours: formatTime(this.state.date.getHours()),
            day: formatDay(this.state.date.getDay()) ,
            month: formatMonth(this.state.date.getMonth()) ,
            year: this.state.date.getFullYear(),
            date: this.state.date.getDate(),
        };
    }

    render(){
        if (this.state.date) {
            const object = this.createDate();
             return (
                <div className="clock">
                    <h1> Clock </h1>
                    <section>
                         <div className="cl-display"><h3>Time:</h3><h3>{object.hours}: {object.minutes}: {object.seconds}</h3> </div>

                        <div className="cl-display"><h3>Date:</h3> <h3>{object.day} {object.month} {object.date} {object.year}</h3></div>
                     </section>
                </div>
            )
        }

       return null;
    }

}

export default Clock;