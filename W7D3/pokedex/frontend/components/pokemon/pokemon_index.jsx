import React from 'react';
import PokemonIndexItem from './pokemon_index_item';



class PokemonIndex extends React.Component {

    constructor(props) {
        super(props);
    }

    componentDidMount() {
        const { requestAllPokemons } = this.props;
        requestAllPokemons(); 
    }


    render() {
        const {pokemons} = this.props;
        const pokemonsItems = pokemons.map((pokemon) => 
            <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />
        );

        return (
            <section className="pokedex">
                <ul>
                    {pokemonsItems}
                </ul>
            </section>
        );
    }
}

export default PokemonIndex;