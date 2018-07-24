require './sentimo_developer_cloud/sentimo/client'
require './sentimo_developer_cloud/sentimo/utils'

module Sentimo
    class SecuredUpload
        attr_reader :client

        def initialize(client)
            # @client = client
            @client = Sentimo::Client.new(client)
        end

        # ===========================================
        # Upload Data to Server
        # ===========================================
        def upload_data(content)

            if(content.class === 'String')
                content = [content]
            end

            utils = Sentimo::Utils.new
            data = utils.construct_upload_dataset(content)

            path = '/upload'
            response = @client.post_request(path, data)

        end

        def upload_full_dataset(data)
            path = '/upload'
            response = @client.post_request(path, data)
        end

    end
end