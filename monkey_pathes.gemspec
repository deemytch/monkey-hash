Gem::Specification.new do |lib|
  lib.name = 'monkey_patches'
  lib.version = '1.0.0'
  lib.date = '2019-11-23'
  lib.summary = 'Различные утилиты для удобства'

  lib.files = %w[
    lib/monkey-patches.rb
  ]
  lib.require_paths = %w[lib]
  lib.authors = %w[
    'Dimitri Pekarovsky'
  ]
  lib.email = 'dimitri@pekarovsky.name'
  lib.metadata = { source_code_uri: 'git@gitlab.sudo.su:amqp-lib/monkey_patches.git' }
  lib.licenses    = ['Private']
end
