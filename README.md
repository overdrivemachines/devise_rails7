# README

Rails 7 example app with Devise. <br>
Video: https://www.youtube.com/watch?v=f6NPdVJKbaY

# ERD Diagram
![ERD Diagram](erd.png)

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
- Add "letter_opener" gem to Gemfile
- In \_header.html.erb add sign in and sign out links:
```
<%= link_to "Sign In", new_user_session_path %>
<%= link_to "Sign Out", destroy_user_session_path, data: { turbo_method: :delete } %>
```

- Add views and controllers
```
rails g devise:views users
rails g devise:controllers users
```
- Add sessions, passwords and registrations in the routes.rb:
```rb
devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  registrations: 'users/registrations'
  confirmations: 'users/confirmations'
}
```

- Style necessary devise view templates
- Disable turbo/hotwire for app/views/users/passwords/new.html.erb:
`html: { method: :post, "data-turbo": "false" }`

- Create a new mailer
```
rails g mailer welcome send_greetings_notification
```
- Customize:
  - app/mailers/welcome_mailer.rb
  - app/views/welcome_mailer/send_greetings_notification.html.erb
- Call mailer from app/models/user.rb

- Add fields to User model:
```
rails g migration add_custom_attr_to_users
```
- After editing the generated migration file, run `rails db:migrate`

- In registrations_controller.rb, permit extra params in configure_sign_up_params and configure_account_update_params
- In devise.rb add:
```rb
config.authentication_keys = [:login]
```
- In sessions/new.html.erb add replace email field to `f.text_field :login`

- In user.rb add validations and the following function:
```rb
def self.find_for_database_authentication(warden_condition)
  conditions = warden_condition.dup
  if (login = conditions.delete(:login))
    where(conditions.to_h).where(["lower(username) = :value OR
      lower(email) = :value", { value: login.downcase }]).first
  elsif conditions.has_key?(:username) || conditions.has_key?(:email)
    where(conditions.to_h).first
  end
end
```



* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
