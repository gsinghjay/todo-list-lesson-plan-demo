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
