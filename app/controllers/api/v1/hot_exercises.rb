# encoding: utf-8

module API
  module V1
    class HotExercises < Grape::API
      include API::V1::Defaults

      resource :hot_exercises do

        desc "Return hot exercises."

        get "" do
          HotExercise.hot_exercises
        end
      end
    end
  end
end
