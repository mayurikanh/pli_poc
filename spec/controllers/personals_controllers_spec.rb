# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonalsController, type: :controller do
  describe 'PersonalsController#index' do
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:email_address)  { Faker::Internet.email }
    let(:phone_number) { '745-281-3625' }
    let!(:personal) do
      Personal.create!(first_name:, last_name:, email_address:, phone_number:)
    end

    it 'assigns @personal' do
      expect(Personal.last.first_name).to_not eq('')
    end
  end

  describe 'PersonalsController#create' do
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:email_address)  { Faker::Internet.email }
    let(:phone_number) { '745-281-3625' }

    context 'check validation' do
      subject do
        Personal.new(first_name:, last_name:, email_address:, phone_number:)
      end

      it 'first_name must be present' do
        subject.first_name = ''
        expect(subject).not_to be_valid
      end

      it 'last_name must be present' do
        subject.last_name = ''
        expect(subject).not_to be_valid
      end

      it 'email_address must be present' do
        subject.email_address = ''
        expect(subject).not_to be_valid
      end

      it 'email_address should not be invalid' do
        subject.email_address = 'Joy'
        expect(subject).not_to be_valid
      end

      it 'phone_number must be present' do
        subject.phone_number = ''
        expect(subject).not_to be_valid
      end

      it 'phone_number should not be invalid' do
        subject.phone_number = '745281'
        expect(subject).not_to be_valid
      end

      it 'phone_number must be valid' do
        subject.phone_number = '745-281-3625'
        expect(subject).to be_valid
      end
    end
  end
end
