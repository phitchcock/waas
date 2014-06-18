require 'rails_helper'

describe WikiPolicy do
  describe '#scope' do
    subject { WikiPolicy::Scope.new(user, Wiki).resolve }
    let(:public_wiki) { create(:wiki, pubilc: true) }
    let(:private_wiki) { create(:wiki, pubilc: false) }

    context 'admin user' do
      let(:user) { create(:user, role: 'admin') }
      it { should include(public_wiki) }
      it { should include(private_wiki) }
    end

    context 'non-admin user' do
      let(:user) { create(:user, role: 'guest') }
      it { should include(public_wiki) }
      it { should_not include(private_wiki) }
    end
  end
end
