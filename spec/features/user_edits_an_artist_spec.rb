require 'rails_helper'

RSpec.feature "User visits the artist's show page" do
  scenario "they edit the artist name" do
    artist1_name       = "Bob Marley"
    artist1_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(name: artist1_name, image_path: artist1_image_path)

    artist2_name       = "Elvis Presley"
    artist2_image_path = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjn-cO5nuXPAhXkx4MKHV-cDokQjRwIBw&url=https%3A%2F%2Fwww.graceland.com%2Felvis%2Fbiography.aspx&psig=AFQjCNHF4JqcOm3Lxqhj-u8EgYLZRe4jaA&ust=1476910485226796"
    Artist.create(name: artist2_name, image_path: artist2_image_path)

    visit '/artists'

    click_on "#{artist1_name}"
    click_on "Edit"
    fill_in "artist_name", with: "Barack Obama"
    click_on "Update Artist"

    expect(page).to have_content "Barack Obama"
    expect(page).to have_css("img[src=\"#{artist1_image_path}\"]")
  end
end
