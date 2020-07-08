require 'benchmark'
require 'yaml'

ha = YAML.load_file("settings/cfg.development.yml")
ha['app']['tmout']['token_expiration']['twitter']

n = 5000000
Benchmark.bm do |r|
  r.report { n.times{ ha['app']['tmout']['token_expiration']['twitter'] } }
end
