require 'aws-sdk-core'
require 'json'

# loading credentials from external file
creds = JSON.load(File.read('secrets.json'))
creds = Aws::Credentials.new(creds['AccessKeyId'], creds['SecretAccessKey'])

# Authenticating AWS credentials
ec2 = Aws::EC2::Client.new(credentials: creds, region:'us-west-2')

puts "============================="
puts "=====Amazon Web Services====="
puts "============================="

# Making an API call to get running instance details
puts "Making an API call to AWS for instance details..."
ec2.describe_instances.reservations.first.instances.each do |instance|
  puts "Instance Id: #{instance.instance_id}"
  puts "Instance Type: #{instance.instance_type}"
  puts "Public IP Address: #{instance.public_ip_address}"
  puts "Private IP Address: #{instance.private_ip_address}"
  puts "Public DNS name: #{instance.public_dns_name}"
end

