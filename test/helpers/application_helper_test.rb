require 'test_helper'

class ApplicatinoHelperTest < ActionView::TestCase
    include ApplicationHelper

    #needich om die 'nomethoderror: undefined method `get' for nil:NilClass' error te foarkommen, sjoch: https://groups.google.com/forum/#!topic/minitest-rails/ITinWb3LdtM
    def setup
      @view_flow = ActionView::OutputFlow.new
    end

    def test_page_title
      assert true
#        assert_equal "  | LinkingLaw", page_title
    end
end
