## Recipes Sharing 

The APP allows users to signup and create food recipes to share among them with an option of leaving comments

## dependencies
```
gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem 'pg', '0.20'
gem 'dotenv'
gem 'foreman'
gem 'rails_12factor'
gem 'sysrandom'
gem 'json'
gem 'rack-flash3'
```
```
group :development do 
  gem 'sqlite3', '<1.4'
  gem 'shotgun'
  gem 'tux'
end
```
```
group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'#, git: 'https://github.com/bmabey/database_cleaner.git'
end
```
## Installation

Fork and clone the repos and then run 
```
bundle install
```

## Authors © 2019 by AssaneSav

License This project is licensed under the MIT License:

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

<a href="https://recipes-sharing.herokuapp.com/" >App live on heroku</a>
