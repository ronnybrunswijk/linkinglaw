require 'test_helper'

class ProfilesHelperTest < ActionView::TestCase
    include ProfilesHelper

    #needich om die 'nomethoderror: undefined method `get' for nil:NilClass' error te foarkommen, sjoch: https://groups.google.com/forum/#!topic/minitest-rails/ITinWb3LdtM
#    def setup
#      @view_flow = ActionView::OutputFlow.new
#    end

    test 'get profession options' do
      
      options = get_profession_options
    
      assert_equal 4, options.size
      assert_equal I18n.t("labels.profession_options.lawyer"), options[0]
      assert_equal I18n.t("labels.profession_options.jurist"), options[1]
      assert_equal I18n.t("labels.profession_options.tax_lawyer"), options[2]
      assert_equal I18n.t("labels.profession_options.different"), options[3]
    end
    
    test 'get years of work experience options' do
       
       options = get_years_of_work_experience_options
       
       assert_equal 101, options.size
       assert_equal ["N.v.t.",0], options.first
       assert_equal 100, options.values.last
    end
end
