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

client = RecombeeClient.new('--my-database-id--', '--db-private-token--', {:region => 'us-west'})

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
  response = client.send(RecommendItemsToUser.new('user-25', 5))
  puts "Recommended items for user-25: #{response}"

  # User scrolled down - get next 3 recommended items
  response = client.send(RecommendNextItems.new(response['recommId'], 3))
  puts "Next recommended items for user-25: #{response}"

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

client = RecombeeClient.new('--my-database-id--', '--db-private-token--', {:region => 'ap-se'})
client.send(ResetDatabase.new) # Clear everything from the database (asynchronous)

# We will use computers as items in this example
# Computers have five properties 
#   - price (floating point number)
#   - number of processor cores (integer number)
#   - description (string)
#   - date from which it is in stock (timestamp)
#   - image (url of computer's photo)

# Add properties of items
client.send(AddItemProperty.new('price', 'double'))
client.send(AddItemProperty.new('num-cores', 'int'))
client.send(AddItemProperty.new('description', 'string'))
client.send(AddItemProperty.new('in_stock_from', 'timestamp'))
client.send(AddItemProperty.new('image', 'image'))

# Prepare requests for setting a catalog of computers
requests = (1..NUM).map do |i|
  SetItemValues.new(
      "computer-#{i}", #itemId
      #values:
      { 
        'price' => rand(15000.0 .. 25000.0),
        'num-cores' => rand(1..8),
        'description' => 'Great computer',
        'in_stock_from' => DateTime.now,
        'image' => "http://examplesite.com/products/computer-#{i}.jpg"
      },
      #optional parameters:
      {
        :cascade_create => true  # Use cascade_create for creating item
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
  # Use cascade_create to create unexisting users
  user_ids.each { |user_id| requests.push(AddPurchase.new(user_id, item_id, :cascade_create => true)) }
end

# Send purchases to the recommender system
client.send(Batch.new(requests))

# Get 5 recommendations for user-42, who is currently viewing computer-6
# Recommend only computers that have at least 3 cores
recommended = client.send(
  RecommendItemsToItem.new('computer-6', 'user-42', 5, {:filter => "'num-cores'>=3"})
  )
puts "Recommended items with at least 3 processor cores: #{recommended}"

# Recommend only items that are more expensive then currently viewed item (up-sell)
recommended = client.send(
  RecommendItemsToItem.new('computer-6', 'user-42', 5,
    {:filter => "'price' > context_item[\"price\"]"})
  )
puts "Recommended up-sell items: #{recommended}"

# Filters, boosters and other settings can be also set in the Admin UI (admin.recombee.com)
# when scenario is specified
recommended = client.send(
  RecommendItemsToItem.new('computer-6', 'user-42', 5, {:scenario => 'product_detail'})
  )

# Perform personalized full-text search with a user's search query (e.g. 'computers').
matches = client.send(
  SearchItems.new('user-42', 'computers', 5, {:scenario => 'search_top'})
  )
puts "Matched items: #{matches}"
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