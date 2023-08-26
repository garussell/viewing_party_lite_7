# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users movies show page', :vcr do
  before do
    @user_1 = User.create!(name: 'Ringo', email: 'ringo@gmail.com')

    @movie_data = {
      id: 268,
      title: 'Batman',
      vote_average: 7.214,
      runtime: '2h 6min',
      genre: 'Fantasy, Fiction, Crime',
      overview: "Batman must face his most ruthless nemesis when a deformed madman calling himself 'The Joker' seizes control of Gotham's criminal underworld.",
      top_10: "Michael Keaton as Bruce Wayne / Batman
      Jack Nicholson as Jack Napier / The Joker
      Kim Basinger as Vicki Vale
      Michael Gough as Alfred Pennyworth
      Jerry Hall as Alicia Grissom
      Robert Wuhl as Alexander Knox
      Pat Hingle as Commissioner James Gordon
      Billy Dee Williams as Harvey Dent
      Jack Palance as Carl Grissom
      Tracey Walter as Bob the Goon",
      total_reviews: 7,
      review_authors: 'John Chard',
      user_id: @user_1.id
    }

    movie_facade_instance = MovieFacade.new('Batman')
    allow(movie_facade_instance).to receive(:get_search_movies).and_return(@movie_data)
    allow(MovieFacade).to receive(:new).and_return(movie_facade_instance)

    visit user_movie_path(@user_1, @movie_data[:id])
  end

  describe 'as a user' do
    describe "when I visit a movie's detail page (/users/:user_id/movies/:movie_id) - where user_id is valid" do
      it 'I should see a button to create a viewing party and a button to return to the Discover Page' do
        expect(page).to have_button('Discover Page')
        expect(page).to have_link('Create Viewing Party')
      end

      it 'when I click the viewing party button it should take me to the new viewing party page and I should see all the movie details' do
        expect(page).to have_content('Batman')
        expect(page).to have_content(7.214)
        expect(page).to have_content('2h 6min')
        expect(page).to have_content('Genre')
        expect(page).to have_content('Summary')
        expect(page).to have_content('Cast and Characters')
        expect(page).to have_content('7 Reviews')
        expect(page).to have_content('Review Authors')

        click_on 'Create Viewing Party'
        expect(current_path).to eq(new_user_viewing_party_path(@user_1))
      end
    end
  end
end
