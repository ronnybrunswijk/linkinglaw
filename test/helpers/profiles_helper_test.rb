require 'test_helper'

class ProfilesHelperTest < ActionView::TestCase
    include ProfilesHelper

    #needich om die 'nomethoderror: undefined method `get' for nil:NilClass' error te foarkommen, sjoch: https://groups.google.com/forum/#!topic/minitest-rails/ITinWb3LdtM
#    def setup
#      @view_flow = ActionView::OutputFlow.new
#    end

    test 'get profession options' do
      
      profession_options = get_profession_options
    
      assert_equal 4, profession_options.size
      assert_equal I18n.t("labels.profession_options.lawyer"), profession_options[0]
      assert_equal I18n.t("labels.profession_options.jurist"), profession_options[1]
      assert_equal I18n.t("labels.profession_options.tax_lawyer"), profession_options[2]
      assert_equal I18n.t("labels.profession_options.different"), profession_options[3]
    end
end
