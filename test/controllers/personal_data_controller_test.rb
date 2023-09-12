# frozen_string_literal: true

require 'test_helper'

class PersonalDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_datum = personal_data(:one)
  end

  test 'should get index' do
    get personal_data_url
    assert_response :success
  end

  test 'should get new' do
    get new_personal_datum_url
    assert_response :success
  end

  test 'should create personal_datum' do
    assert_difference('PersonalDatum.count') do
      post personal_data_url,
           params: { personal_datum: { email_address: @personal_datum.email_address, first_name: @personal_datum.first_name,
                                       last_name: @personal_datum.last_name, nickname: @personal_datum.nickname, phone_number: @personal_datum.phone_number } }
    end

    assert_redirected_to personal_datum_url(PersonalDatum.last)
  end

  test 'should show personal_datum' do
    get personal_datum_url(@personal_datum)
    assert_response :success
  end

  test 'should get edit' do
    get edit_personal_datum_url(@personal_datum)
    assert_response :success
  end

  test 'should update personal_datum' do
    patch personal_datum_url(@personal_datum),
          params: { personal_datum: { email_address: @personal_datum.email_address, first_name: @personal_datum.first_name,
                                      last_name: @personal_datum.last_name, nickname: @personal_datum.nickname, phone_number: @personal_datum.phone_number } }
    assert_redirected_to personal_datum_url(@personal_datum)
  end

  test 'should destroy personal_datum' do
    assert_difference('PersonalDatum.count', -1) do
      delete personal_datum_url(@personal_datum)
    end

    assert_redirected_to personal_data_url
  end
end
