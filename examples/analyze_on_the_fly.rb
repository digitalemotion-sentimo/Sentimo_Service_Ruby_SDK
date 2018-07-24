require './sentimo_developer_cloud/sentimo/client'
require './config'

url = Sentimo::URL
token = Sentimo::PID
timeout = Sentimo::TIMEOUT

service = Sentimo::AnalyzeOnTheFly.new({
  'url' => url ,
  'token' => token,
  'timeout' => timeout
})

# ============================
# Test 1 # Full data set test
# ============================
dataset = '[{"title":"-","type":"string","user_id":"123456","screen_name":"123456","userjoindate":0,"postcount":"1", "post_time":"2017-03-08T19:03:01.002Z","post_id":"x0004","content":"I love frozen yogurt, although I do not like regular yogurt","reply_to_post_id":"-","reply_to_uid":"123456","msg_from":"dee","likes":0,"url":"string","source":"123456"}]'
response = service.analyze_sentimo_full_dataset_on_the_fly(dataset, 'sir','education')
puts response

# ============================
# Test 2 # String test
# ============================
content = 'I love frozen yogurt, although I do not like regular yogurt.'
response = service.analyze_sentiment_on_the_fly(content)
puts response

# ============================
# Test 3 # String array test
# ============================
content_1 = ['I love frozen yogurt, although I do not like regular yogurt.', 'Today the train is very crowded.']
response = service.analyze_sentimo_on_the_fly(content_1, 'sir,transportation')
puts response