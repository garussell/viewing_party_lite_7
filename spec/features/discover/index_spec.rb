require 'rails_helper'

RSpec.describe "users discover path" do
  before do
    @user_1 = User.create!(name: "Ringo", email: "ringo@gmail.com")

    visit user_discover_index_path(@user_1)
  end

  describe "as a user" do
    describe "when I visit the /users/:id/discover" do
      it "I should see a button to discover top rated movies and a text field to search" do
        expect(page).to have_button("Find Top Rated Movies")
        expect(page).to have_field(:title)
        expect(page).to have_button("Find Movies")
      end

      it "they should be taken to the movies results page" do
        VCR.use_cassette("top_rated_movies") do
          click_on "Find Top Rated Movies"
          expect(page).to have_current_path(user_movies_path(@user_1))
          expect(page).to have_content("Spider-Man: Across the Spider-Verse")
          expect(page).to have_link("Spider-Man: Across the Spider-Verse")
        end
      end
      
      it "they should be taken to the movies results page" do
        VCR.use_cassette("movie_search") do
          fill_in :title, with: "Star Wars"
          click_on "Find Movies"
          expect(page).to have_content("Star Wars: The Clone Wars")
          expect(page).to have_content("The Star Wars Holiday Special")
          expect(page).to have_link("Star Wars: The Clone Wars")
        end
      end
    end
  end
end