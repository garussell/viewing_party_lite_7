require 'rails_helper'

RSpec.describe "users movies show page" do
  before do
    @user_1 = User.create!(name: "Ringo", email: "ringo@gmail.com")
    @movie = Movie.create!(
      title: "Batman", 
      vote_average: 8, 
      runtime: 90, 
      genre: ["Action"], 
      overview: "A man and a bat", 
      top_10: [
        {"bob" => "beard man"},
        {"fred" => "the cheato tiger"},
        {"jill" => "a stray moose"},
        {"tim" => "bob's puppet"},
        {"nancy" => "nancy reagan"},
        {"arron" => "extra #1"},
        {"dolly" => "random drunk"},
        {"nick" => "CEO of windex"},
        {"bill" => "bill"},
        {"sue" => "karen"}
      ], 
      total_reviews: 122, 
      review_authors: "trollsalot",
      user_id: @user_1.id)

      visit user_movie_path(@user_1, @movie)
  end
    
  describe "as a user", :vcr do
    describe "when I visit a movie's detail page (/users/:user_id/movies/:movie_id) - where user_id is valid", vcr: { record: :new_episodes } do
      it "I should see a button to create a viewing party and a button to return to the Discover Page" do
        expect(page).to have_button("Discover Page")
        expect(page).to have_link("Create Viewing Party")
      end

      it "when I click the viewing party button it should take me to the new viewing party page and I should see all the movie details" do
        expect(page).to have_content(@movie.title)
        expect(page).to have_content(@movie.vote_average)
        expect(page).to have_content(@movie.runtime)
        expect(page).to have_content(@movie.genre)
        expect(page).to have_content(@movie.overview)
        expect(page).to have_content(@movie.top_10)
        expect(page).to have_content(@movie.total_reviews)
        expect(page).to have_content(@movie.review_authors)

        click_on "Create Viewing Party" 
        expect(current_path).to eq(new_user_viewing_party_path(@user_1))
      end
    end
  end
end