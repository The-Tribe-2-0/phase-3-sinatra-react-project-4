# Kinywaji Safi Backend

This is the backend server for the Kinywaji Safi Drink Tracker application. It provides the API endpoints for managing drinks and user authentication.

## Technologies Used

- Ruby
- Sinatra (Ruby web framework)
- ActiveRecord (Ruby ORM)
- SQLite (Database)

## Getting Started

### Prerequisites

- Ruby (version X.X.X)
- SQLite

### Installation

1. Clone the repository:

   ```shell
   git clone git@github.com:Mwanzia24/Kinywaji-safi-backend.git
Navigate to the project directory
cd Kinywaji-safi-backend
Start the server:
bundle exec rackup -p 9292
API Endpoints
Drinks
GET /drinks - Retrieve a list of all drinks.
GET /drinks/:id - Retrieve a specific drink by ID.
POST /drinks - Create a new drink.
PUT /drinks/:id - Update an existing drink.
DELETE /drinks/:id - Delete a drink.
User Authentication
POST /signup - Create a new user account.
POST /login - Authenticate user credentials and obtain an access token.
Contribution
Contributions to this project are welcome. If you find any issues or have suggestions for improvements, please create an issue or submit a pull request.

License
This project is licensed under the MIT License.

