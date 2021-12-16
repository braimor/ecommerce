RSpec.shared_examples 'have http_status' do
    specify do
        subject

        expect(response).to have_http_status(status)
    end
end
