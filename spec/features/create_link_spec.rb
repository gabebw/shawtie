require "spec_helper"

feature "User creates a link" do
  context "with a URL" do
    scenario "shows them the shortened link" do
      visit "/"
      fill_in "URL", with: "http://example.com"
      click_button "Shorten this URL"

      expect(page).to have_latest_link
    end
  end

  context "without a URL" do
    it "shows them an error message" do
      visit "/"
      click_button "Shorten this URL"

      expect(page).to have_content "You need to give a URL to shorten!"
    end
  end

  def have_latest_link
    have_content "#{page.current_host}/#{latest_link.hash}"
  end

  def latest_link
    Link.all.first(order: "DESC")
  end
end
