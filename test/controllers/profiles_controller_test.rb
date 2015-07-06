require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    def setup
        DatabaseCleaner.start
        @lawyer = FactoryGirl.create(:lawyer)
        @aansprakelijkheidsrecht = FactoryGirl.create(:aansprakelijkheidsrecht)
        @arbeids_en_pensioenrecht = FactoryGirl.create(:arbeids_en_pensioenrecht)
        sign_in @lawyer
    end

    def teardown 
        DatabaseCleaner.clean    
    end

    test 'lawyer adds practice areas to his profile' do
        profile = @lawyer.profile
        assert_empty profile.practice_areas
        
        put :update, id: profile.id, profile: {
                                                practice_area_ids: [@aansprakelijkheidsrecht.id, 
                                                                    @arbeids_en_pensioenrecht.id] 
                                              }
        
        @lawyer.reload
        practice_areas = @lawyer.profile.practice_areas
        refute_empty practice_areas
        assert_equal 2, practice_areas.size 

    end
    
    test 'lawyer tries to add non-existent practice area to his profile' do    

        profile = @lawyer.profile
        assert_empty profile.practice_areas
        
        put :update, id: profile.id, profile: {
                                                practice_area_ids: [999999] 
                                              }

        assert I18n.t(:not_found, scope: [:error_messages, :http]), flash[:error]

    end
    
    test 'anonymous user tries to update a profile' do

        sign_out @lawyer

        put :update, id: @lawyer.profile.id, profile: {
                                                practice_area_ids: [@aansprakelijkheidsrecht.id] 
                                              }
        assert_redirected_to new_user_session_path
        assert_equal I18n.t(:unauthenticated, scope: [:devise, :failure]), flash[:alert]        

    end 

    test 'entrepreneur tries to update a profile' do

        entrepreneur = FactoryGirl.create(:entrepreneur)
        sign_in entrepreneur
        
        put :update, id: @lawyer.profile.id, profile: {
                                                practice_area_ids: [@aansprakelijkheidsrecht.id] 
                                              }
        assert_redirected_to root_path
        assert_equal I18n.t(:unauthorized, scope: [:devise, :failure], user_type: entrepreneur.role), flash[:alert]        

    end 

    test 'admin tries to update a profile' do

        admin = FactoryGirl.create(:admin)
        sign_in admin
        
        put :update, id: @lawyer.profile.id, profile: {
                                                practice_area_ids: [@aansprakelijkheidsrecht.id] 
                                              }
        assert_redirected_to root_path
        assert_equal I18n.t(:unauthorized, scope: [:devise, :failure], user_type: admin.role), flash[:alert]        

    end 
    
    test "lawyer can only update his own profile" do

        another_lawyer = FactoryGirl.create(:lawyer, :abraham_lincoln)

        refute_equal @lawyer.profile.id, another_lawyer.profile.id
        assert_equal 0, @lawyer.profile.practice_areas.size
        
        
        put :update, id: another_lawyer.profile.id, profile: {
                                                practice_area_ids: [@aansprakelijkheidsrecht] 
                                              }

        another_lawyer.reload
        assert_empty another_lawyer.profile.practice_areas
        @lawyer.reload
        assert_equal 1, @lawyer.profile.practice_areas.size
    end 
end
