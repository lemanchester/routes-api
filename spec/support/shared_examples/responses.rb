
shared_examples_for 'successful response' do

  it 'responds with 200' do
    expect(response.code).to eq '200'
  end

  it "returns the right content type" do
    expect(response.header['Content-Type']).to eq("application/json; charset=utf-8")
  end
end
