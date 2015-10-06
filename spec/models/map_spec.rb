require 'rails_helper'

RSpec.describe Map, type: :model do

  describe  "Validations" do

    it { expect(subject).to validate_presence_of(:name) }

    it { expect(subject).to validate_uniqueness_of(:name) }
  end

end
