import React from 'react';
import { convertKtoF } from "./util";

class Weather extends React.Component{
    constructor(props){
        super(props);
        this.state = {
          url: null,
          location: null,
          temp: null,
        };
        this.interval = null;
        this.update = this.update.bind(this);
        this.getWeather = this.getWeather.bind(this);
    }

    componentDidMount(){
        this.getWeather();
        // this.interval = setInterval(this.getWeather,5000);
    }

    getWeather(){
        navigator.geolocation.getCurrentPosition((position) => {
            const lat = position.coords.latitude;
            const long = position.coords.longitude;
           return $.ajax({
                method: 'get',
                url: `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&APPID=45383be92c0b6fba6b82372b8d3ed125`,
            }).then(this.update).fail((response) => {
                console.log("Error!");
            });
        });
    }

    update(response){
        const location = response.name;
        const temp = convertKtoF(response.main.temp);
        this.setState({location, temp});
    }

    render(){
        return (
            <div className="weather">
            <h1>Weather</h1>
            <h2>{this.state.location}</h2>
            <h2>{this.state.temp}</h2>
            </div>
        );
    }
}


export default Weather;
