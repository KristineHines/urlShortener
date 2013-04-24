get '/' do
  @list_short_urls = Url.all
  erb :index
end

post '/urls' do
  puts "Someone tried to shorten a url"
  @url = Url.new(params)
  if @url.valid?
    @url.create_short_url
    erb :display
  else
    @error = @url.errors.full_messages.first
    @list_short_urls = Url.all
    erb :index
  end
  
  # create a new short Url
  # display the shortened url
end

get '/:short_url' do
  short_url = params[:short_url]
  url = Url.where('short_url = ?', short_url).first
  url.increment_click_count
  redirect url.long_url
end
