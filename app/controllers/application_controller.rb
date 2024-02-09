class ApplicationController < Application


  get '/api' do
    content_type :json
    RedisModel.get_containers.to_json
  end

  get '/' do
    @containers = RedisModel.get_containers
    erb :'home/show'
  end

end
