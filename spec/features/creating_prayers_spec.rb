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
    
    scenario "A user fails to create a new prayer request" do
        visit "/"
        
        click_link "New Prayer Request"
        
        fill_in "Title", with: ""
        fill_in "Body", with: ""
        
        click_button "Create Prayer Request"
        
        expect(page).to have_content("Prayer request has not been created")
        expect(page).to have_content("Title can't be blank") 
        expect(page).to have_content("Body can't be blank")
    end
        
    end
    
    
end