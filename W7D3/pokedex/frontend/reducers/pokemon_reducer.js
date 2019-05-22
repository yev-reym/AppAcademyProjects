import {RECEIVE_ALL_POKEMON} from "../actions/pokemon_actions";
import {merge} from "lodash";

const pokemonsReducer = ( state = {}, action) => {
    Object.freeze(state);
    const {pokemons} = action;
    // debugger
    switch (action.type) {
        case RECEIVE_ALL_POKEMON:
            return merge({}, state, pokemons);
        default:
            return state;
    }
};

export default pokemonsReducer;