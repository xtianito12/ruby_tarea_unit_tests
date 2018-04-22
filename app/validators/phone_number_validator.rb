class PhoneNumberValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        record.errors[attribute] << 'Phone number must start with 9!' unless value.start_with? '9'
    end
end