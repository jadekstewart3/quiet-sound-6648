require "rails_helper"

RSpec.describe type: :feature do 
  context "As a visitor" do 
    before :each do 
      @hospital = Hospital.create(name: "Beat Boxpital")
      @doctor_beat = Doctor.create(name: "Dr. Beat", specialty: "Making sick beats", university: "Dr. Dre's School of hard knocks", hospital: @hospital)
      visit doctor_path(@doctor_beat)
    end
    context "When I visit the doctor's show page" do 
      it "displays the name of the doctor" do 
        expect(page).to have_content("Dr. Beat")
      end
    end
  end
end