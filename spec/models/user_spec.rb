require 'rails_helper'

describe User, type: :model do
  it { should have_secure_password }
  it { should have_many(:links) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end 