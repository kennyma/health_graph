module HealthGraph
  module API
    attr_accessor :access_token
    
    def get(path, accept_header, params = {})
      request(:get, accept_header, path, params)
    end
    
    def post(path, accept_header, params = {})
      request(:post, accept_header, path, params)
    end
    
    def put(path, accept_header, params = {})
      request(:put, accept_header, path, params)
    end
    
    def delete(path, accept_header, params = {}) 
      request(:delete, accept_header, path, params)
    end

    private 
    
    def request(method, accept_header, path, params)
      response = connection.send(method) do |request|
        request.headers['Authorization'] = "Bearer #{access_token}"
        request.headers['Accept'] = accept_header
        
        case method.to_sym
        when :get, :delete
          request.url(path, params)
        when :put, :post
          request.path = path
          request.body = params unless params.empty?
        end        
      end
      response.body
    end
    
    def connection
      merged_options = HealthGraph.faraday_options.merge({
        :url => HealthGraph.endpoint
      })

      Faraday.new(merged_options) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson        
        builder.adapter(HealthGraph.adapter)
      end
    end
  end
end