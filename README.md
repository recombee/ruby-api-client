# RecombeeApiClient

A Ruby client for easy use of the [Recombee](https://www.recombee.com/) recommendation API.

If you don't have an account at Recombee yet, you can create a free account [here](https://www.recombee.com/).

Documentation of the API can be found at [docs.recombee.com](https://docs.recombee.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recombee_api_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install recombee_api_client

## Examples

### Basic example
```ruby
require 'recombee_api_client'
include RecombeeApiClient

client = RecombeeClient('--my-database-id--', '--my-secret-token--')

# Generate some random purchases of items by users
NUM = 100
PROBABILITY_PURCHASED = 0.1

users = (1..NUM).map { |i| "user-#{i}" }
items = (1..NUM).map { |i| "item-#{i}" }
purchases = []

users.each do |user_id|
  purchased = items.select { |_| rand(0.0..1.0) < PROBABILITY_PURCHASED }
  purchased.each { |item_id| purchases.push(

                AddPurchase.new(user_id, item_id,'cascadeCreate' => true)
                                                  # Use cascadeCreate to create the
                                                  # yet non-existing users and items
                )}

end

begin
  # Send the data to Recombee, use Batch for faster processing of larger data
  client.send(Batch.new(purchases))
  
  # Get recommendations for user 'user-25'
  recommended = client.send(RecommendItemsToUser.new('user-25', 5))
  puts "Recommended items for user-25: #{recommended}"
rescue APIError => e
  puts e
  # Use fallback
end
```

### Using property values
```ruby
require 'recombee_api_client'
include RecombeeApiClient

NUM = 100
PROBABILITY_PURCHASED = 0.1

client = RecombeeClient('--my-database-id--', '--my-secret-token--')
client.send(ResetDatabase.new) # Clear everything from the database

# We will use computers as items in this example
# Computers have three properties 
#   - price (floating point number)
#   - number of processor cores (integer number)
#   - description (string)

# Add properties of items
client.send(AddItemProperty.new('price', 'double'))
client.send(AddItemProperty.new('num-cores', 'int'))
client.send(AddItemProperty.new('description', 'string'))
client.send(AddItemProperty.new('time', 'timestamp'))

# Prepare requests for setting a catalog of computers
requests = (1..NUM).map do |i|
  SetItemValues.new(
      "computer-#{i}", #itemId
      #values:
      { 
        'price' => rand(15000.0 .. 25000.0),
        'num-cores' => rand(1..8),
        'description' => 'Great computer',
        'time' => DateTime.now
      },
      #optional parameters:
      {
        'cascadeCreate' => true  # Use cascadeCreate for creating item
                                 # with given itemId, if it doesn't exist
      }
    )
end

# Send catalog to the recommender system
puts client.send(Batch.new(requests))

# Prepare some purchases of items by users
requests = []
(1..NUM).map{|i| "computer-#{i}"}.each do |item_id|
  user_ids = (1..NUM).map{|i| "user-#{i}"}
  user_ids = user_ids.select { |_| rand(0.0..1.0) < PROBABILITY_PURCHASED }
  # Use cascadeCreate to create unexisting users
  user_ids.each { |user_id| requests.push(AddPurchase.new(user_id, item_id, 'cascadeCreate' => true)) }
end

# Send purchases to the recommender system
client.send(Batch.new(requests))

# Get 5 recommendations for user-42, who is currently viewing computer-6
recommended = client.send(RecommendItemsToItem.new('computer-6', 'user-42', 5) )
puts "Recommended items: #{recommended}"

# Recommend only computers that have at least 3 cores
recommended = client.send(
  RecommendItemsToItem.new('computer-6', 'user-42', 5, {'filter' => "'num-cores'>=3"})
  )
puts "Recommended items with at least 3 processor cores: #{recommended}"

# Recommend only items thatare more expensive then currently viewed item (up-sell)
recommended = client.send(
  RecommendItemsToItem.new('computer-6', 'user-42', 5,
    {'filter' => "'price' > context_item[\"price\"]"})
  )
puts "Recommended up-sell items: #{recommended}"
```

### Exception handling

For the sake of brevity, the above examples omit exception handling. However, various exceptions can occur while processing request, for example because of adding an already existing item, submitting interaction of nonexistent user or because of timeout.

We are doing our best to provide the fastest and most reliable service, but production-level applications must implement a fallback solution since errors can always happen. The fallback might be, for example, showing the most popular items from the current category, or not displaying recommendations at all.

Example:
```ruby

begin
  recommended = client.send(
    RecommendItemsToItem.new('computer-6', 'user-42', 5,
    {'filter' => "'price' > context_item[\"price\"]"})
  )
rescue ResponseError => e
  # Handle errorneous request => use fallback
rescue ApiTimeout => e
  # Handle timeout => use fallback
rescue APIError => e
  # APIError is parent of both ResponseError and ApiTimeout
end
```