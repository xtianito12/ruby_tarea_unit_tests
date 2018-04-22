ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../../config/environment', __FILE__)
require 'rails/test_help'

module ValidatorTest
  ValidableEntityEmail = Struct.new(:email) do
    include ActiveModel::Validations

    validates :email, email: true
  end

  ValidableEntityPhone = Struct.new(:phone_number) do
    include ActiveModel::Validations

    validates :phone_number, phone_number: true
  end
end

class EmailValidatorTest < ActiveSupport::TestCase
  test "well formatted email should be valid" do
    subject = ValidatorTest::ValidableEntityEmail.new('valid.email@hotmail.com')
    assert subject.valid?
  end

  test "wrong formatted email should not be valid" do
    subject = ValidatorTest::ValidableEntityEmail.new('invalid.email@hotmailcom.')
    assert subject.invalid?
  end

end