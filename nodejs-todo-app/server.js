const express = require('express');
const path = require('path');
const app = express();

// Serve static files from "public"
app.use(express.static(path.join(__dirname, 'public')));

// Enable URL-encoded data parsing for form submissions
app.use(express.urlencoded({ extended: true }));

// Temporary in-memory array to store todos
let todos = [];

/**
 * GET /api/todos
 * Returns the list of all todos as JSON
 */
app.get('/api/todos', (req, res) => {
  res.json(todos);
});

/**
 * POST /api/todos
 * Adds a new todo
 */
app.post('/api/todos', (req, res) => {
  const { task } = req.body;
  if (task) {
    const newTodo = { id: Date.now(), task, done: false };
    todos.push(newTodo);
    return res.status(201).json({ message: 'Todo added successfully', todo: newTodo });
  }
  res.status(400).json({ message: 'Task is required' });
});

/**
 * PUT /api/todos/:id
 * Toggles the "done" state of a todo
 */
app.put('/api/todos/:id', (req, res) => {
  const { id } = req.params;
  const { done } = req.body;
  const todo = todos.find(item => item.id === parseInt(id, 10));
  if (todo) {
    todo.done = (done === 'true');
    return res.status(200).json({ message: 'Todo updated successfully' });
  }
  res.status(404).json({ message: 'Todo not found' });
});

/**
 * DELETE /api/todos/:id
 * Deletes a todo
 */
app.delete('/api/todos/:id', (req, res) => {
  const { id } = req.params;
  const index = todos.findIndex(item => item.id === parseInt(id, 10));
  if (index !== -1) {
    todos.splice(index, 1);
    return res.status(200).json({ message: 'Todo deleted successfully' });
  }
  res.status(404).json({ message: 'Todo not found' });
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
