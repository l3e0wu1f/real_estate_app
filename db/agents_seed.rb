# Creates 6 realistic real estate agent profiles

agents = [
  {
    fullname: "Samantha Keller",
    phone: "303-555-1822",
    bio: "Specializes in luxury homes and downtown condos with 12 years of experience.",
    photo_url: "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=800"
  },
  {
    fullname: "Marcus Delgado",
    phone: "720-555-4419",
    bio: "Known for exceptional negotiation skills and deep knowledge of suburban markets.",
    photo_url: "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=800"
  },
  {
    fullname: "Alyssa Chen",
    phone: "415-555-9033",
    bio: "Helps first-time buyers navigate the market with confidence and clarity.",
    photo_url: "https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&w=800"
  },
  {
    fullname: "David Morales",
    phone: "646-555-7721",
    bio: "Expert in investment properties and multi-unit residential buildings.",
    photo_url: "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=800"
  },
  {
    fullname: "Rachel Thompson",
    phone: "512-555-1188",
    bio: "Friendly, detail-oriented agent with a passion for historic homes.",
    photo_url: "https://images.pexels.com/photos/1181686/pexels-photo-1181686.jpeg?auto=compress&cs=tinysrgb&w=800"
  },
  {
    fullname: "Ethan Brooks",
    phone: "720-555-3344",
    bio: "Former contractor who brings construction insight to every transaction.",
    photo_url: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=800"
  }
]

puts "Creating 6 agents..."

agents.each do |agent|
  Agent.create!(
    fullname: agent[:fullname],
    phone: agent[:phone],
    bio: agent[:bio],
    photo_url: agent[:photo_url]
  )
end

puts "Done! Created 6 agents."