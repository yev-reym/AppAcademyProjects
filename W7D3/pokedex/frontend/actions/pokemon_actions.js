export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
import fetchAllPokemon

export const receiveAllPokemon = pokemons => {
    return {
        type: RECEIVE_ALL_POKEMON,
        pokemons
    };
};

// export const requestAllPokemons = () => {
//     return (dispatch) => {

//     };
// };