RSpec.shared_examples 'signed in examples' do
    it 'makes the request' do
      subject
  
      expect(response).to have_http_status(200)
    end
end
