
--- Repository Documentation ---

# Node.js Todo Application Documentation

This document provides documentation for the Node.js Todo application.

## Overview

This is a simple Todo application built with Node.js and Express.js. It allows users to manage a list of tasks. The backend API is built using Express.js and the frontend is implemented with vanilla JavaScript. Data is stored in memory.

## Quick Start

1.  Run the `setup-todo.sh` script in your terminal:
    ```bash
    ./setup-todo.sh
    ```
2.  Navigate to the project directory:
    ```bash
    cd nodejs-todo-app
    ```
3.  Start the server:
    ```bash
    node server.js
    ```
4.  Open your browser and go to `http://localhost:3000`.

## Configuration

The application can be configured via environment variables.

-   **Port**: The server listens on port `3000` by default. This can be changed by setting the `PORT` environment variable.

    ```bash
    PORT=8080 node server.js
    ```

## API Endpoints

The backend API provides the following endpoints:

### `GET /api/todos`

Returns a list of all todo items.

**Response**

```json
[
  {
    "id": 1707789487123,
    "task": "Example Task",
    "done": false
  },
  ...
]
```

### `POST /api/todos`

Adds a new todo item.

**Request Body**

The request body should be URL-encoded with the following parameter:

-   `task`: The text of the todo task.

**Response Codes**

-   `201 Created`: Todo item added successfully.
-   `400 Bad Request`:  If the `task` parameter is missing.

### `PUT /api/todos/:id`

Updates the status of a todo item (mark as done or undone).

**Parameters**

-   `:id`: The ID of the todo item to update.

**Request Body**

The request body should be URL-encoded with the following parameter:

-   `done`:  Boolean value (`true` or `false`) indicating the new status.

**Response Codes**

-   `200 OK`: Todo item updated successfully.
-   `404 Not Found`: If the todo item with the given ID is not found.

### `DELETE /api/todos/:id`

Deletes a todo item.

**Parameters**

-   `:id`: The ID of the todo item to delete.

**Response Codes**

-   `200 OK`: Todo item deleted successfully.
-   `404 Not Found`: If the todo item with the given ID is not found.

## Dependencies

-   [Express.js](https://expressjs.com/):  Web framework for Node.js.

## Requirements

-   [Node.js](https://nodejs.org/) (version >= 14 recommended)
-   [npm](https://www.npmjs.com/) (Node.js package manager)

--- End of Documentation ---
