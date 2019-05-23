export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_A_POKEMON = 'RECEIVE_A_POKEMON';
import * as APIUtil from "../util/api_util";

export const receiveAllPokemon = pokemons => {
    return {
        type: RECEIVE_ALL_POKEMON,
        pokemons
    };
};

export const receivePokemon = payload => {
    return {
        type: RECEIVE_A_POKEMON,
        pokemon: payload.pokemon,
        items: payload.items
    };
};

export const requestAllPokemons = () => {
    return (dispatch) => {
        return APIUtil.fetchAllPokemons().then((pokemons) => {
            dispatch(receiveAllPokemon(pokemons));
        });
    };
};

export const requestPokemon = (pokemon) => {
    return dispatch => {
        return APIUtil.fetchPokemon(pokemon).then(payload => {
            debugger
            dispatch(receivePokemon(payload));
        });
    };
};