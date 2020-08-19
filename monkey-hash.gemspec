Gem::Specification.new do |lib|

  lib.name          = 'monkey-hash'
  lib.version       = '1.4.2'
  lib.date          = '2020-08-19'
  lib.summary       = 'Simple additions for standard classes.'
  lib.files         = Dir['lib/*.rb']
  lib.require_paths = %w[lib]
  lib.author        = 'deemytch'
  lib.email         = 'aspamkiller@yandex.ru'
  lib.license       = 'GPL-2.0'
  lib.homepage      = 'https://github.com/deemytch/monkey-hash'
  lib.add_runtime_dependency 'msgpack'
  lib.add_runtime_dependency 'nori'
  lib.add_runtime_dependency 'nokogiri'
end
