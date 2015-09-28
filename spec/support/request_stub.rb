class RequestStub
  def initialize(context)
    @context = context
  end

  def stub_client_request(uri, data)
    headers = {
      'Accept' => '*/*',
      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Content-Type' => 'application/json',
      'User-Agent' => 'Faraday v0.9.1'
    }
    test_api_key = ChimperTestHelper.dummy_api_key
    base_uri = "https://apikey:#{test_api_key}@us9.api.mailchimp.com/3.0"
    @context.stub_request(:get, base_uri + uri).
      with(headers: headers).
      to_return(status: 200, body: JSON.dump(data), headers: {})
  end
end
