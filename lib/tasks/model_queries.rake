namespace :db do
  task :populate_fake_data => :environment do
    # If you are curious, you may check out the file
    # RAILS_ROOT/test/factories.rb to see how fake
    # model data is created using the Faker and
    # FactoryBot gems.
    puts "Populating database"
    # 10 event venues is reasonable...
    create_list(:event_venue, 10)
    # 50 customers with orders should be alright
    create_list(:customer_with_orders, 50)
    # You may try increasing the number of events:
    create_list(:event_with_ticket_types_and_tickets, 3)
  end
  task :model_queries => :environment do
    # Sample query: Get the names of the events available and print them out.
    # Always print out a title for your query
    puts("Query 0: Sample query; show the names of the events available")
    result = Event.select(:name).distinct.map { |x| x.name }
    puts(result)
    puts("EOQ") # End Of Query -- always add this line after a query.

    puts("Query 1: total number of tickets bought by a given customer. (default customer id: 2)")
    result = Customer.find(2).tickets.count
    puts(result)
    puts("EOQ")

    puts("Query 2: total number of different events that a given customer has attended. (default customer id: 2)")
    result = Customer.find(2).tickets.distinct.map { |x| x.ticket_type.event_id }.uniq.count
    puts(result)
    puts("EOQ")

    puts("Query 3: total number of different events that a given customer has attended. (default customer id: 2)")
    result =
    puts(result)
    puts("EOQ")


  end
end