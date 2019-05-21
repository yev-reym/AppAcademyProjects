export const allTodos = (state) => {
    const todoIds = Object.keys(state.todos);
    return todoIds.map((id) => {
        return state.todos[id];
    });
}; 