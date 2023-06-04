# README

This is a sample code to fix a challenge propossed by Taste Media using their CMS Prismic.

To run this project please fork and clone it, install ruby 3.2.2 with your preferred ruby version manager (I use RVM), then run:
1. `gem install bundler -v 2.4.12`
2. `bundle install`
3. `rails db:setup`

To access the Rails Credentials you need to create a file named: "master.key" in the project root directory and add this code:
53cfd3543864e7afaedb5f1cde46607f

Don't worry, the credentials only have the prismic api key, but the api created is public.
