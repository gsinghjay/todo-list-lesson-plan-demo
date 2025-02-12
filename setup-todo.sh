#!/usr/bin/env bash

# --- Script start ---
set -e

PROJECT_NAME="nodejs-todo-app"
PORT="3000"

echo "Setting up a Node.js Todo application on port $PORT..."

# 1. Create project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# 2. Initialize NPM
echo "Initializing npm..."
npm init -y >/dev/null

# 3. Install dependencies
echo "Installing Express..."
npm install express

# 4. Create server file
cat << 'EOF' > server.js
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
EOF

# 5. Create the public directory
mkdir -p public

# 6. Create basic HTML (index.html) with Bootstrap
cat << 'EOF' > public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Node.js Todo App</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
  <div class="container py-5">
    <h1 class="mb-4">My Todo List</h1>
    <form id="todo-form" class="mb-3">
      <div class="input-group">
        <input type="text" id="taskInput" class="form-control" placeholder="Add a new task..." />
        <button type="submit" class="btn btn-primary">Add Task</button>
      </div>
    </form>
    <ul id="todoList" class="list-group"></ul>
  </div>

  <script src="app.js"></script>
</body>
</html>
EOF

# 7. Create a basic app.js for the client logic
cat << 'EOF' > public/app.js
const todoForm = document.getElementById('todo-form');
const taskInput = document.getElementById('taskInput');
const todoList = document.getElementById('todoList');

// Fetch existing todos
async function fetchTodos() {
  try {
    const response = await fetch('/api/todos');
    const data = await response.json();
    renderTodos(data);
  } catch (error) {
    console.error('Error fetching todos:', error);
  }
}

// Render todos in the list
function renderTodos(todos) {
  todoList.innerHTML = '';
  todos.forEach(todo => {
    const listItem = document.createElement('li');
    listItem.className = 'list-group-item d-flex align-items-center justify-content-between';
    if (todo.done) {
      listItem.classList.add('list-group-item-success');
    }

    listItem.innerHTML = `
      <span>${todo.task}</span>
      <div>
        <button class="btn btn-sm btn-secondary me-2" onclick="toggleTodo(${todo.id}, ${!todo.done})">
          ${todo.done ? 'Undo' : 'Done'}
        </button>
        <button class="btn btn-sm btn-danger" onclick="deleteTodo(${todo.id})">Delete</button>
      </div>
    `;
    todoList.appendChild(listItem);
  });
}

// Add new todo
async function addTodo(task) {
  try {
    await fetch('/api/todos', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: new URLSearchParams({ task })
    });
    fetchTodos();
  } catch (error) {
    console.error('Error adding todo:', error);
  }
}

// Toggle todo completion
async function toggleTodo(id, done) {
  try {
    await fetch(`/api/todos/${id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: new URLSearchParams({ done })
    });
    fetchTodos();
  } catch (error) {
    console.error('Error toggling todo:', error);
  }
}

// Delete todo
async function deleteTodo(id) {
  try {
    await fetch(`/api/todos/${id}`, {
      method: 'DELETE'
    });
    fetchTodos();
  } catch (error) {
    console.error('Error deleting todo:', error);
  }
}

// Listen for form submissions
todoForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const task = taskInput.value.trim();
  if (task) {
    addTodo(task);
    taskInput.value = '';
  }
});

// Initial fetch
fetchTodos();
EOF

echo "--------------------------------"
echo "Setup complete!"
echo "1. To start the server, run:"
echo "   cd $PROJECT_NAME"
echo "   node server.js"
echo "2. Then open http://localhost:$PORT in your browser."
# --- Script end ---