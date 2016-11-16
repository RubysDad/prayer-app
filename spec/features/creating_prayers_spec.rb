require "rails_helper"

RSpec.feature "Creating Prayer Requests" do
    scenario "A user creates a new prayer request" do
        visit "/"
        
        click_link "New Prayer Request"
        
        fill_in "Title", with: "Creating a prayer request"
        fill_in "Body", with: "Praise the Lord"
        
        click_button "Create Prayer Request"
        
        
        expect(page).to have_content("Prayer Request has been published")
        expect(page.current_path).to eq(prayers_path)
    end
    
end