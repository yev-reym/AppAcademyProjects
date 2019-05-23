import React from 'react';
import ReactDOM from 'react-dom';
import {receiveAllPokemon, requestAllPokemons, requestPokemon, receivePokemon} from './actions/pokemon_actions';
import {fetchAllPokemons, fetchPokemon} from './util/api_util';
import configureStore from './store/store';
import {selectAllPokemons, selectPokemon} from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';


document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, rootEl);
    
    
    ////test
    window.receiveAllPokemon = receiveAllPokemon;
    window.receivePokemon = receivePokemon;
    window.fetchAllPokemons = fetchAllPokemons;
    window.fetchPokemon = fetchPokemon;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.requestAllPokemons = requestAllPokemons;
    window.requestPokemon = requestPokemon;
    window.selectAllPokemons = selectAllPokemons;
    window.selectPokemon = selectPokemon;

});