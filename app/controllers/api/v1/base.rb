require "grape-swagger"

module API
  module V1
    class Base < Grape::API
      mount API::V1::Works
      mount API::V1::Questions
      mount API::V1::Favorites
      mount API::V1::Squares
      mount API::V1::Reports
      mount API::V1::GrammarTypes
      mount API::V1::GrammarGroups
      mount API::V1::VocabularyGroups
      mount API::V1::Articles
      mount API::V1::ArticleMarks
      mount API::V1::OralGroups
      mount API::V1::OralResults
      mount API::V1::JinghuaQuestions
      mount API::V1::JinghuaAnswers
      mount API::V1::Profiles
      mount API::V1::Feedbacks
      mount API::V1::ReproductionQuestions
      mount API::V1::ReproductionResults
      mount API::V1::OralOrigins
      mount API::V1::Oral2Results
      mount API::V1::JijingGroups
      mount API::V1::JijingTasks
      mount API::V1::JijingAnswers
      mount API::V1::JijingMarks
      mount API::V1::JinghuaMarks

      add_swagger_documentation(
        api_version: "v1",
        hide_documentation_path: true,
        mount_path: "/api/v1/swagger_doc",
        hide_format: true
      )
    end
  end
end