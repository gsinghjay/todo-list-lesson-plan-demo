**Week 1: Backend Fundamentals and API Creation - Detailed Lesson Plan**

This week focuses on building the backend of our Todo application using Node.js and Express.js. Students will learn the fundamental concepts of web development, set up a Node.js environment, create a basic server, and build API endpoints to manage todo items.

**Day 1: Introduction to Web Development & Node.js**

*   **Objective:** Students will understand the basics of web development, differentiate between client-side and server-side, and grasp the role of Node.js in backend development. They will also set up their Node.js development environment.

*   **Concepts:**
    *   **Client-side vs Server-side:**
        *   Explanation of what runs in the browser (client-side - HTML, CSS, JavaScript) and what runs on the server (server-side - Node.js, databases).
        *   Examples of client-side interactions (UI rendering, user input) and server-side responsibilities (data storage, business logic).
    *   **Introduction to the Internet and HTTP:**
        *   Brief overview of how the internet works and client-server communication.
        *   Explanation of HTTP requests (what the browser sends) and responses (what the server sends back).
        *   Key components of HTTP requests (method, headers, body) and responses (status codes, headers, body).
    *   **What is Node.js?**
        *   Definition of Node.js as a JavaScript runtime environment.
        *   Explanation that Node.js allows JavaScript to run outside of the browser, enabling backend development.
        *   Discuss the event-driven, non-blocking I/O model of Node.js and its benefits for web servers (briefly introduce, can be detailed later).
    *   **JavaScript Runtime Environment:**
        *   Explain that Node.js includes the V8 JavaScript engine (same as Chrome).
        *   Highlight that this allows developers to use JavaScript for both frontend and backend.
    *   **npm & Package Manager:**
        *   Introduction to npm (Node Package Manager) as a tool for managing JavaScript libraries and dependencies.
        *   Explain the role of `package.json` in tracking project dependencies and scripts.
        *   Basic npm commands: `npm init`, `npm install`, `npm start`.

*   **Exercises (In-Class):**
    1.  **Web Browsing Process Discussion:**
        *   Lead a class discussion about the steps involved when a user types a URL into a browser and views a webpage.
        *   Diagram on the board the client-server interaction, HTTP requests/responses, and the role of DNS.
    2.  **Node.js and npm Installation:**
        *   Guide students through the installation process of Node.js and npm on their machines.
        *   Verify installation by running `node -v` and `npm -v` in the terminal.
    3.  **"Hello World" in Node.js:**
        *   Create a file named `hello.js`.
        *   Write a simple JavaScript program in `hello.js` to print "Hello World!" to the console using `console.log()`.
        *   Run the program from the terminal using `node hello.js`.

*   **Homework:**
    1.  **Frontend vs Backend Paragraph:**
        *   Research and write a short paragraph (3-5 sentences) explaining the key differences between frontend and backend development in web applications.
    2.  **Explore npm Packages:**
        *   Visit the npm website ([https://www.npmjs.com/](https://www.npmjs.com/)).
        *   Find 3 popular npm packages (excluding Express.js).
        *   For each package, write a brief description (1-2 sentences) explaining what it does and its potential use cases.

**Day 2: Setting up Node.js Project & Basic Server**

*   **Objective:** Students will learn how to set up a Node.js project structure, understand `package.json`, use modules, and create a basic HTTP server using Node.js's built-in `http` module.

*   **Concepts:**
    *   **Project Setup:**
        *   Creating a project directory using `mkdir`.
        *   Navigating into the directory using `cd`.
        *   Initializing a Node.js project with `npm init -y` to automatically create `package.json`.
        *   Explain the purpose and basic structure of `package.json` (name, version, main, scripts, dependencies, devDependencies).
    *   **Modules and `require()`:**
        *   Introduce the concept of modules in Node.js as a way to organize and reuse code.
        *   Explain the `require()` function and how it's used to import modules (both built-in and external).
        *   Demonstrate importing the built-in `http` module.
    *   **Basic HTTP Server with Node.js (`http` module):**
        *   Introduce the `http` module for creating HTTP servers.
        *   Explain the basic steps to create a server:
            *   `http.createServer()` to create a server instance.
            *   Request listener function (handling `req` and `res` objects).
            *   `res.writeHead()` to set response headers (status code, content type).
            *   `res.write()` to send the response body.
            *   `res.end()` to finish the response.
        *   Demonstrate sending plain text and HTML responses.
    *   **Server Listening on a Port:**
        *   Explain the concept of ports and why servers need to listen on specific ports.
        *   Use `server.listen(port, callback)` to start the server and specify the port.
        *   Explain the callback function to log a message when the server starts successfully.

*   **Exercises (In-Class):**
    1.  **Create Project and Initialize npm:**
        *   Students create a new directory for their project (e.g., `node-server-example`).
        *   Navigate into the directory and run `npm init -y`.
        *   Examine the generated `package.json` file.
    2.  **Create `server.js`:**
        *   Create a file named `server.js` in the project directory.
    3.  **Basic HTTP Server Code:**
        *   Write code in `server.js` to create a basic HTTP server using the `http` module.
        *   The server should respond with "Hello Server!" when accessed at the root path (`/`).
    4.  **Start and Test the Server:**
        *   Start the server using `node server.js` from the terminal.
        *   Open a web browser and navigate to `http://localhost:3000` (or the port you specified).
        *   Verify that "Hello Server!" is displayed in the browser.

*   **Homework:**
    1.  **Different Paths and Messages:**
        *   Modify the `server.js` to respond with different messages for different paths:
            *   `/hello` should return "Hello Path!"
            *   `/bye` should return "Goodbye!"
            *   Root path `/` should still return "Hello Server!".
    2.  **HTTP Status Codes Research:**
        *   Read about different HTTP status codes (e.g., 200 OK, 404 Not Found, 500 Internal Server Error).
        *   Modify the server to use status codes in responses:
            *   For the `/hello`, `/bye`, and `/` paths, use 200 OK.
            *   For any other path not explicitly handled, return a 404 Not Found status with a message like "Page not found".

**Day 3: Introduction to Express.js**

*   **Objective:** Students will understand the benefits of using Express.js, learn how to set up an Express.js application, and create basic routes and API endpoints.

*   **Concepts:**
    *   **Introduction to Express.js:**
        *   Explain Express.js as a popular and minimalist web framework for Node.js.
        *   Highlight that Express.js simplifies server creation and routing compared to using the raw `http` module.
    *   **Benefits of using Express:**
        *   Simplified routing.
        *   Middleware support (for request processing, authentication, etc.).
        *   Templating engine integration (for server-side rendering - briefly mention, not focus now).
        *   Large community and extensive documentation.
    *   **Installing Express:**
        *   Use `npm install express` to install Express.js as a project dependency.
        *   Explain that this adds Express to `node_modules` and updates `package.json`.
    *   **Creating an Express App:**
        *   Show how to import Express using `require('express')`.
        *   Create an Express application instance using `express()`.
        *   Explain that `app` is the central object for configuring routes and middleware.
    *   **Routes and Middleware:**
        *   Introduce the concept of routes for handling different HTTP requests based on URL paths and methods.
        *   Explain middleware functions as functions that have access to the request and response objects and can modify them or end the request-response cycle.
        *   Briefly mention common middleware use cases: logging, authentication, parsing request bodies.
    *   **`app.get()`, `app.listen()`:**
        *   Focus on `app.get(path, handler)` for defining GET routes.
        *   Explain the route handler function (taking `req` and `res` as arguments).
        *   Demonstrate using `res.send()`, `res.json()`, `res.status()` in route handlers.
        *   Reinforce `app.listen(port, callback)` for starting the Express server.

*   **Exercises (In-Class):**
    1.  **Install Express.js:**
        *   Navigate to the project directory from Day 2 (or create a new one).
        *   Run `npm install express` in the terminal.
    2.  **Rewrite Server with Express:**
        *   Rewrite the HTTP server from Day 2's exercise using Express.js in `server.js`.
        *   Use Express to handle the root path (`/`) and respond with "Hello Express!".
    3.  **Create `/api/message` Route:**
        *   Add a new route `/api/message` using `app.get()`.
        *   In the handler for `/api/message`, send a JSON response using `res.json()` like:
            ```json
            { message: "This is an API endpoint" }
            ```
    4.  **Test Express Server and Routes:**
        *   Start the Express server using `node server.js`.
        *   Test both routes in the browser:
            *   `http://localhost:3000/` should display "Hello Express!"
            *   `http://localhost:3000/api/message` should display the JSON response.

*   **Homework:**
    1.  **Explore HTTP Methods in Express:**
        *   Read the Express.js documentation section on routing and explore how to handle different HTTP methods like POST, PUT, DELETE using `app.post()`, `app.put()`, `app.delete()`.
        *   Create a simple Express server and define basic routes for POST, PUT, and DELETE methods (for now, just log a message to the console when these routes are accessed).
    2.  **Research Express Middleware:**
        *   Research and list 3 commonly used Express.js middleware.
        *   For each middleware, write a one-sentence explanation of its purpose and what it is typically used for. Examples: `express.json()`, `express.urlencoded()`, `morgan`, `cors`.

**Day 4: Building API: GET Todos**

*   **Objective:** Students will learn about API design principles, RESTful API basics, and implement a GET endpoint to retrieve a list of todo items from an in-memory array.

*   **Concepts:**
    *   **API Design Principles:**
        *   Briefly introduce API (Application Programming Interface) and its purpose.
        *   Discuss basic API design principles: clarity, consistency, ease of use, discoverability.
    *   **RESTful API Basics:**
        *   Introduce REST (Representational State Transfer) as a common architectural style for APIs.
        *   Explain key REST concepts: resources, HTTP methods (GET, POST, PUT, DELETE), statelessness.
        *   Focus on GET requests for retrieving data.
    *   **GET Requests:**
        *   Explain that GET requests are used to retrieve resources from the server.
        *   Data is typically sent in the URL (query parameters).
        *   Responses are expected to be read-only and should not modify server-side data.
    *   **Arrays in JavaScript (for in-memory data):**
        *   Review JavaScript arrays as a simple way to store collections of data.
        *   Explain how to create, access, and manipulate arrays in JavaScript.
        *   For this lesson, we will use an array to simulate a database for storing todo items in memory.
    *   **`res.json()`:**
        *   Reiterate the use of `res.json()` in Express.js to send JSON responses.
        *   Explain that Express automatically sets the `Content-Type` header to `application/json`.
    *   **Reading Data from an Array:**
        *   Demonstrate how to access and return an array as a JSON response using `res.json()`.

*   **Exercises (In-Class):**
    1.  **Create `todos` Array:**
        *   In `server.js`, declare an empty array named `todos` at the top level (outside of any route handlers) to simulate in-memory data storage.
    2.  **Create GET `/api/todos` Route:**
        *   Use `app.get('/api/todos', ...)` to define a GET route for retrieving todos.
    3.  **Implement Route Handler:**
        *   In the route handler for `/api/todos`:
            *   Use `res.json(todos)` to send the `todos` array as a JSON response to the client.
    4.  **Test API Endpoint:**
        *   Start the server.
        *   Open a browser or use tools like `curl` or Postman to access `http://localhost:3000/api/todos`.
        *   Verify that an empty JSON array `[]` is returned.

*   **Homework:**
    1.  **Add Initial Todo Items:**
        *   Directly in `server.js`, add some initial todo items as objects to the `todos` array. Each todo item should be an object with properties: `id` (use `Date.now()` for now), `task` (string), and `done` (boolean, initially `false`). Example:
            ```javascript
            let todos = [
              { id: Date.now(), task: 'Learn Node.js', done: false },
              { id: Date.now() + 1, task: 'Build a simple API', done: true }
            ];
            ```
        *   Restart the server and test the `/api/todos` endpoint again. Verify that the initial todo items are now returned in the JSON response.
    2.  **(Optional - Advanced) Filter Todos by Query Parameter:**
        *   Modify the GET `/api/todos` endpoint to allow filtering todos based on a query parameter `done`.
        *   If the request URL is `/api/todos?done=true`, the API should only return todos where `done` is `true`.
        *   If `/api/todos?done=false`, return only todos where `done` is `false`.
        *   If no `done` query parameter is provided (just `/api/todos`), return all todos.
        *   Use `req.query` to access query parameters in Express.js.

**Day 5: Building API: POST Todos**

*   **Objective:** Students will implement a POST API endpoint to add new todo items to the in-memory array. They will learn about POST requests, request bodies, URL-encoded data, and middleware for parsing request bodies.

*   **Concepts:**
    *   **POST Requests:**
        *   Explain that POST requests are used to send data to the server to create a new resource.
        *   Data is typically sent in the request body.
        *   POST requests can modify server-side data.
    *   **Request Body:**
        *   Explain the concept of the request body as a way to send data along with an HTTP request (especially for POST and PUT methods).
        *   Discuss different formats for request bodies (JSON, URL-encoded, form data).
    *   **URL-encoded Data:**
        *   Explain URL-encoded format (`application/x-www-form-urlencoded`) which is commonly used for form submissions.
        *   Key-value pairs are encoded in the body, separated by `&`, and keys and values are URL-encoded.
    *   **Middleware for Parsing Request Body (`express.urlencoded()`):**
        *   Introduce `express.urlencoded({ extended: true })` middleware.
        *   Explain that this middleware parses URL-encoded request bodies and makes the parsed data available in `req.body`.
        *   Explain the `extended: true` option (allows for parsing complex objects and arrays, though we are not using them directly in this simple example).
    *   **Generating Unique IDs (`Date.now()`):**
        *   Discuss the need for unique IDs for todo items.
        *   For simplicity in this lesson, use `Date.now()` to generate a timestamp-based ID. (Mention that this is not ideal for production and UUIDs are better but more complex for beginners).
    *   **Adding Data to an Array:**
        *   Demonstrate how to use `todos.push()` to add a new todo object to the `todos` array.
    *   **`res.status(201)` (Created Status):**
        *   Introduce the 201 Created HTTP status code.
        *   Explain that 201 should be used to indicate successful creation of a new resource in response to a POST request.

*   **Exercises (In-Class):**
    1.  **Install `express.urlencoded()` Middleware:**
        *   In `server.js`, import and use the `express.urlencoded({ extended: true })` middleware *before* any route definitions.
        *   `app.use(express.urlencoded({ extended: true }));`
    2.  **Create POST `/api/todos` Route:**
        *   Use `app.post('/api/todos', ...)` to define a POST route for adding new todos.
    3.  **Implement Route Handler:**
        *   In the route handler for POST `/api/todos`:
            *   Extract the `task` value from `req.body` (assuming the request body will contain `task` in URL-encoded format).
            *   Create a new todo object: `{ id: Date.now(), task: task, done: false }`.
            *   Push the new todo object to the `todos` array.
            *   Send a 201 Created status and a JSON response:
                ```json
                { message: 'Todo added successfully', todo: newTodo }
                ```
    4.  **Test API Endpoint (using HTML Form):**
        *   Create a basic `index.html` file in the `public` folder (if not already created). Include:
            *   A simple HTML form with:
                *   An input field with `name="task"` for the todo task.
                *   A submit button.
                *   Set the form's `action="/api/todos"` and `method="POST"`.
        *   Serve static files from the `public` folder using `app.use(express.static('public'));` (at the beginning of `server.js`).
        *   Open `index.html` in the browser (by accessing `http://localhost:3000/`).
        *   Fill in the form and submit it.
        *   Check the `/api/todos` GET endpoint in the browser or Postman to verify that the new todo item has been added.

*   **Homework:**
    1.  **Input Validation for POST `/api/todos`:**
        *   Modify the POST `/api/todos` endpoint to implement basic input validation.
        *   Check if the `task` field from `req.body` is present and not empty.
        *   If `task` is missing or empty, return a 400 Bad Request status with a JSON error message like `{ message: 'Task is required' }`.
        *   Test the validation by sending POST requests without a `task` field or with an empty `task`.
    2.  **Research UUIDs for IDs (Advanced):**
        *   Research UUID (Universally Unique Identifier) as a better method for generating unique IDs in JavaScript (compared to `Date.now()`).
        *   Explore npm packages for generating UUIDs (like `uuid`).
        *   (Optional, if time permits) Try to integrate a UUID library into the project to generate IDs for new todo items instead of `Date.now()`.

This detailed lesson plan for Week 1 provides a solid foundation in Node.js and Express.js, setting the stage for building a fully functional Todo application in Week 2. Remember to adjust the pace and depth based on the students' prior knowledge and learning speed. Good luck!