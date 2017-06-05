require 'rails_helper'

describe Link, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
end