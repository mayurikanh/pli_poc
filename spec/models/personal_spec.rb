# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Personal, type: :model do
  describe 'Personal model' do
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:email_address)  { Faker::Internet.email }
    let(:phone_number) { '745-281-3625' }
    let!(:personal) do
      Personal.create!(first_name:, last_name:, email_address:, phone_number:)
    end

    let(:employer) { Faker::Company.name }
    let(:start_date) { Faker::Date.backward(days: 14) }
    let(:emplyment_end_date) { Faker::Date.forward(days: 23) }
    let!(:employment) do
      Employment.create(employer:, start_date:, emplyment_end_date:, personal:)
    end

    let(:employer1) { Faker::Company.name }
    let(:start_date1) { Faker::Date.backward(days: 20) }
    let(:emplyment_end_date1) { Faker::Date.forward(days: 20) }
    let!(:employment1) do
      Employment.create(employer: employer1, start_date: start_date1, emplyment_end_date: emplyment_end_date1,
                        personal:)
    end

    context 'checking data createion in database' do
      it 'has personal data' do
        expect(Personal.count).to eq(1)
      end

      it 'has many employment' do
        expect(personal.employments.count).to eq(2)
      end
    end
  end

  context 'checking validation for required data' do
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:email_address)  { Faker::Internet.email }
    let(:phone_number) { '745-281-3625' }
    let!(:personal) do
      Personal.new(first_name:, last_name:, email_address:, phone_number:)
    end

    context 'checking empty first_name' do
      let(:first_name)  { '' }
      it 'will not save data' do
        expect(personal).to_not be_valid
      end
    end

    context 'checking empty last_name' do
      let(:last_name) { '' }
      it 'will not save data' do
        expect(personal).to_not be_valid
      end
    end

    context 'checking empty email_address' do
      let(:email_address) { '' }
      it 'will not save data' do
        expect(personal).to_not be_valid
      end
    end

    context 'checking empty phone_number' do
      let(:phone_number) { '' }
      it 'will not save data' do
        expect(personal).to_not be_valid
      end
    end
  end

  context 'checking validation for required data' do
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:email_address)  { Faker::Internet.email }
    let(:phone_number) { '745-281-3625' }
    let!(:personal) do
      Personal.new(first_name:, last_name:, email_address:, phone_number:)
    end

    context 'checking empty email_address' do
      let(:email_address) { 'John' }
      before do
        personal.save
      end
      it 'will not save data' do
        expect(personal).to_not be_valid
      end

      it 'will give error message' do
        expect(personal.errors.first.full_message).to eq("Email address is invalid")
      end
    end

    context 'checking empty phone_number' do
      let(:phone_number) { 'qwerty' }
      before do
        personal.save
      end
      it 'will not save data' do        
        expect(personal).to_not be_valid
      end

      it 'will give error message' do
        expect(personal.errors.first.full_message).to eq("Phone number format should be xxx-xxx-xxxx.")
      end
    end
  end
end
