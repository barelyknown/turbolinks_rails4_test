# Turbolinks Test for Rails 4

I updated [Steve Klabnik's turbolinks_test](https://github.com/steveklabnik/turbolinks_test) to run on Rails 4. I had some trouble with Capybara, so I switched to Watir running Firefox.

## Results

37% speed improvements in this 1,000 run trial:

<pre>
                    user        system    total     real
 turbolinks: false  15.160000   1.150000  16.310000 (177.007824)
 turbolinks: true   15.390000   1.170000  16.560000 (111.570606)
</pre>

The speed boost would be even higher with larger assets, but this is enough for me to make turbolinks work.

## Instructions

    bundle install
    bundle exec rspec