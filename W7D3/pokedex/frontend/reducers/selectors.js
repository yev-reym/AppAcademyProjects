
export const selectAllPokemons = ({entities}) => (
        Object.values(entities.pokemons)
);

export const selectPokemon = ({entities}) => {
    const {pokemons} = entities;
    return pokemons;

};