require 'json'

class RedisModel
  @redis = RedisCache.connect

  def self.get_containers
    list = []
    @redis.keys('c:*').each do |container|
      data = Hash.new
      db = @redis.hgetall(container)
      data['host'] = db['host']
      data['name'] = container.split("c:")[1]
      data['status'] = JSON.parse(db['state'])['status']
      begin
        data['ip'] = JSON.parse(db['state'])['network']['eth0']['addresses'][0]['address']
      rescue
        data['ip'] = 'none'
      end
      data['os'] = JSON.parse(db['info'])['config']['image.os']
      data['version'] = JSON.parse(db['info'])['config']['image.release']
      data['imageid'] = JSON.parse(db['info'])['config']['volatile.base_image'][0..5]
      list.push(data)
    end
    list
  end

end
