import React from "react";
import {Link} from "react-router-dom";

const PokemonIndexItem = (props) => {
    const {pokemon} = props;

    return (
        <li>
            <Link to='/pokemon/:pokemonId'>
                <h2>{pokemon.name}</h2>
                <img src={pokemon.image_url} alt={pokemon.name} />
            </Link>
        </li>
    )
}


export default PokemonIndexItem;