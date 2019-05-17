import React from "react";
import Clock from './clock';
import Tab from './tab';
import Weather from './weather';

function Root(){
    const arrObjects = [
        { title: 'one', content: 'I am the first', },
        { title: 'two', content: 'I am the second', },
        { title: 'three', content: 'I am the third', },
    ];

    return (
        <>
            < Clock/>
            < Tab arrObjects = {arrObjects} />
            < Weather />
        </>
    )
}

export default Root;