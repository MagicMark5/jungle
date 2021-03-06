# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example.

### Jungle Products 

The landing page of Jungle shows a list of example products in the development database. Any active sales are shown in a banner on every page and all product prices are accordingly reflected. Users can begin shopping by adding items to their cart or clicking Details on a product to see a product specific view. 

!["Products Index View"](https://github.com/MagicMark5/jungle/blob/master/docs/jungle_products.png?raw=true)

### Jungle Cart 

Users are able to view their cart and modify quantities of items before checking out with stripe 

!["Cart View"](https://github.com/MagicMark5/jungle/blob/master/docs/jungle_cart.png?raw=true)

### Admin View of Products

Admin users are able to add or remove products, add new product categories, create new sales, and view product/categories statistics.

!["Admin Products View"](https://github.com/MagicMark5/jungle/blob/master/docs/jungle_admin_products.png?raw=true)


## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Admin Features

#### Example Authorization to see admin features: 
username: "Jungle"
password: "book"

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
