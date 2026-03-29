# Generates 21 realistic properties
require "open-uri"

# 1. Addresses
addresses = [
  ["123 Main St, Denver, CO", 39.7392, -104.9903],
  ["455 Elmwood Ave, Buffalo, NY", 42.8864, -78.8784],
  ["78 Pinecrest Dr, Portland, ME", 43.6591, -70.2568],
  ["902 Maple Ridge Rd, Madison, WI", 43.0731, -89.4012],
  ["14 Brookside Ln, Asheville, NC", 35.5951, -82.5515],
  ["66 Riverbend Way, Boise, ID", 43.6150, -116.2023],
  ["210 Cedar Grove Ct, Richmond, VA", 37.5407, -77.4360],
  ["88 Oak Hollow Rd, Nashville, TN", 36.1627, -86.7816],
  ["501 Lakeview Blvd, Minneapolis, MN", 44.9778, -93.2650],
  ["32 Willow Creek Rd, Austin, TX", 30.2672, -97.7431],
  ["19 Orchard Hill Dr, Burlington, VT", 44.4759, -73.2121],
  ["742 Evergreen Terrace, Springfield, IL", 39.7817, -89.6501],
  ["301 Summit Ridge Rd, Boulder, CO", 40.01499, -105.2705],
  ["55 Meadowbrook Ln, Ann Arbor, MI", 42.2808, -83.7430],
  ["120 Redwood Pass, Santa Rosa, CA", 38.4405, -122.7144],
  ["77 Harbor Point Dr, Charleston, SC", 32.7765, -79.9311],
  ["14 Birchwood Ct, Madison, CT", 41.2795, -72.5982],
  ["900 Crestview Dr, Spokane, WA", 47.6588, -117.4260],
  ["44 Sunrise Hill Rd, Burlington, NC", 36.0957, -79.4378],
  ["210 Lakeshore Dr, Cleveland, OH", 41.4993, -81.6944],
  ["18 Forest Glen Rd, Rochester, NY", 43.1566, -77.6088]
]

# 2. Descriptions
descriptions = [
  "Beautifully updated home with modern finishes and a spacious open layout.",
  "Cozy property in a quiet neighborhood, perfect for families or first-time buyers.",
  "Bright and airy home with large windows and a private backyard.",
  "Recently renovated kitchen, hardwood floors, and a finished basement.",
  "Charming property with character, close to parks and local amenities.",
  "Move-in ready home with fresh paint, new appliances, and a fenced yard.",
  "Stylish modern home with an open concept and plenty of natural light.",
  "Well-maintained property with a large deck and scenic views.",
  "Perfect blend of comfort and convenience in a desirable neighborhood.",
  "Spacious home with a two-car garage and updated bathrooms.",
  "Quiet cul-de-sac location with mature trees and a private patio.",
  "Classic home with timeless design and thoughtful upgrades throughout.",
  "Ideal for entertaining with an open floor plan and large kitchen island.",
  "Bright home with vaulted ceilings and a beautifully landscaped yard.",
  "Updated property with energy-efficient windows and new flooring.",
  "Charming bungalow with a covered porch and cozy interior.",
  "Large backyard perfect for pets, gardening, or outdoor gatherings.",
  "Modern upgrades throughout, including lighting, fixtures, and flooring.",
  "Warm and inviting home with a fireplace and spacious living room.",
  "Turnkey property with excellent curb appeal and a functional layout.",
  "A perfect blend of style, comfort, and location."
]

# 3. Create Properties
puts "Creating 21 properties..."

addresses.each_with_index do |(address, lat, lng), i|
  Property.create!(
    title: "Property #{i + 1}",
    price: rand(250_000..1_200_000),
    bedrooms: rand(1..5),
    bathrooms: rand(1..4),
    address: address,
    latitude: lat,
    longitude: lng,
    description: descriptions.sample
  )
end

puts "Done! Created 21 properties."

# 4. Property Images
PROPERTY_IMAGES = [
  "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/1643383/pexels-photo-1643383.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/2102587/pexels-photo-2102587.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259600/pexels-photo-259600.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259802/pexels-photo-259802.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259803/pexels-photo-259803.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/276724/pexels-photo-276724.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259962/pexels-photo-259962.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259580/pexels-photo-259580.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259618/pexels-photo-259618.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/534151/pexels-photo-534151.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259601/pexels-photo-259601.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259604/pexels-photo-259604.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259606/pexels-photo-259606.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259607/pexels-photo-259607.jpeg?auto=compress&cs=tinysrgb&w=1200",
  "https://images.pexels.com/photos/259609/pexels-photo-259609.jpeg?auto=compress&cs=tinysrgb&w=1200"
]

# 5. Attach Photos
puts "Attaching photos to properties..."

Property.order(:id).each_with_index do |property, index|
  image_url = PROPERTY_IMAGES[index]

  file = URI.open(image_url)
  property.photos.attach(
    io: file,
    filename: "property_#{index + 1}.jpg",
    content_type: "image/jpeg"
  )

  puts "Attached photo to #{property.title}"
end

puts "Done attaching property photos!"