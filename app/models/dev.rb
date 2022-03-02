class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        items = self.freebies.filter { |item| item.item_name === item_name }
        items.first ? true : false
    end

    # dev instance, freebie instance
    def give_away(dev, freebie)
        # if my code goes with this understanding:
        # changes the freebie's dev to be the given dev (the dev attribute?);
        # your code should only make the change if the freebie belongs to the dev who's giving it away (self?)
        self.freebies.each do |self_freebie|
            #if self contains freebie
            if self_freebie.item_name == freebie.item_name
                #self should update/re-assign freebie's dev to dev
                freebie.update(dev_id: dev.id)
            end
            # else #do nothing
        end
    end
end
