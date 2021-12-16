RSpec.shared_examples 'not signed in examples' do
    it 'returns an unauthorized error' do
      subject
  
      expect(response).to have_http_status(:bad_request)
    end
end
