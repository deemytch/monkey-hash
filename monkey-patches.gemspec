Gem::Specification.new do |lib|
  lib.name = 'monkey-patches'
  lib.version = '1.0.4'
  lib.date = '2019-11-31'
  lib.summary = 'Simple additions for standard classes.'

  lib.files = %w[
    lib/monkey-patches.rb
  ]
  lib.require_paths = %w[lib]
  lib.authors = %w[
    'Dimitri Pekarovsky'
  ]
  lib.email = 'aspamkiller@yandex.ru'
  lib.licenses    = ['LGPL-3.0-or-later']

  lib.add_runtime_dependency 'msgpack'
end
