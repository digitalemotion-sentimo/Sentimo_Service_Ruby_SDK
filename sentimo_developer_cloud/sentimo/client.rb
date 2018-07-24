require './sentimo_developer_cloud/sentimo/exceptions'
require './sentimo_developer_cloud/sentimo/get_sentiments'
require './sentimo_developer_cloud/sentimo/analyze_on_the_fly'
require './sentimo_developer_cloud/sentimo/secured_upload'
# require './config'
require 'rest-client'
require 'json'

module Sentimo
  
  class Client
    attr_reader :base_url
    # attr_reader :headers
    # attr_reader :timeout

    def initialize(options)

      @base_url = options['url']
      @headers = {
        "pid" => options['token'],
        "User-Agent" => "SentiMo-Ruby-SDK/1_0_0",
        "Content-Type" => "application/json" ,
        "Accept" => "application/json"
      }
      @timeout = options['timeout']
    end

    def get_sentiments
      Sentimo::GetSentiments.new(self)
    end

    def analyze_on_the_fly
      Sentimo::AnalyzeOnTheFly.new(self)
    end

    def secured_upload
      Sentimo::SecuredUpload.new(self)
    end

    def get_request(path, *params)
      # begin
        url = @base_url + path
        # response = RestClient.get(url, @headers)
        response = RestClient::Request.execute(
          :url => url,
          :method => :get,
          :headers => @headers,
          :verify_ssl => false
        )
        
        case response.code
        when 200
          JSON.parse(response.body)
        when 400
          raise SentiMoHTTPError, "This call could not be retrieved."
        when 403
          raise SentiMoAuthenticationError, "The authentication fails."
        end
      # rescue StandardError => e
      #   raise SentiMoError, "Failed to connect to SentiMo. Response code: #{e.message}"
      # end
    end
    
    def post_request(path, body, *params)
      # begin
        url = @base_url + path
        # response = RestClient.post(url, body, @headers)
        response = RestClient::Request.execute(
          :url => url,
          :method => :post,
          :payload => body,
          :headers => @headers,
          :verify_ssl => false)
        case response.code
        when 200
          JSON.parse(response.body)
        when 403
          raise SentiMoAuthenticationError, "The authentication fails."
        end
      # rescue StandardError => e
      #   raise SentiMoError, "Failed to connect to SentiMo. Response code: #{e.message}"
      # end
    end
    
  end
end