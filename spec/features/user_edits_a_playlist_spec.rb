require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see new playlist name and songs" do
    song_one, song_two, song_three = create_list(:song, 3)

    # playlist_one, playlist_two = create(:playlist, 2)

    playlist_name = "My Jams"

    visit playlists_path

    click_on "New playlist"
    fill_in "playlist_name", with: playlist_name
    check("song-#{song_one.id}")
    check("song-#{song_three.id}")
    click_on "Create Playlist"

    visit playlists_path

    click_on playlist_name

    click_on "Edit"

    check("song-#{song_two.id}")

    uncheck("song-#{song_one.id}")

    click_on "Update Playlist"

    expect(page).to have_content(song_two.title)
    expect(page).to_not have_content(song_one.title)
     expect(page).to have_current_path(playlist_path(playlist.id))


    # save_and_open_page


    # expect(page).to have_content playlist_name
    #
    # within("li:first") do
    #   expect(page).to have_link song_one.title, href: song_path(song_one)
    # end
    #
    # within("li:last") do
    #   expect(page).to have_link song_three.title, href: song_path(song_three)
    # end


    # expect(page).to have_link playlist_one.name, href: playlist_path(playlist_one)
    # expect(page).to have_link playlist_two.name, href: playlist_path(playlist_two)
    #
    #
    # expect(page).to have_content playlist_one.name
  end

#   As a user
# Given that a playlist and songs exist in the database
# When I visit that playlist's show page
# And I click on "Edit"
# And I enter a new playlist name
# And I select an additional song
# And I uncheck an existing song
# And I click on "Update Playlist"
# Then I should see the playlist's updated name
# And I should see the name of the newly added song
# And I should not see the name of the removed song
end
