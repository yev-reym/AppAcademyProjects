import React from 'react';
import { connect } from 'react-redux';
import {requestAllPokemons} from '../../actions/pokemon_actions';
import {selectAllPokemons} from '../../reducers/selectors';
import PokemonIndex from './pokemon_index';

const msp = (state) => {
    // debugger
    return {
        pokemons: selectAllPokemons(state)
    };
};

const mdp = (dispatch) => {
    // debugger
    return {
        requestAllPokemons: () => dispatch(requestAllPokemons())
    };
};

export default connect(msp, mdp)(PokemonIndex);