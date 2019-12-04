Gem::Specification.new do |lib|

  lib.name          = 'monkey-hash'
  lib.version       = '1.0.8 '
  lib.date          = '2019-12-03'
  lib.summary       = 'Simple additions for standard classes.'
  lib.files         = Dir['lib/*.rb']
  lib.require_paths = %w[lib]
  lib.authors       = %w[ 'deemytch' ]
  lib.email         = 'aspamkiller@yandex.ru'
  lib.licenses      = ['GPL-2.0']
  lib.homepage      = 'https://github.com/deemytch/monkey-hash'
  lib.add_runtime_dependency 'msgpack'
  
end
