require 'rails_helper'

RSpec.describe Route, type: :model do

  describe  "Validations" do

    [:origin, :destination, :distance, :map].each do |attribute|
      it { expect(subject).to validate_presence_of(attribute) }
    end

  end


end
