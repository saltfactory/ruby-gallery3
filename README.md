# ruby-gallery3

**ruby-gallery3** is Gallery3 Client Library via ruby

## Configuration file

The first, you have to create `.gallery3.json` in `$HOME` directory. the next is example that is `~/.gallery3.json`.

```javascript
{
	"host":"http://example.com",
	 "base":"/gallery3",
	 "rootItemId":2,
	 "user":"saltfactory,
	 "password":"saltfactory",
	 "requestKey":"blahblahblah"
}
```

## Usage 

If you get requestKey from gallery3, you can do it using with `Gallery3.login?`

```ruby
require 'ruby-gallery3'

gallery3 = Gallery3.new
puts gallery3.login?
```

If you get item, you can do it using with `Gallery3.find_item`

```ruby
require 'ruby-gallery3'

gallery3.find_item :id => 2
```

If you crate album, you can do it using with `Gallery3.create_item`

```ruby
require 'ruby-gallery3'

gallery3.create_item :entity => {:name => "aaaa", :title => "aaa", :type => "album"}
```

If you upload photo, you can do it using with `Gallery3.upload_file`

```ruby
gallery3.uplaod_file :file => '/Users/saltfactory/Downloads/bh6hug.jpg'
```


