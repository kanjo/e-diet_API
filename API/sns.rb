#Load AWS variables and required gems
#require File.dirname(__FILE__) + '/../config'
require 'sinatra'
require 'aws-sdk-core'

#set AWS access
Aws.config[:access_key_id] = ''
  Aws.config[:secret_access_key] = ''
  Aws.config[:region] = 'us-west-2'

before do
  content_type'application/json'
end

get "/" do
  content_type'html'
  erb :index
end


get "/sendtest" do
  content_type'html'
  erb :message
end

#send sns message to a topic
post "/sendtest" do
  sns = Aws::SNS.new
  resp = sns.publish(target_arn: "arn:aws:sns:us-west-2:292873453561:prueba",message: params[:message])
  "Message published"  
end

get "/regdevice/e-diet/gcm/post" do
  # matches "GET /posts?token=foo&user=bla"
  sns = Aws::SNS.new
  resp = sns.create_platform_endpoint(
    platform_application_arn: "arn:aws:sns:us-west-2:292873453561:app/GCM/e-diet",
    token: params[:token],
    custom_user_data: params[:user],
    attributes: { "Enabled" => "true" }
  )
end
