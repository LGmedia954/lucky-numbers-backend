# Lucky Numbers - Back End

Backend Repository: https://github.com/LGmedia954/lucky-numbers-frontend

Users can mouse action to pick and save up to six lucky numbers.

# How To Use This Application

To use this app, clone the Front End repository and run npm install to install Node dependencies. Then run npm start.

Clone the Back End repository and run bundle install to install necessary gems. Run rake db:migrate and rake db:seed to populate the database.

Run rake start to launch the client and API servers. Navigate to http://localhost:3000 to view the React app.

# Project Requirements

• The code should be written in ES6 as much as possible
• Use the create-react-app generator to start your project.
• Your app should have one HTML page to render your react-redux application. • There should be 5 stateless components.
• There should be 3 routes.
• The Application must make use of react-router and proper RESTful routing.
• Use Redux middleware to respond to and modify state change
• Make use of async actions and redux-thunk middleware to send data to and receive data from a server.
• Your Rails API should handle the data persistence with a database. You should be using fetch() within your actions to GET and POST data from your API - do not use jQuery methods.
• Your client-side application should handle the display of data with minimal data manipulation
• Your application should have some minimal styling, such as react-bootstrap or CSS.
