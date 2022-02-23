# HRCLONE APP

This project is going to be an open source HR Portal. Here you can find Employee Management, Leave Management and Attendance Management features. However anybody can use this project as practice repository and after cloning it on your local you can use the features implemented in this project like: 
1. Search Feature
2. Import and Export Feature
3. User AUthentication Features
4. ActiveRecord Associations and Validation and so on.

# Setup

## Cloning the project

* git clone https://github.com/RaviSys/AI-HRCLONE.git
* Run bundle by running this command:

```
bundle install
```

## Setup database

* The app is in development mode and only uses sqlite for now so only run following commands:

```
rails db:create
```
```
rails db:migrate
```

To populate the application with some seed data run the seed file:

```
raild db:seed
```

## Run project on local

Run 

```
rails server
```
and visit the browser at: http://localhost:3000

## Signin Using Admin User

First create an admin user by opening the rails console first:

```
rails c
```

And then execute this query:

```
User.create(email: 'admin@example.com', password: 'password', username: 'admin123', role: 'admin')
```

And then use this user's credentials for signin. You can use either username opr email for signin.