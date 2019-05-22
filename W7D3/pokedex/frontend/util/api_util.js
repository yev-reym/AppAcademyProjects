export const fetchAllPokemons = () => {
    return $.ajax({
        method: "GET",
        url: "api/pokemons/",
    });
};