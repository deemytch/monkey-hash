Gem::Specification.new do |lib|
  lib.name = 'monkey_patches'
  lib.version = '1.0.1'
  lib.date = '2019-11-31'
  lib.summary = 'Различные утилиты для удобства'

  lib.files = %w[
    lib/monkey-patches.rb
  ]
  lib.require_paths = %w[lib]
  lib.authors = %w[
    'Dimitri Pekarovsky'
  ]
  lib.email = 'dimitri@pekarovsky.name'
  lib.licenses    = ['Private']

  lib.add_runtime_dependency 'msgpack'
end
