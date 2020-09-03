# bullet-journal

Based on the rapid logging method called Bullet Journaling.  A full explanation can be found at their website (https://bulletjournal.com/pages/learn).

Bullet Journaling works by logging many, small bullets throughout the day instead of traditional long-form journaling. Think of it as note-taking for your every day life. 

A bullet can be either a task, an event, or a note. Each of these can contain nested notes to hold more detail and is associated with a date (optionally with a due date). These are then organized and can be viewed in either a yearly, monthly, and daily logs. Yearly logs show major events for each month. Monthly logs show a more detailed breakdown of events for the month, as well as any tasks to be completed or remain uncompleted from previous months. The daily log shows tasks and notes on the day they were added and events on the day that it occurs.

## To Install

This project uses basic Vue CLI commands for building and serving a dev server.

- To clone the project and install dependencies:
```
git clone https://github.com/djdietrick/bullet-journal.git
cd bullet-journal
npm install
```

You will also need to add a config file for the server to work properly. For dev, create a file called 'dev.env'. In that file, specify the following parameters:
* PORT (port you want the server to run on)
* DEV_MONGODB_URL (url of your mongo db)
* JWT_SECRET (for your JWT)
* MAX_BULLETS (optional), specify the maximum number of bullets allowed per user

The client also has one config property which is kept in a .env file in the root of this directory.  Refer to the Vue documentation for more information on Vue configuration files
* VUE_APP_SERVER_URL (Location of the API)

- To serve up a dev server with hot refresh:
```
npm run serve
```

- To build the project for distribution:
```
npm run build
```

## Tech Stack

The server is a Node.js application running an Express server. The server is a REST API which handles requests from the clients to manage user data as well as authentication.  It uses Mongoose to connect to a MongoDB and define schemas for the data. Authentication uses Bcrypt to encrypt user passwords and JSON web tokens to confirm authentication while making requests.

The client is built using Vue.  The interface and components are all styles with pure SCSS. The UI is driven by Vuex which handles making requests to the backend and updating the state of the frontend.

The backend is hosted using Docker and Google's Cloud Run platform. It allows you to run docker containers on demand instead of having it always run on a dedicated server. This allows you to run all different kinds of programs in the cloud, including REST APIs.

## Project Structure

- `dist`
    - Target for Vue build
- `public`
    - Entry point for Vue application. Holds `index.html` that is the main page the app attaches to.
- `src`
    - Directory that holds the Vue app code
    - `assets`
        - Static assets for the Vue app
    - `components`
        - Vue components that make up the UI
    - `store` 
        - Vuex store and actions. Code that communicates with Firestore, authentication, and cloud functions.
    - `styles`
        - SCSS for the UI style
    - `views`
        - Higher level Vue components, for main pages.
    - `App.vue`
        - Main Vue app which holds all components and views
    - `main.js`
        - Initializes the Vue app
- `server`
    - Directory for all the server code
    - `db`
        - Connects to the MongoDB instance
    - `middleware`
        - Express middleware for authenticating routes
    - `models`
        - Mongoose schema definitions as well as model helper functions
    - `routes`
        - API routes which handle CRUD functionality
    - `test`
        - Integration tests for the server
    - `app.ts`
        - Base app class which initialized the server and connects to the database
    - `index.ts`
        - Entry point for running the app, creates an instance of app and then listens on the given port.