Gem::Specification.new do |lib|
  lib.name = 'monkey-hash'
  lib.version = '1.0.6'
  lib.date = '2019-12-02'
  lib.summary = 'Simple additions for standard classes.'

  lib.files = Dir['lib/*.rb']
  lib.require_paths = %w[lib]
  lib.authors = %w[
    'Dimitri Pekarovsky'
  ]
  lib.email = 'aspamkiller@yandex.ru'
  lib.licenses    = ['GPLv2']

  lib.add_runtime_dependency 'msgpack'
end
