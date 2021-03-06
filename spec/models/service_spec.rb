require 'rails_helper'

RSpec.describe Service, type: :model do
  context 'with valid attributes'do
    it 'has one address' do
      service = FactoryGirl.create(:service)
      expect(service).to have_one(:address)
    end

    it 'properly saves address in user attributes' do
      service = FactoryGirl.create(:service)
      expect(service.address).not_to be_nil
    end
  end

  context 'with invalid attributes' do
    it 'does not create service without subarea' do
      service = FactoryGirl.build(:service_without_subarea)
      expect(service).to be_invalid
    end

    it 'does not create service without address' do
      service = FactoryGirl.build(:service_without_address)
      expect(service).to be_invalid
    end

    it 'does not create service without name' do
      service = FactoryGirl.build(:service, name: nil)
      expect(service).to be_invalid
    end

    it 'does not create service without description' do
      service = FactoryGirl.build(:service, description: nil)
      expect(service).to be_invalid
    end
  end

  describe '#owner' do
    it 'is a sugar for User.preferred_name' do
      user = create(:user, civil_name: '', social_name: 'social name')
      service = build(:service, user: user)
      expect(user).to receive(:preferred_name)
      service.owner
    end
  end
end
