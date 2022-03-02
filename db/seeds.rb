puts "Creating companies..."

Company.delete_all
Dev.delete_all
Freebie.delete_all

5.times do
    company = Company.create(
        name: ["Google", "Facebook", "Dunder Mifflin", "Enron"].sample,
        founding_year: [1998, 2004, 2002, 1995].sample
    )

    dev = Dev.create(
        name: ["Rick", "Morty", "Mr. Meseeks", "Gazorpazop"].sample,
    )

    3.times do 
        freebie = Freebie.create(
            company_id: company.id,
            dev_id: dev.id,
            item_name: ["item1", "item2", "item3"].sample,
            value: [10, 5, 20, 15].sample
        )
    end
end

puts "Seeding done!"
