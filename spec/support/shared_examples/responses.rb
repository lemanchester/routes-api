
shared_examples_for 'successful response' do

  it 'responds with 200' do
    expect(response.code).to eq '200'
  end

  it "returns the right content type" do
    expect(response.header['Content-Type']).to eq("application/json; charset=utf-8")
  end
end


shared_examples_for 'not found response' do

  it 'responds with 404' do
    expect(response.code).to eq '404'
  end

  it "returns the right content type" do
    expect(response.header['Content-Type']).to eq("application/json; charset=utf-8")
  end

  it "returns the error message" do
    expect(response.body).to include("Couldn't find")
  end
end
