require './sentimo_developer_cloud/sentimo/client'
require './sentimo_developer_cloud/sentimo/utils'

module Sentimo
  class AnalyzeOnTheFly
    attr_reader :client

      # @private
      def initialize(client)
        # @client = client
        @client = Sentimo::Client.new(client)
      end

      # ================================================
      # Analyze General Sentiment on the fly
      # ================================================
      def analyze_sentiment_on_the_fly(content, targets = '',domain = '')

        #Convert the target string to string array format
        if(content.class === 'String')
          content = [content]
        end

        utils = Sentimo::Utils.new
        dataset = utils.construct_aoa_data_array(content)

        path = '/aoa/sentiment/analyze/'

        if(!targets.nil? && targets != '')
          path = path + targets.gsub(/,/, '%2C')
        end

        if(!domain.nil? && domain!= '')
            path = path + '?domain=' + domain
        end
        response = @client.post_request(path, dataset)
      
      end

      def analyze_sentiment_full_dataset_on_the_fly(dataset, targets = '', domain ='')

        path = '/aoa/sentiment/analyze/'

        if(!targets.nil? && targets != '')
          path = path + targets.gsub(/,/, '%2C')
        end

        if(!domain.nil? && domain!= '')
            path = path + '?domain=' + domain
        end

        response = @client.post_request(path, dataset)
      end

      # ================================================
      # Analyze Fine-Grained emotions on the fly
      # ================================================      
      def analyze_sentimo_on_the_fly(content, targets = '', domain ='')

        #Convert the target string to string array format
        if(content.class === 'String')
          content = [content]
        end

        utils = Sentimo::Utils.new
        dataset = utils.construct_aoa_data_array(content)

        path = '/aoa/sentimo/analyze/'

        if(!targets.nil? && targets != '')
          path = path + targets.gsub(/,/, '%2C')
        end

        if(!domain.nil? && domain!= '')
            path = path + '?domain=' + domain
        end
        response = @client.post_request(path, dataset)

      end

      def analyze_sentimo_full_dataset_on_the_fly(dataset, targets = '', domain ='')

        path = '/aoa/sentimo/analyze/'

        if(!targets.nil? && targets != '')
          path = path + targets.gsub(/,/, '%2C')
        end

        if(!domain.nil? && domain!= '')
            path = path + '?domain=' + domain
        end

        response = @client.post_request(path, dataset)
      end

  end

end