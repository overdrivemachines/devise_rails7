# README

Rails 7 example app with Devise. <br>
Video: https://www.youtube.com/watch?v=f6NPdVJKbaY

# Ruby version
ruby 3.1.1 <br>
rails 7.0.2.3

# Steps
- Add gems "annotate" and "rails-erd" in development group
- Add gem "cssbundling-rails", "devise"
- Install Bootstrap:
```
rails css:install:bootstrap
./bin/importmap pin bootstrap
```
- Add controller and action:
```
rails g controller home index
```
- Add app/views/shared/\_header.html.erb
- Add gem "devise"
- Run generator:
```
rails g devise:install
```

- Add to development.rb: `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`
- Add to application.html.erb:
```html
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```
- Create model:
```
rails g devise user
```
- Add :confirmable, :trackable to User.rb and uncomment related fields in the migration file
-

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
