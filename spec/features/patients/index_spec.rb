require "rails_helper"

RSpec.describe "Patient's Show Page" do 
  context "As a visitor" do 
    before :each do 
      @hospital = Hospital.create!(name: "Beat Boxpital")
      @doctor_beat = Doctor.create!(name: "Dr. Beat", specialty: "Making sick beats", university: "Dr. Dre's School of hard knocks", hospital: @hospital)
      @doctor_scratch = Doctor.create!(name: "Dr. Scratch", specialty: "Scratchin' up a storm", university: "Dr. Dre's School of hard knocks", hospital: @hospital)
      @kendrick = Patient.create!(name: "Kendrick Lamar", age: 33)
      @odb = Patient.create!(name: "Old Dirty B*st*rd", age: 56)
      @megan = Patient.create!(name: "Megan Thee Stallion", age: 17)
      DoctorPatient.create!(doctor: @doctor_beat, patient: @kendrick)
      DoctorPatient.create!(doctor: @doctor_scratch, patient: @kendrick)
      DoctorPatient.create!(doctor: @doctor_beat, patient: @odb)
      visit patients_path
    end
     context "When I visit the patient's show page" do 
      it "displays the names of every patient over the age of 18 in alphabetical order" do 
        expect(@kendrick.name).to appear_before(@odb.name) 
        expect(page).to_not have_content(@megan.name)
      end
     end
  end
end