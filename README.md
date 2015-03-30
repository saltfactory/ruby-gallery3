# ruby-gallery3

**ruby-gallery3** is Gallery3 Client Library via ruby

## Configuration file

The first, you have to create `.gallery3.json` in `$HOME` directory. the next is example that is `~/.gallery3.json`.

```javascript
{
	"host":"http://example.com",
	 "base":"/gallery3",
	 "rootItemId":2,
	 "user":"saltfactory",
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
gallery3.find_item :id => 2
```

If you crate album, you can do it using with `Gallery3.create_item`

```ruby
gallery3.create_item :entity => {:name => "aaaa", :title => "aaa", :type => "album"}
```

If you upload photo, you can do it using with `Gallery3.upload_file`

```ruby
gallery3.uplaod_file :file => '/Users/saltfactory/Downloads/bh6hug.jpg'
```


# License

The MIT License (MIT)

Copyright (c) 2015 SungKwang Song

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

