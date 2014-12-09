module API
  module V1
    class Speeches < Grape::API
      require 'will_paginate/array'
      include API::V1::Defaults

      resource :speeches do

        desc "get a speech to mark", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "get_one" do
          authenticate!
          if answer = (JinghuaAnswer.where(status: 0) + JijingAnswer.where(status: 0)).sort_by{ |m| m.created_at }.last
            answer.update(status: 3)
            answer
          else
            {}
          end
        end

        desc "cancel a speech to mark", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :answer_type, type: String, desc: "answer type, 1 jinghua, 2, jijing"
        end
        delete ":id" do
          authenticate!
          if params[:answer_type] == "1"
            answer = JinghuaAnswer.find(params[:id])
            answer.update(status: 0)
            nil
          elsif params[:answer_type] == "2"
            answer = JijingAnswer.find(params[:id])
            answer.update(status: 0)
            nil
          end
        end

        desc "get count of speech unmarked", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "count" do
          authenticate!
          answer = (JinghuaAnswer.where(status: 0) + JijingAnswer.where(status: 0))
          count = answer.count
          {count: count}
        end

        desc "get my jijing speech marked for students", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :sort, type: String, desc: "sort condition, 0:unmark, 1:marked, 2:unjudgement"
          requires :page, type: String, desc: "page number"
        end
        get "" do
          authenticate!
          if params[:sort] == "0"
            (current_user.jinghua_answers.where("status = ? OR status = ?", params[:sort], 3) + current_user.jijing_answers.where("status = ? OR status = ?", params[:sort], 3)).sort_by{ |m| m.created_at }.reverse!.paginate(:page => params[:page], :per_page => 10)
          elsif params[:sort] == "1"
            (current_user.jinghua_answers.where("status = ? OR status = ?", params[:sort], 2) + current_user.jijing_answers.where("status = ? OR status = ?", params[:sort], 2)).sort_by{ |m| m.created_at }.reverse!.paginate(:page => params[:page], :per_page => 10)
          else
            (current_user.jinghua_answers.where(status: 1) + current_user.jijing_answers.where(status: 1)).sort_by{ |m| m.created_at }.reverse!.paginate(:page => params[:page], :per_page => 10)
          end
        end

        desc "get my jijing speech marked statistics for students", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "/statistics" do
          authenticate!
          unmark_count = (current_user.jinghua_answers.where("status = ? OR status = ?", "0", 3) + current_user.jijing_answers.where("status = ? OR status = ?", "0", 3)).count
          marked_count = (current_user.jinghua_answers.where("status = ? OR status = ?", "1", 2) + current_user.jijing_answers.where("status = ? OR status = ?", "1", 2)).count
          { unmark_count: unmark_count, marked_count: marked_count }
        end
      end
    end
  end
end