# main.rb
require_relative 'app'
require_relative 'user_interface'

app = App.new
user_interface = UserInterface.new(app)
user_interface.start
