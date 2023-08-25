require 'rails_helper'

RSpec.describe "new viewing party page" do
  before do
    @user_1 = User.create!(name: "Ringo", email: "ringo@gmail.com")
    @movie = Movie.create!(
      title: "Batman", 
      vote_average: 8, 
      runtime: 90, 
      genre: ["Action"], 
      overview: "A man and a bat", 
      top_10: ["bob", "fred", "jill", "tim", "nancy", "arron","dolly", "nick", "bill", "sue"], 
      total_reviews: 122, 
      review_authors: "trollsalot",
      user_id: @user_1.id
    )

    visit new_user_viewing_party_path(@user_1, movie_data: @movie)
  end

  describe "as a user" do
    describe "when I visit the new viewing party page" do
      it "I can fill out a form to create a new viewing party and the form includes movie title, duration, data, start_time, and check_boxes to invite other users", vcr: { record: :new_episodes }  do
        # expect(page).to have_content(@movie.title)
        # expect(page).to have_field(:duration)
        # expect(page).to have_field(:date)
        # expect(page).to have_field(:start_time)
        # expect(page).to have_field(:check_box)
      end
    end
  end
end