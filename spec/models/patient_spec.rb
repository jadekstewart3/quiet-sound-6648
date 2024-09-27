require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "Relationships" do 
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe ".scope" do 
    before :each do
      @hospital = Hospital.create!(name: "Beat Boxpital")
      @doctor_beat = Doctor.create!(name: "Dr. Beat", specialty: "Making sick beats", university: "Dr. Dre's School of hard knocks", hospital: @hospital)
      @kendrick = Patient.create!(name: "Kendrick Lamar", age: 33)
      @odb = Patient.create!(name: "Old Dirty B*st*rd", age: 56)
      @meek = Patient.create!(name: "Meek Mill", age:16)
      DoctorPatient.create!(doctor: @doctor_beat, patient: @kendrick)
      DoctorPatient.create!(doctor: @doctor_beat, patient: @odb)
      DoctorPatient.create!(doctor: @doctor_beat, patient: @meek)
    end

    describe ".over_18" do 
      it "only lists patients who are over the age of 18" do 
        expect(Patient.over_18).to eq([@kendrick, @odb])
      end
    end

    describe ".alphabetical_order" do 
      it "lists patients in alphabetical order" do 
        expect(Patient.alphabetical_order).to eq([@kendrick, @meek, @odb])
      end
    end
  end
end
