module API
  module V1
    class JijingMarks < Grape::API
      require 'will_paginate/array'
      include API::V1::Defaults

      resource :jijing_marks do

        desc "Create a jijing mark.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :content, type: String, desc: "content of mark"
          requires :audio_length, type: String, desc: "audio length"
          requires :score, type: Integer, desc: "score of answer"
          requires :jijing_answer_id, type: Integer, desc: "answer ID"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          JijingMark.create!({
            content: params[:content],
            audio_length: params[:audio_length],
            score: params[:score],
            jijing_answer_id: params[:jijing_answer_id],
            user_id: params[:user_id]
          })
        end

        desc "get my jijing speech marked for teacher", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :page, type: String, desc: "page number"
        end
        get "", root: "speeches" do
          authenticate!
          jijing_answer = []
          current_user.jijing_marks.each do |item|
            jijing_answer << item.jijing_answer
          end

          jinghua_answer = []
          current_user.jinghua_marks.each do |item|
            jinghua_answer << item.jinghua_answer
          end
          (jijing_answer + jinghua_answer).sort_by{ |m| m.created_at }.paginate(:page => params[:page], :per_page => 10)
        end

        desc "get my article marked statistics for students", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "/statistics" do
          authenticate!
          jijing_answer = []
          current_user.jijing_marks.each do |item|
            answer << item.jijing_answer
          end

          jinghua_answer = []
          current_user.jinghua_marks.each do |item|
            answer << item.jinghua_answer
          end
          marked_count = (jijing_answer + jinghua_answer).count
          { marked_count: marked_count }
        end
      end
    end
  end
end