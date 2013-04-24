get '/' do
  @list_short_urls = Url.all
  erb :index
end

post '/urls' do
  puts "Someone tried to shorten a url"
  @url = Url.new(params)
  @url.create_short_url
  erb :display
  # create a new short Url
  # display the shortened url
end

get '/:short_url' do
  short_url = params[:short_url]
  url = Url.where('short_url = ?', short_url).first
  redirect url.long_url
end
