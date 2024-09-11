require "rails_helper"

RSpec.describe "Doctor Show Page", type: :feature do 
  context "As a visitor" do 
    before :each do 
      @hospital = Hospital.create!(name: "Beat Boxpital")
      @doctor_beat = Doctor.create!(name: "Dr. Beat", specialty: "Making sick beats", university: "Dr. Dre's School of hard knocks", hospital: @hospital)
      @kendrick = Patient.create!(name: "Kendrick Lamar", age: 33)
      @odb = Patient.create!(name: "Old Dirty B*st*rd", age: 56)
      DoctorPatient.create!(doctor: @doctor_beat, patient: @kendrick)
      DoctorPatient.create!(doctor: @doctor_beat, patient: @odb)
      visit doctor_path(@doctor_beat)
    end
    context "When I visit the doctor's show page" do 
      it "displays the name of the doctor" do 
        expect(page).to have_content("Dr. Beat")
      end

      it "displays the doctor's specialization" do 
        expect(page).to have_content("Specialty:\nMaking sick beats")
      end

      it "displays the doctor's university" do 
        expect(page).to have_content("University:\nDr. Dre's School of hard knocks")
      end

      it "displays the doctor's hospital" do 
        expect(page).to have_content("Hospital:\nBeat Boxpital")
      end

      it "displays the doctor's patients" do 
        save_and_open_page
        expect(page).to have_content(@kendrick.name)
        expect(page).to have_content(@odb.name)
      end
    end
  end
end