RSpec.describe Api::ProductsController, type: :controller do

  describe '#collection' do
    before { expect(subject).to receive(:params).and_return(:params) }

    before { expect(Product).to receive(:search_by).with(params) }

    it { expect { subject.send :collection }.to_not raise_error }
  end

end