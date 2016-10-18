require 'rails_helper'

RSpec.feature "User visits the artist's show page" do
  scenario "they delete the artist" do
    artist1_name       = "Bob Marley"
    artist1_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(name: artist1_name, image_path: artist1_image_path)

    artist2_name       = "Elvis Presley"
    artist2_image_path = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjn-cO5nuXPAhXkx4MKHV-cDokQjRwIBw&url=https%3A%2F%2Fwww.graceland.com%2Felvis%2Fbiography.aspx&psig=AFQjCNHF4JqcOm3Lxqhj-u8EgYLZRe4jaA&ust=1476910485226796"
    Artist.create(name: artist2_name, image_path: artist2_image_path)

    visit '/artists'

    click_on "#{artist1_name}"
    click_on "Delete"
    save_and_open_page
    expect(page).to_not have_content "Bob Marley"
  end
end
