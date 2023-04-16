require 'rails_helper'

RSpec.describe "header", type: :request do
  before :each do
    render template: 'header'
  end

  describe 'balmoral logo' do
    it 'is displayed' do
      # TODO: test the presence of balmoral_logo image
      expect(rendered).to include('/images/balmoral_logo')
    end

    it 'provides a link to root' do
      expect(rendered.body).to have_link(href: "/")
    end
  end

  context 'user is not logged in' do
    # TODO - check available options (login)
    # TODO - check that there is a burger menu offering a login option
  end

  context 'user is logged in' do
    # TODO - check available options (logout / edit user profile)
    # TODO - check that there is an avatar of the user
    # TODO - check that the avatar is a dropdown menu
    # TODO - check that in the options offered when clicking on the avatar we can logout.
    # TODO - check that in the options offered when clicking on the avatar we can access and edit user profile.
  end
end
end
