require 'yaml'
require 'json'
require 'msgpack'
require 'zlib'

class String
  def like_number?
    x = self.gsub( /^([+-]?)\./, "#{ $1 }0." )
    !! ( x =~ /^[-+]?(\d+)(\.\d+(e[-+]?\d+)?)?$/ )
  end
  def present?; ! empty?; end
  
  def from_json
    t = JSON.parse( self ) rescue {}
    safe_parse_hash( t )
  end
  def from_yaml
    t = YAML.load( self ) rescue {}
    safe_parse_hash( t )
  end
  def from_msgpack
    t = MessagePack.unpack( self ) rescue {}
    safe_parse_hash( t )
  end
  def from_zlib
    Zlib::Inflate.inflate data[ki]
  end

  def to_a
    [self]
  end

  def snakecase
    self.gsub( /[[:upper:]]+/) {|m| "_#{ m.downcase }" }.gsub(/\A_/,'')
  end

  def camelcase
    self.gsub( /(\A|_)[[:lower:]]+/ ) {|m| m.gsub(/^_/,'').capitalize }
  end

  def safe_parse_hash( t )
    case t
    when Array
      t.collect{|item| item.is_a?( Hash ) ? item.symbolize_keys : item }
    when Hash
      t.symbolize_keys
    else
      t
    end
  end

end
