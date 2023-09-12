# frozen_string_literal: true

require 'application_system_test_case'

class PersonalDataTest < ApplicationSystemTestCase
  setup do
    @personal_datum = personal_data(:one)
  end

  test 'visiting the index' do
    visit personal_data_url
    assert_selector 'h1', text: 'Personal data'
  end

  test 'should create personal datum' do
    visit personal_data_url
    click_on 'New personal datum'

    fill_in 'Email address', with: @personal_datum.email_address
    fill_in 'First name', with: @personal_datum.first_name
    fill_in 'Last name', with: @personal_datum.last_name
    fill_in 'Nickname', with: @personal_datum.nickname
    fill_in 'Phone number', with: @personal_datum.phone_number
    click_on 'Create Personal datum'

    assert_text 'Personal datum was successfully created'
    click_on 'Back'
  end

  test 'should update Personal datum' do
    visit personal_datum_url(@personal_datum)
    click_on 'Edit this personal datum', match: :first

    fill_in 'Email address', with: @personal_datum.email_address
    fill_in 'First name', with: @personal_datum.first_name
    fill_in 'Last name', with: @personal_datum.last_name
    fill_in 'Nickname', with: @personal_datum.nickname
    fill_in 'Phone number', with: @personal_datum.phone_number
    click_on 'Update Personal datum'

    assert_text 'Personal datum was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Personal datum' do
    visit personal_datum_url(@personal_datum)
    click_on 'Destroy this personal datum', match: :first

    assert_text 'Personal datum was successfully destroyed'
  end
end
