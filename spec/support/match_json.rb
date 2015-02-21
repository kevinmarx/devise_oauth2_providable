# "{'foo': 'bar'}".should match_json {:foo => :bar}
RSpec::Matchers.define :match_json do |expected|
  match do |actual|
    ActiveSupport::JSON.decode(actual) == expected.with_indifferent_access
  end
end
