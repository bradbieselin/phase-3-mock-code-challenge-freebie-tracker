class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        id = dev.id
        newFreebie = Freebie.new(item_name: item_name, value: value, dev_id: id, company_id: self.id)
    end

    def self.oldest_company
        self.order(:founding_year).first
    end
end
