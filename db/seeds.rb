#require 'random_data'
require 'faker'

# 50.times do
#   Wiki.create!(
#     title:  RandomData.random_sentence,
#     body:   RandomData.random_paragraph
#   )
# end
# wikis = Wiki.all

# 100.times do
#   Comment.create!(
#     Wiki: wikis.sample,
#     body: RandomData.random_paragraph
#   )
# end

# puts "Seed finished"
# puts "#{Wiki.count} wikis created"
# puts "#{Comment.count} comments created"

# random title and body
4.times do
  Wiki.create!(:title => Faker::Lorem.sentence.capitalize,
    :body => Faker::Lorem.paragraphs(2))

end
