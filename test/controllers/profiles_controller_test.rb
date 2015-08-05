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

    test 'lawyer updates his profile' do
        profile = @lawyer.profile
        assert_empty profile.practice_areas
        
        avatar_url = "https://linkinglaw-assets-dev.s3.amazonaws.com//uploads/avatars/ccbf953f-5a2f-447b-b626-cbf783e1f52f/image.jpg"
        practice_areas = [@aansprakelijkheidsrecht, @arbeids_en_pensioenrecht]


        put :update, id: profile.id, profile: {
                                                practice_area_ids: practice_areas.map(&:id),
                                                avatar_url: avatar_url
                                              }
        
        @lawyer.reload
        profile = @lawyer.profile
        assert_equal practice_areas.sort, profile.practice_areas.sort
        assert_equal avatar_url, profile.avatar_url

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
    
    test 'entrepreneur visits search page' do
       
        entrepreneur = FactoryGirl.create(:entrepreneur)
        sign_in entrepreneur
       
        get :index

        assert_template :index

        profiles = assigns(:profiles) 
        refute_empty profiles
        #TODO gewoan arrays fergelykje is fansels better (dus assert_equal Profile.all, profiles). Derfoar moast eerst equals as sa ymplementere ljiuw'k        
        assert_equal Profile.all.size, profiles.size
        assert_equal Profile.all.first.id, profiles.first.id
       
    end

    test 'visitor searches for a lawyer without specifying search criteria' do
        
        sign_out @lawyer
        
        get :search
        
        profiles = assigns(:profiles)
        refute_empty profiles
        #TODO gewoan arrays fergelykje is fansels better (dus assert_equal Profile.all, profiles). Derfoar moast eerst equals as sa ymplementere ljiuw'k
        assert_equal Profile.all.size, profiles.size        
        assert_equal Profile.all.first.id, profiles.first.id
    end

    test 'visitor searches for a lawyer by region' do
        
        sign_out @lawyer
        
        FactoryGirl.create(:profile, :from_drenthe)
        expected_profile = FactoryGirl.create(:profile, :from_groningen)
    
        criteria = {province_id: expected_profile.address.province_id}
        
        get :search, criteria
        
        profiles = assigns(:profiles)
        refute_empty profiles
        assert_equal [expected_profile], profiles
    end

    test 'visitor searches for a lawyer by practice area' do
        
        sign_out @lawyer
        
        FactoryGirl.create(:profile, :with_aansprakelijkheidsrecht)
        expected_profile = FactoryGirl.create(:profile, :with_contractenrecht)
    
        criteria = {practice_area_id: expected_profile.practice_areas.first.id}
      
        get :search, criteria
        
        profiles = assigns(:profiles)
        refute_empty profiles
        assert_equal [expected_profile], profiles
    end

    test 'visitor searches for a lawyer by practice area and region' do
        
        sign_out @lawyer

        FactoryGirl.create(:profile, :from_drenthe, :with_contractenrecht)
        expected_profile = FactoryGirl.create(:profile, :from_groningen, :with_aansprakelijkheidsrecht)
        
        criteria = {practice_area_id: expected_profile.practice_areas.first.id,
                    province_id: expected_profile.address.province_id}
        
        get :search, criteria
        
        actual_profiles = assigns(:profiles)
        refute_empty actual_profiles
        assert_equal [expected_profile], actual_profiles
    end

    
end
