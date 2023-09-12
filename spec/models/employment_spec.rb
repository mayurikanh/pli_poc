# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employment, type: :model do
  describe 'Employment model' do
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

    context 'checking data createion in database' do
      it 'has personal data' do
        expect(Employment.count).to eq(1)
      end
    end
  end

  context 'checking validation for required data' do
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
      Employment.new(employer:, start_date:, emplyment_end_date:, personal:)
    end

    context 'checking empty first_name' do
      let(:employer)  { '' }
      it 'will not save data' do
        expect(employment).to_not be_valid
      end
    end

    context 'checking empty first_name' do
      let(:start_date)  { Date.today + 1.day }
      it 'will save data' do
        expect(employment).to be_valid
      end
    end

    context 'checking empty first_name' do
      let(:start_date)  { Date.today + 1.day }
      let(:start_date)  { Date.today }
      it 'will save data' do
        expect(employment).to be_valid
      end
    end
  end
end
