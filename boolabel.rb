module Boolabel
  extend ActiveSupport::Concern

  DEFUALT_I18N_KEY = 'activerecord.boolabel'

  module ClassMethods
    def boolabel(*attributes)
      attributes.each {|attr| define_label_method(attr)}
    end

    def define_label_method(attr_name)
      define_method "#{attr_name.to_s}_label" do
        i18n_key = [DEFUALT_I18N_KEY,
                    self.class.name.underscore.tr('/','.'),
                    attr_name.to_s].join(".")

        trans = I18n.t(i18n_key)
        trans[self.send(attr_name) ? 0 : 1]
      end

      define_method "#{attr_name.to_s}!" do
        self.send("#{attr_name.to_s}=", true)
      end
    end
  end
end

