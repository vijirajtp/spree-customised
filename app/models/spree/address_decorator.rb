Spree::Address.class_eval do

	def self.default
    country = Spree::Country.find_by_id(Spree::Config[:default_country_id])
    new :country_id => country.try(:id) || Spree::Country.find_by_iso("USA").id
  end

end