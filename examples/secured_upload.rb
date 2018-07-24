require './sentimo_developer_cloud/sentimo/client'
require './config'

url = Sentimo::URL
token = Sentimo::PID
timeout = Sentimo::TIMEOUT

service = Sentimo::SecuredUpload.new({
  'url' =>url,
  'token' => token,
  'timeout' => timeout
})

data = '{"data":[{"post_id":"x0003","source":"DummySource2","user_id":"user2","post_time":"2016-02-08-19-03-02","content":"Trains are very crowded today."}]}'
content  = 'Trains are very crowded today.'

#======================================
# Test 1 # Test fullset data upload
#======================================
response = service.upload_full_dataset(data)
puts response

#======================================
# Test 1 # Test string data upload
#======================================
response = service.upload_data(content)
puts response