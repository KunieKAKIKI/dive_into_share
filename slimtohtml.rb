require 'slim'
p Slim::Template.new("./app/views/layouts/application.html.slim").render(self)
