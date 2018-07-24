require './sentimo_developer_cloud/sentimo/client'
require './config'

url = Sentimo::URL
token = Sentimo::PID
timeout = Sentimo::TIMEOUT

service = Sentimo::GetSentiments.new({
  'url' =>url ,
  'token' => token,
  'timeout' => timeout
})

#Assume DataId is 153345
response = service.retrieve_sentiment(dataIds = '153345')
puts response

response = service.retrieve_sentiment_set('153345', '' , 5)
puts response

response = service.retrieve_sentimo('153345' , 'education')
puts response

response = service.retrieve_sentimo_set('153345' , '' , '5')
puts response