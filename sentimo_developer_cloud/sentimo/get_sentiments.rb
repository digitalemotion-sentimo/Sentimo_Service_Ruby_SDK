require './sentimo_developer_cloud/sentimo/client'

module Sentimo
  class GetSentiments
    attr_reader :client
    
    # @private
    def initialize(client)
      # @client = client
      @client = Sentimo::Client.new(client)
    end

    # ================================================
    # Retrieve General Sentiment
    # ================================================
    def retrieve_sentiment(dataIds, domains='')
      
      path = 'ar/sentiment/'
      
      if(!domains.nil? && domains != '') 
        path = path + domains.gsub(/,/, '%2C') + '/'
      end

      path = path + dataIds.gsub(/,/, '%2C')
      
      response = @client.get_request(path)
    
    end

    def retrieve_sentiment_set(dataId, domains = '', num = '')
      
      path = 'ar/sentiment/'
      
      if(!domains.nil? && domains != '') 
        path = path  +domains.gsub(/,/, '%2C') + '/start/'
      else 
        path = path + 'start/'
      end

      path = path + dataId

      if(!num.nil? && num != '')
        path = path + '?max=' + num.to_s
      end
 
      response = @client.get_request(path)
    
    end

    # ================================================
    # Retrieve Fined-Grained
    # ================================================
    def retrieve_sentimo(dataIds, domains = '')
      
      path = 'ar/sentimo/'
      
      if(!domains.nil?) 
        # path = path + "domain?=" + domain + '/'
        path = path + domains.gsub(/,/, '%2C') + '/'
      end

      path = path + dataIds.gsub(/,/,'%2C')
      
      response = @client.get_request(path)
    
    end

    def retrieve_sentimo_set(dataId, domains = '', num = '')
      
      path = 'ar/sentimo/'
      
      if(!domains.nil? && domains != '') 
        path = path  +domains.gsub(/,/, '%2C') + '/start/'
      else 
        path = path + 'start/'
      end

      path = path + dataId

      if(!num.nil? && num != '')
        path = path + '?max=' + num.to_s
      end

      response = @client.get_request(path)
    
    end
    
  end
  
end