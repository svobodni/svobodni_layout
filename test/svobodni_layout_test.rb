require 'test_helper'

class SvobodniLayoutTest < ActiveSupport::TestCase

  setup do
    @processor = SvobodniLayout::Processor.new
    @processor.external = File.open("./test/fixtures/external.html").read
    # use @processor.fetch for production test
  end

  should "replace placeholders" do
    @processor.title = "Title replacement test"
    @processor.head = "<custom_header_tag/>"
    @processor.breadcrumb = "Home / Test"
    assert_equal File.open("./test/fixtures/processed.html").read, @processor.output
  end

  should "create file and put processed layout template in it" do
    file = mock('file')
    File.expects(:open).with("./thisfile", "w").returns(file)
    file.expects(:write).with(@processor.output)
    file.expects(:close)
    @processor.store("./thisfile")
  end

end
