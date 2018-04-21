# README

## Getting Started


### アプリケーションの起動
```
  $ docker-compose build
  $ docker-compose up -d
  $ docker-compose run web rails db:create
```


### webpacker、vueのインストール
```
  $ docker-compose run web rails webpacker:install
  $ docker-compose run web rails webpacker:install:vue

```

### Hello Vue!!
```
  $ docker-compose run web rails g controller home index
  $ vi config/routes.rb

  ---
  get 'home/index'
    -> root to: 'home#index'
  ---

  $ vi app/views/layouts/application.html.erb
  ---
  <body>
     <%= yield %>
     <%= javascript_pack_tag 'hello_vue' %>
  </body>  
  ---

  $ echo '' > app/views/home/index.html.erb 
```
