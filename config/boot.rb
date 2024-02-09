APP_ROOT = File.expand_path('..', __dir__)

class Application < Sinatra::Base
  set :port, 3000
  set :bind, '0.0.0.0'
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
end

class RedisCache

  def self.connect
    @redis = Redis.new(
      host: ENV['REDIS_HOST'],
      port: ENV['REDIS_PORT'],
      db: 0
    )
  end
end