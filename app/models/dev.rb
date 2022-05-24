class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.map do |freebie|
            if(freebie.item_name == item_name)
                return true
            else
                return false
            end
        end
    end

    def give_away(dev, freebie)
        if(freebie.id == self.id)
            freebie.update(dev_id: dev.id)
        end
    end
end
