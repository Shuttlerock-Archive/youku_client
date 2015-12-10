# Youku Ruby Gem

[![Build Status](https://secure.travis-ci.org/Shuttlerock/youku_client.png)](http://travis-ci.org/Shuttlerock/youku_client)
[![Code Climate](https://codeclimate.com/github/Shuttlerock/youku_client/badges/gpa.svg)](https://codeclimate.com/github/Shuttlerock/youku_client)

This is the unofficial Ruby wrapper for the Youku v2 API. It supports not all
endpoints currently available on the [Youku API](http://open.youku.com/docs?id=0).

## Installation

``` bash
gem install youku_client
```

### Some quick examples

First, instantiate the Client class:

``` ruby
>> client = Youku.new(client_id: 'id', client_secret: 'secret')
```

Get users by IDs:

``` ruby
>> client.users.show_batch(user_ids: '1,2')
```

Implemented API endpoints:

- `comments.by_video`
- `comments.show`
- `comments.show_batch`
- `comments.hot.by_video`
- `searches.video.by_keyword`
- `users.show_batch`
- `users.show`
- `users.friendship.followers`
- `users.friendship.followings`
- `videos.show_basic`
- `videos.show_basic_batch`
- `videos.show`
- `videos.show_batch`
- `videos.by_user`
- `videos.by_related`
- `videos.by_category`
- `videos.favorite.by_user`
- `schemas.video.category`

### Contributions and Pull Requests

No request is too small and I encourage everyone to get involved. So please if
you would like to contribute, let me know and throw me a pull request!

### Requirements

* Ruby 2.x.x

---

Copyright 2015 Shuttlerock Ltd.

Licensed under the Apache License, Version 2.0 (the "License"); you may not
use this work except in compliance with the License. You may obtain a copy of
the License in the LICENSE file, or at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
License for the specific language governing permissions and limitations.
