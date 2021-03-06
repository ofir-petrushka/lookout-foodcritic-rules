require 'rspec'
require 'foodcritic'

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../'))

def foodcritic_run(rule_name)
  fc = FoodCritic::Linter.new

  opts = {
    :include_rules => [File.join(PROJECT_ROOT, 'lib/foodcritic/rules')],
    :tags => [rule_name.upcase]
  }

  cb_path = File.join(PROJECT_ROOT, 'sample_cookbooks', rule_name.downcase)

  fc.check(cb_path, opts)
end

def warnings(fc_run)
  fc_run.warnings.collect { |w| File.basename(w.match[:filename]) }.uniq
end
