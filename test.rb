# class Aaa
#   # attr_accessor :name
#   attr_reader :name
#   def initialize
#     # @bbbbb = 'fds'
#     @name = 'cccccccc'
#   end

#   def self.example
#     a = 1
#     b = 2
#     proc do
#       define_method(:aaaaa){ puts 'aaaaaaaaaaaaaaaaaaaaaaa'}
#     end
#   end

#   def self.expose
#     change(&example)
#   end

#   def self.change(&example)
#     puts "~~~~~~~~~~~~~~#{example.inspect}"
#     example.call
#   end

#   def get_name
#     name
#   end

#   def set_name
#     self.name = 'ddddd'
#   end
# end

# # puts "~~~~~~~#{Aaa.new.bbbbb}"
# # a= Aaa.new
# # a.set_name
# # puts a.get_name
# puts Aaa.expose
# puts Aaa.new.aaaaa

# class A
#   def self.aaaa
#     aa = class << self
#       self
#     end
#     puts aa.inspect
#     aa
#   end
#   class_eval <<-RUBY
#     def test_1
#       puts '1111111111111'
#     end

#     def self.test2
#       puts "~~~~~~~#{aaaa == self}"
#       aaaa.class_eval do
#         puts "``````````````````#{ancestors.first == self}"
#         def ccccccccc
#           puts 'ccccccc'
#         end
#       end
#     end
#   RUBY
# end

# test_a = A.new
# A.aaaa
# test_a.test_1
# A.test2
# A.ccccccccc

# module TestA
#   def aaaa
#     puts 'aaaaaaaaaaaaaa'
#   end
# end

# module TestB
#   def bbbbbb
#     puts 'cccccccc'
#     puts self.inspect
#   end
# end

# class TestC
#   include TestA
#   extend TestB
#   puts bbbbbb
# end

# puts TestC.new.aaaa
# puts TestC.bbbbbb

# class A
#   class_eval do
#     define_method(:aaaaa) do |k, v|
#       puts "aaaaaaa inv#{k}    #{v}"
#     end
#   end
# end

# A.new.aaaaa('hahahahha', 'jsjsjs')


# class A

#   # private
#   def self.aaa
#     puts 'aaaaaaaa'
#   end
# end

# class B < A
#   aaa
# end

# B.new.bbb


# module Pundit
#   extend ActiveSupport::Concern

#   class << self
#     def policy_scope
#       puts "****policy_scope****"
#     end
#   end

#   included do
#     if respond_to?(:hide_action)
#       hide_action :authorize
#     end
#   end

#   def authorize
#     puts "~~~~authorize~~~~"
#   end

# end


# File::open("aaa.xml", 'wb') do |file|
#   file.puts 'fdsfdsfds'
# end #关闭文件流

require 'net/http'

url = URI.parse('http://msg.umeng.com/api/send')

request_body_map = {
  appkey: "532fea8456240b89e201da87",
  timestamp: "#{Time.now.to_i}",
  validation_token: "#{Digest::MD5.hexdigest("532fea8456240b89e201da87" + "kvxuokzzowpdexsy3d04wl3d6jdicrbl" + "#{Time.now.to_i}")}",
  type: "customizedcast",
  alias: "dfdsfsdf",
  payload:
  {
      display_type: "notification",
      body:
      {
        ticker: "xx",
        title: "xx",
        text: "xx",
        after_open: "go_activity"
      },
      extra: {
        key1: "value1",
        key2: "value2"
      }
  }
}

Net::HTTP.start(url.host, url.port) do |http|
  req = Net::HTTP::Post.new(url.path)
  req.set_form_data(request_body_map)
  puts http.request(req).body
end
