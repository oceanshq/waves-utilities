module WavesUtilities
  class Customer
    attr_accessor(
      :id,
      :name,
      :address_1,
      :address_2,
      :address_3,
      :town,
      :county,
      :postcode,
      :country,
      :nationality,
      :email,
      :phone_number,
      :declared_at,
      :registered_customer_id,
      :imo_number,
      :eligibility_status,
      :date_of_incorporation,
      :registration_number,
      :managing_owner,
      :correspondent,
      :shares_held
    )

    def initialize(params = {})
      params.reject! { |param| !respond_to?(param) }
      assign_attributes(params)
    end

    def to_s
      name
    end

    def assign_attributes(params = {})
      params.each { |key, value| instance_variable_set("@#{key}", value) }
    end

    def inline_address
      [
        address_1,
        address_2,
        address_3,
        town,
        postcode,
        country,
      ].compact.reject(&:empty?).join(", ")
    end

    def inline_name_and_address
      "#{name}, #{inline_address}" if name && !inline_address.empty?
    end
  end
end
