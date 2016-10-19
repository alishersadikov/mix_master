require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see new playlist name and songs" do
    song_one, song_two, song_three = create_list(:song, 3)

    playlist_one, playlist_two = create_list(:playlist, 2)

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
    #  expect(page).to have_current_path(playlist_path(playlist.id))
  end
end
