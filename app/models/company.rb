class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        # question: is this it? should we be doing something to identify the dev instance?
        Freebie.create(
            company_id: self.id,
            dev_id: dev.id,
            item_name: item_name,
            value: value
        )
    end

    def self.oldest_company
        #Company.select(:founding_year).min doesn't work
        Company.all.minimum(:founding_year)
    end

end
