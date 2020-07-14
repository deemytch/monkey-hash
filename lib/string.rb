require 'yaml'
require 'json'
require 'msgpack'
require 'zlib'
require 'nori'
require_relative 'hash'

class String
  def like_number?
    x = self.gsub( /^([+-]?)\./, "#{ $1 }0." )
    !! ( x =~ /^[-+]?(\d+)(\.\d+(e[-+]?\d+)?)?$/ )
  end
  def present?; ! empty?; end
  def blank?; nil? || empty? end
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
    Zlib::Inflate.inflate self
  end
  def from_xml
    # Защита от кулхацкеров
    if self =~ /<!DOCTYPE[^>]+>|xsi:schemaLocation\s*=|<xs:schema|xmlns:xs=/
      raise RuntimeError.new('Invalid XML data provided')
    end
    # На всякий случай удаляем заголовок, могут быть глюки у Nori
    Nori.new(
      :convert_tags_to => lambda { |tag| tag.snakecase.to_sym }
      ).parse self.gsub(/^<\?xml[^>]+>\n*/i,'')
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

  # Stupid encoding without any parsing as described in Twitter OAuth doc
  # https://developer.twitter.com/en/docs/basics/authentication/oauth-1-0a/percent-encoding-parameters
  # http://tools.ietf.org/html/rfc3986#section-2.1
  def percent_encode
    @@percent_encode_table ||= [ 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45,0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B,0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,0x58, 0x59, 0x5A, 0x61, 0x62, 0x63, 0x64, 0x65,0x66, 0x67, 0x68, 0x69, 0x6A, 0x6B,0x6C, 0x6D, 0x6E, 0x6F, 0x70, 0x71,0x72, 0x73, 0x74, 0x75, 0x76, 0x77,0x78, 0x79, 0x7A, 0x2D, 0x2E, 0x5F, 0x7E ].freeze
    self.each_byte.collect{|i| @@percent_encode_table.include?(i) ? ("%c" % i) : ("%%%02X" % i) }.join()
  end

  def safe_parse_hash( t )
    case t
    when Array
      t.collect{|item| item.is_a?( Hash ) ? item.keys_to_symbols : item }
    when Hash
      t.keys_to_symbols
    else
      t
    end
  end

end
