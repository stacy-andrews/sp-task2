require "rails_helper"

RSpec.feature "Overrides", :type => :feature do
  scenario "Specify cronut url override will replace the cronuts href" do
    visit "/?cronut_url=https://google.com"

    expect(page).to have_link("cronuts", href: 'https://google.com')
  end

  scenario "Specify donut url override will replace the donuts href" do
    visit "/?donut_url=https://google.com"

    expect(page).to have_link("donuts", href: 'https://google.com')
  end

  scenario "Specify donut url and cronut url overrides will replace the donuts and cronuts href" do
    visit "/?cronut_url=https://google.com&donut_url=https://www.wolframalpha.com"

    expect(page).to have_link("cronuts", href: 'https://google.com')
    expect(page).to have_link("donuts", href: 'https://www.wolframalpha.com')
  end

  scenario "Specifying no overrides will not replace the links" do
    visit "/"

    expect(page).to have_link("cronuts", href: 'https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg')
    expect(page).to have_link("donuts", href: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/250px-Glazed-Donut.jpg')
  end

  scenario "Specifying an override that can cause an xss attack will remove the link" do
    visit "/?cronut_url=javascript:alert('test')&donut_url=javascript:alert('test1')"

    expect(page).to_not have_link("cronuts")
    expect(page).to_not have_link("donuts")
  end
end