require 'json'

class RedisModel
  @redis = RedisCache.connect

  def self.get_containers
    list = []
    @redis.keys('lxd:*').each do |container|
      data = Hash.new
      db = @redis.hgetall(container)
      data['host'] = container.split(":")[1]
      data['name'] = container.split(":")[2]
      data['status'] = JSON.parse(db['state'])['status']
      begin
        data['ip'] = JSON.parse(db['state'])['network']['eth0']['addresses'][0]['address']
        data['netmask'] = JSON.parse(db['state'])['network']['eth0']['addresses'][0]['netmask']
        data['cidr'] = data['ip'] + '/' + data['netmask']
      rescue
        data['ip'] = 'none'
        data['netmask'] = 'none'
        data['cidr'] = 'none'
      end
      data['os'] = JSON.parse(db['info'])['config']['image.os']
      data['version'] = JSON.parse(db['info'])['config']['image.release']
      if data['os'] or data['version'] == nil
        data['os'] = none
        data['version'] = none
      end
      data['imageid'] = JSON.parse(db['info'])['config']['volatile.base_image'][0..5]
      list.push(data)
    end
    list.sort_by { |hsh| hsh['host'] }
  end

end
