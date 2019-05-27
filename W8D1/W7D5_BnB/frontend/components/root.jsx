import React from 'react';
import { Provider } from 'react-redux';
import App from './App';
import { Route, HashRouter } from 'react-router-dom';

const Root = ({store}) => (
    <Provider  store={store}>
        <HashRouter>
            <App />
        </HashRouter>
    </Provider>
);

export default Root;