export const fetchAllPokemons = () => {
    return $.ajax({
        method: "GET",
        url: "api/pokemons/",
    });
};

export const fetchPokemon = (pokemon) => {
    return $.ajax({
        method: "GET",
        url: `api/pokemons/${pokemon.id}`,
    });
};