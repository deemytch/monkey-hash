require 'benchmark'
require 'yaml'
require_relative '../lib/hash'

ha = YAML.load_file("settings/cfg.development.yml")

n = 5000000
Benchmark.bm do |r|
  r.report { n.times{ ha['app']['tmout']['token_expiration']['twitter'] } }
  r.report { n.times{ ha.app.tmout.token_expiration.twitter } }
end
