ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../../config/environment', __FILE__)
require 'rails/test_help'


class PhoneValidatorTest < ActiveSupport::TestCase
  test "well formatted phone number should be valid" do
    subject = ValidatorTest::ValidableEntityPhone.new('949071584')
    assert subject.valid?
  end

  test "phone number not starting with 9 should not be valid" do
    subject = ValidatorTest::ValidableEntityPhone.new('812345678')
    assert subject.invalid?
  end

end