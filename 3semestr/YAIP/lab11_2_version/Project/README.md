## Quick start
### Мега быстрый старт
Удаляем `Gemfile.lock`
```shell
rails g scaffold Result input:integer:uniq result:json
rake db:migrate
rake db:migrate RAILS_ENV=test
rake test TEST=test/models/result_test.rb
```

Генерируем модель **QueryResult (Result)**, с полями **input** - id, **result** - результат вычислений

> Note: Важно собдюдать соглашения в наименовании моделей, в единственном числе, 1 словом - это идеально

```shell
rails g scaffold Result input:integer:uniq result:json
```

Вывод:
```text
invoke  active_record
create    db/migrate/20231108114520_create_results.rb
create    app/models/result.rb
invoke    test_unit
create      test/models/result_test.rb
create      test/fixtures/results.yml
invoke  resource_route
route    resources :results
invoke  scaffold_controller
create    app/controllers/results_controller.rb
invoke    erb
create      app/views/results
create      app/views/results/index.html.erb
create      app/views/results/edit.html.erb
create      app/views/results/show.html.erb
create      app/views/results/new.html.erb
create      app/views/results/_form.html.erb
create      app/views/results/_result.html.erb
invoke    resource_route
invoke    test_unit
create      test/controllers/results_controller_test.rb
create      test/system/results_test.rb
invoke    helper
create      app/helpers/results_helper.rb
invoke      test_unit
invoke    jbuilder
create      app/views/results/index.json.jbuilder
create      app/views/results/show.json.jbuilder
create      app/views/results/_result.json.jbuilder
```

Для удаления модели используем:
```shell
rails destroy scaffold Result
```

Выпоняем миграции, чтобы создать БД:
```shell
rake db:migrate
```

Теперь нашу БД можно просмотреть по пути [app/db/development.sqlite3](sequences%2Fdb%2Fdevelopment.sqlite3)

Добавим путь для проверки работы БД (индекс, создание записи) в *routes.rb*
```ruby
get 'db_index', to: 'results#index'
get 'db_new', to: 'results#new'
```

Теперь по пути http://127.0.0.1:3000/db_index будет доступен вывод БД в виде названия модели, данных, хранящихся там и кнопки создания новой записи.

Добавление записи в БД:
```ruby
Result.new(:input => n, :result => json_res)
```

Поиск в БД (можно использовать динамические методы поиска по условию). В моем случае по полю *input*. Более подробно о том, как работает контроллер БД - [app/controllers/results_controller.rb](sequences%2Fapp%2Fcontrollers%2Fresults_controller.rb):
```ruby
Result.find_by_input(n)
```

### Добавить действие в контроллер, позволяющее определить, что хранится в БД через сериализацию в XML.
Добавляем XSLT Transformer в папку public [app/public/xslt_transformer.xslt](sequences%2Fpublic%2Fxslt_transformer.xslt)

В контроллер БД [results_controller.rb](sequences%2Fapp%2Fcontrollers%2Fresults_controller.rb) добавляем функцию для демонстрации всего с помощью сериализации в xml.

```ruby
def show_all
    respond_to do |format|
      results = Result.all
      rows = ''

      results.each do |record|
        rows += "<cd><id>#{record.input}</id><item>#{record.result}</item></cd>"
      end

      responce = "<catalog>#{rows}</catalog>"

      format.xml { render xml: xslt_transform(responce).to_xml }
    end
  end

def xslt_transform(data, transform: XSLT_TRANSFORM)
    # Функция преобразования 
    print data, transform, "\n"

    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
end
```

## Тесты модели
Пишем тут - [app/test/models](sequences%2Ftest%2Fmodels)

Запуск миграции для тестовой БД
```shell
rake db:migrate RAILS_ENV=test
```

Запуск теста БД
```shell
rake test TEST=test/models/result_test.rb
```

При ошибки в выполнении теста удалите файл `test/fixtures/<ИМЯ-ВАШЕЙ-МОДЕЛИ>.yml`

### Тест 1 (Написать тест на добавление и поиск данных с помощью модели. Проверить выполнение теста.)
[app/test/models](sequences%2Ftest%2Fmodels)
```ruby
class ResultTest < ActiveSupport::TestCase
  def add_record(n = 10, data = { "11": 13, "17": 19 })
    record = Result.new(:input => n, :result => data)
    record.save
    record
  end

  test "Add data" do
    res = { "11": 13, "17": 19 }
    record = add_record(10, res)
    assert record
  end

  test "Find data" do
    add_record
    record = Result.find_by_input(10)

    assert record
  end

end
```

### Тест 2 (Реализовать тест модели, проверяющий невозможность повторного добавления одних и тех же результатов вычислений.)
```ruby
test "Add same result" do
    add_record
    assert_raises(ActiveRecord::RecordNotUnique) do
      add_record
    end
end
```

### тест 4 (Проверка маршрутов)
```shell
rails routes --expanded
```

### Прикрепление БД в виде XML
[Скачайте](https://sqlitestudio.pl/) В ней откройте БД, затем, Инструменты -> Экспорт -> Одну таблицу (выбираем свою таблицу, в моем случае **result** и экспортировать только данные таблицы - без триггеров и индексов) -> Формат XML, кодировка UTF-8.
Затем [online](https://onlineconvertfree.com/ru/convert-format/xml-to-txt/) конвертируем xml в text и вставляем

### Измененные файлы
- Контроллер модели: [results_controller.rb](sequences%2Fapp%2Fcontrollers%2Fresults_controller.rb)
- Контроллер приложения: [sequences_controller.rb](sequences%2Fapp%2Fcontrollers%2Fsequences_controller.rb)
- Пути: [routes.rb](sequences%2Fconfig%2Froutes.rb)
- Тесты модели: [result_test.rb](sequences%2Ftest%2Fmodels%2Fresult_test.rb)

### Пути:
- Демонстрация БД: http://127.0.0.1:3000/db_index
- Создание записи: http://127.0.0.1:3000/db_new
- Демонстрация данных с помощью XML: http://127.0.0.1:3000/show_all
- Ввод: http://127.0.0.1:3000/sequences/input
- Вывод: http://127.0.0.1:3000/sequences/view
- Путь по-умолчания - ввод: http://127.0.0.1:3000
