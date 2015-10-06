require 'rails_helper'

RSpec.describe Route, type: :model do

  describe  "Validations" do

    it { expect(subject).to validate_presence_of(:origin) }
    it { expect(subject).to validate_presence_of(:destination) }
    it { expect(subject).to validate_presence_of(:distance) }
    it { expect(subject).to validate_presence_of(:map) }

  end


end
