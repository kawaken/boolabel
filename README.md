boolabel
========

app/models/concernsにboolabel.rbを設置する。

app/models/egg.rb
```ruby
class Egg < ActiveRecord::Base
  include Boolabel

  boolabel :boiled

end
```

config/locals/ja.yml
```
ja:
  activerecord:
    boolabel:
      egg:
        boiled: ['ゆでた', 'ゆでてなーい']
```

```
$ rails c
Loading development environment (Rails 4.1.4)
[1] pry(main)> egg = Egg.new
=> #<Egg id: nil, boiled: false, created_at: nil, updated_at: nil>
[2] pry(main)> egg.boiled
=> false
[3] pry(main)> egg.boiled_label
=> "ゆでてなーい"
[4] pry(main)> egg.boiled!
=> true
[5] pry(main)> egg.boiled_label
=> "ゆでた"

```
