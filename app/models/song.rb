class Song < ActiveRecord::Base
  validates(:title, presence: true)
  #scope will make it so release year and artist name can only occur once with title
  validates(:title, uniqueness: { scope: [:release_year, :artist_name], message: "can't repeat same artist in same year"})

  #inclusion will limit the values you can input
  validates(:released, inclusion: {in: [true, false]})
  validates(:artist_name, presence: true)

  #if released is false then release year is optional
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released
end
