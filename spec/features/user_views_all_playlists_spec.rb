require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see each playlist's name with links" do

    playlist_one, playlist_two = create_list(:playlist, 2)

    visit playlists_path

    expect(page).to have_link playlist_one.name, href: playlist_path(playlist_one)
    expect(page).to have_link playlist_two.name, href: playlist_path(playlist_two)

    click_on playlist_one.name

    expect(page).to have_content playlist_one.name
  end
end
