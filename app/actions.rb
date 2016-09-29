# Homepage (Root path)
get '/' do
  @variable = 'Lorem ipsum'
  erb :index
end
