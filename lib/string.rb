require 'yaml'
require 'json'
require 'msgpack'
require 'zlib'

class String
  def like_number?
    x = self.gsub /^([+-]?)\./, "#{ $1 }0."
    !! ( x =~ /^[-+]?(\d+)(\.\d+(e[-+]?\d+)?)?$/ )
  end
  def present?; ! empty?; end
  def from_json
    JSON.parse(self).symbolize_keys rescue {}
  end
  def from_yaml
    YAML.load( self ).symbolize_keys rescue {}
  end
  def from_msgpack
    MessagePack.unpack( self ).symbolize_keys rescue {}
  end
  def from_zlib
    Zlib::Inflate.inflate(data[ki])
  end
  def to_a; [self]; end
  def snakecase
    self.gsub( /[[:upper:]]+/) {|m| "_#{ m.downcase }" }.gsub(/\A_/,'')
  end
  def camelcase
    self.gsub( /(\A|_)[[:lower:]]+/ ) {|m| m.gsub(/^_/,'').capitalize }
  end
end
