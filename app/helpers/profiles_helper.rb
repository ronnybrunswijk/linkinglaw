module ProfilesHelper

    def get_profession_options
        [t("labels.profession_options.lawyer"),
         t("labels.profession_options.jurist"), 
         t("labels.profession_options.tax_lawyer"),
         t("labels.profession_options.different")] 
    end
    
    def get_years_of_work_experience_options
        options = {"N.v.t." => 0}
        (1..100).each{ |year| options[year] = year }
        options
    end 

    def get_year_of_inauguration_options
        options = {"N.v.t." => nil}
        (1930..Date.current.year).reverse_each{ |year| options[year] = year  } 
        options
    end

end
