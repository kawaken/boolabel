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
[1] pry(main)> f = Egg.new
=> #<Egg id: nil, boiled: false, created_at: nil, updated_at: nil>
[2] pry(main)> f.boiled
=> false
[3] pry(main)> f.boiled_lable
=> "ゆでてなーい"
[4] pry(main)> f.boiled!
=> true
[5] pry(main)> f.boiled_lable
=> "ゆでた"

```
