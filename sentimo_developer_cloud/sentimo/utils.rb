require 'time'

module Sentimo
    class Utils
        def initialize()
        end

        def construct_aoa_data_array(content, title = '', data_type = '', user_id = '', screen_name = '', post_count = '', 
            post_time = '',msg_from = '', url = '', source = '')

            # :param content: analysis content to input
            # :type  content: str/[str] 
            #
            # :param title: title of the content
            # :type  title: str

            # :param data_type: the type of input data 
            # :type  data_type: str

            # :param user_id: the user_id of the input information 
            # :type  user_id: str

            # :param screen_name: the display of user name in webstie
            # :type  screen_name: str

            # :param post_count: the total count number of target user's post
            # :type  post_count: str

            # :param post_time: the post time of input data
            # :type  post_time: str

            # :param msg_from: the origin source of input data if the content is not originated
            # :type  msg_from: str

            # :param url: the base url to retrive the information
            # :type  url: str

            # :param source: the source of soical platform
            # :type  source: str

            # example: /sentimo_developer_cloud/examples/AnalyzeOvertheAir.py

            if(title.nil?||title =='')
                title = 'defalut'
            end
            if(data_type.nil?|| data_type =='')
                data_type = 'defalut'
            end
            if(user_id.nil? || user_id =='')
                user_id = 'defalut'
            end
            if(source.nil? || source == '')
                source = 'defalut'
            end
            if(screen_name.nil? || screen_name =='')
                screen_name = 'defalut'
            end
            if(post_count.nil? || post_count == '')
                post_count = 'defalut'
            end
            if(post_time.nil? || post_time == '')
                now = Time.new
                post_time = now.strftime('%Y-%m-%dT%H:%M:%S')
            end
            if(msg_from.nil? || msg_from == '')
                msg_from = 'defalut'
            end
            if(url.nil? || url =='')
                url = 'defalut'
            end

            params = []

            for i in content
                param = construct_aoa_data(i, title, data_type, user_id, screen_name, post_count, post_time, msg_from, url, source)
                params.push(param)
            end

            data_str = params.to_json

        end

        def construct_aoa_data(content, title , data_type, user_id , screen_name , post_count , post_time ,msg_from , url , source )
        # def construct_aoa_data(content, *args)


            
            param = {'title' => title,
                    'type' => data_type , 
                    'user_id' => user_id,
                    'source'=> source,
                    'screen_name' => screen_name,
                    'userjoindate' => 0,
                    'postcount' => post_count,
                    'post_time' => post_time,
                    'post_id'=> "default",
                    'content' => content,
                    'reply_to_post_id'=> "-",
                    'reply_to_uid'=> "-",
                    'msg_from'=> msg_from,
                    'likes' => 0,
                    'url' => url}

        end

        def construct_upload_dataset(content, post_id= '', source = '', user_id = '', post_time = '')

            params = []

            for i in content

                if(post_id.nil? || post_id =='')
                    post_id = 'default'
                end
                if(source.nil? || source == '')
                    source = 'default'
                end
                if(user_id.nil? || user_id == '')
                    user_id = 'default'
                end
                if(post_time.nil? || post_time == '')
                    now = Time.new
                    post_time = now.strftime('%Y-%m-%dT%H:%M:%S')
                end

                param = {'post_id' => post_id, 'source'=> source, 'user_id'=> user_id, 'post_time' => post_time, 'content'=> i}
                params.push(param)
            end

            data = {'data' => params}
            data = data.to_json

        end
    end
end