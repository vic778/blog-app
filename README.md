# BLOG APP

> The Blog app is a classic example of a blog website. A fully functional website that shows the list of posts and empower readers to interact with them by adding comments and liking posts.

This API is made of three models:
- User model
- Post model
- Comment model
- Like model 
- Ability model 


The API has the following endpoints:


allow user to authenticate and return a token

`POST /users/sign_in`

allows user to create an account

`POST /users/sign_up`

returns all the posts

`GET /users/id/posts`

allows admin to create an post

`POST /users/id/posts/new`

returns a specific post

`GET /users/id/posts/id`

## Built With

- Rails
- Ruby 
- Postgresql

## Getting Started

Here are the steps to follow in order to get this project on your local computer.

### Prerequisites

`rails v7.0.2 +`

`ruby v3.0.2 +`

### Setup

clone this repo by typing `git clone https://github.com/vic778/blog-app`

### Install

install the dependencies by typing `bundle install`

### Usage

start the local server by running `rails s`

### Testing

run the tests by typing `bundle exec rspec`

### Rubocoop
run the tests by typing `rubocop --color`

### Deployment

N/A

## Author

👤 **Victor Barh**

- GitHub: [@Vvic778](https://github.com/vic778)
- Twitter: [@victoirBarh](https://twitter.com/)
- LinkedIn: [LinkedIn](https://linkedin.com/in/victoir-barh)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used !

## 📝 License

This project is [MIT](lic.url) licensed.
