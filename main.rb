require './app'

def main
  app = App.new
  app.run

  at_exit do
    app.preserve_all
  end
end

main
