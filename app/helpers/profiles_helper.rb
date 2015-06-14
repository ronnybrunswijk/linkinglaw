module ProfilesHelper

    def get_profession_options
        [t("labels.profession_options.lawyer"),
         t("labels.profession_options.jurist"), 
         t("labels.profession_options.tax_lawyer"),
         t("labels.profession_options.different")] 
    end

end
