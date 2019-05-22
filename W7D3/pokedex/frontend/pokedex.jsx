import React from 'react';
import ReactDOM from 'react-dom';
import {receiveAllPokemon} from './actions/pokemon_actions';
import {fetchAllPokemons} from './util/api_util';
import configureStore from './store/store';

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const rootEl = document.getElementById('root');
    ReactDOM.render(<h1>Pokedex</h1>, rootEl);
    
    
    ////test
    window.receiveAllPokemon = receiveAllPokemon;
    window.fetchAllPokemons = fetchAllPokemons;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
});