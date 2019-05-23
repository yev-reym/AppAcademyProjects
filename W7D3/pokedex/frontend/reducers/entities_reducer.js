import { combineReducers } from 'redux';
import pokemonsReducer from './pokemon_reducer';
import itemsReducer from './items_reducer';


const entitiesReducer = combineReducers({
    pokemons: pokemonsReducer,
    items: itemsReducer,
});

export default entitiesReducer;