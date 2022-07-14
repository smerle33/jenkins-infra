require_relative './../spec_helper'

describe 'census' do
  it_behaves_like "a standard Linux machine"

  describe service('apache2') do
    it { expect(subject).to be_enabled }
    it { expect(subject).to be_running }
  end

  describe port(80) do
    it { expect(subject).to be_listening }
  end
end
