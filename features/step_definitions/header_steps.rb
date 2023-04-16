When(/^I visit the root page$/) do
  visit root_path
end

Then(/^I can see header$/) do
  # expect(page).to have_content("header")
  expect(page).to have_link('Login')
  # expect(page).to include('/images/balmoral_logo')
end
