# John's Blog Application

### What is it?

This is the rails application that serves as my blog at [Mageeworld.com](http://www.mageeworld.com).  Many tutorials (including [Rails Guides](http://guides.rubyonrails.org/)) use the basic concept of a blog (articles & comments) as a quick introductory example to Ruby on Rails.  I needed a blog for a variety of reasons, and while I was doing tutorials, I needed my own project to work on, so it made sense to build a blog from scratch.  Though it's custom built for me, it would be pretty easy for anyone to customize for themsleves if they wanted.

### How is it built?

The application is built in Rails 4.2.4 with Ruby 2.2.3, in a test driven development environment with RSpec and Capybara.  Devise is set up to allow one user (the admin) to log in to an admin namespace. 

Articles are written in markdown, intitially processed by Redcarpet, but now processed by Kramdown.  Code examples are processed by the Coderay gem.  Comments are currently only allowed anonymously.  

An Admin namespace exists and has some basic design on an admin home page.  The most recent 10 comments (anonymous commenting means a lot of spam), article drafts are currently the only things listed there.  There is a file upload mecahnism built using Carrierwave, but only with local storage on the server.  The application is currently hosted at heroku, so to make the file upload functionality work, I know I have to expand into the fog gem and remote hosting some how.

There are a couple things I have set up that I hope to use long term that I believe are not on most basic blogs:

* Each article belongs to a ***category***.  I set up the category names (admin could allow changing/adding of categories in the future) and every article is connected to a category.  The categories were set up because hopefully as my blog grows and matures, I will be writing on a variety of topics (and sub topics) as my interests and passions warrant.  At this time, the links to the categories don't do anything yet.

* I created an 'abstract' attribute for articles.  The abstract exists to present a sort of summary of what the article covers. (It's the science background in me)


The most recent addition (as of January 27th 2017), is a basic tagging function, that I built on my own as opposed to using a gem, again for the learning experience.  Tags can be added when editing or creating an article, they are comma separated so multi word tags are allowed.  Currently tags are case sensitive.  


### Getting Started - Pretty Easy

  * Fork application
  * Clone fork locall
  * bundle the games
  * `rake db:migrate`.  The test database is built in SQLite as I work develop mon Macs
  * Check to make sure all the tests work, `bundle exec rspec spec`
  * There is a `seed.rb` file set up to create some categories.  It's set up for my category ideas of course.  Feel free to change it 
  * Note:  The app/views/shared_footer.html.erb file has google analytic code for my domain.  You should delete it

### Contributions

Any and all contributions are welcome.  Ideally, I'd love to convert this into a more generic thing anyone can use, sort of like a wordpress for Rails.  I have plans to do the following but welcome contribution from anyone else who would like to work on it:

  * Fix the carrierwave functionality so that it would work on a host like heroku, I have looked into the idea of linking it to my drop box, but a more general way would be nice
  * A wysiwyg would be great, I've heard of one in rails via [RubyThursday](https://rubythursday.com/episodes/ruby-snack-28-simple-blog-with-froala-v2-and-anitize-gem) but haven't worked with it yet
  * Anyone with any interest in practicing their UI/UX skills, they're more than welcome to.  Bootstrap and Font-Awesome are installed.  
  * I've toyed with the idea of 'language filter' for posts, not just altering the wrong words but 'scoring' the content and if it has too much of  negative score it wouldn't get posted

 Any questions or comments, you can contact [email me](mailto:admim@mageeworld.com)

