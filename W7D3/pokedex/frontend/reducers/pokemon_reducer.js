import {RECEIVE_ALL_POKEMON} from "../actions/pokemon_actions";
import {RECEIVE_A_POKEMON} from "../actions/pokemon_actions";
import {merge} from "lodash";

const pokemonsReducer = ( state = {}, action) => {
    Object.freeze(state);
    const {pokemons} = action;
    switch (action.type) {
        case RECEIVE_ALL_POKEMON:
            return merge({}, state, pokemons);
        case RECEIVE_A_POKEMON:
            const {pokemon} = action;
            debugger
            return merge({}, state, pokemon);
        default:
            return state;
    }
};

export default pokemonsReducer;