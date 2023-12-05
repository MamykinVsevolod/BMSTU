## Запуск склонированного репозитория
```shell
rake app:update:bin
```

## Тесты

```ruby
rake test
```

[Katalon Recorder (Selenium tests generator)](https://chrome.google.com/webstore/detail/katalon-recorder-selenium/ljdobmomdgdljniojadhoplhkpialdid/related)

### **Rspec**:
В Gem файл добавляем 
```ruby
gem 'rspec-rails'
gem 'capybara'
gem 'selenium-webdriver'
```

> Note: Перед тестами запускаем сервер

```shell
rails generate rspec:install
rails s
bundle exec rspec spec/test_twins_spec.rb
# bundle exec rspec
```

Вверху файла `test_twins_spec.rb` импортируем `require 'rails_helper'`, и заменяем `rspec` на `rspec-rails` в связи с тем, что для Rails rspec модуль свой.

> Note: `_spec` префикс необходим для корректной работы `bundle exec rspec`

## Ошибки
```shell
Your ExecJS runtime JScript isn't supported by autoprefixer-rails,
please switch to Node.js (V8) or mini_racer (V8)
```

Устанавливаем [Node.js](https://nodejs.org/en/download/current)
