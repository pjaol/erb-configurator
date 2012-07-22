require 'test/unit'
require "lib/erb-process.rb"


class TestERBProcess < Test::Unit::TestCase
  def testVersion
    assert_equal '0.1.0', ERBProcess::VERSION
  end
  
  def testTemplate
    result = "host: http://qa.epals.com\nbar: http://qa.foo.com"
    assert_equal result, ERBProcess.process("test/config.yml", "test/example_config.erb", "QA")
  end
end
    