require 'json'

class RedisModel
  @redis = RedisCache.connect

  def self.get_containers
    list = []
    @redis.keys('c:*').each do |container|
      data = Hash.new
      db = @redis.hgetall(container)
      data['name'] = container.split("c:")[1]
      data['status'] = JSON.parse(db['state'])['status']
      data['ip'] = JSON.parse(db['state'])['network']['eth0']['addresses'][0]['address']
      data['os'] = 'none'
      data['version'] = 'none'
      data['imageid'] = JSON.parse(db['info'])['config']['volatile.base_image'][0..5]
      list.push(data)
    end
    list
  end

end