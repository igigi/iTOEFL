require "grape-swagger"

module API
  module V1
    class Base < Grape::API
      mount API::V1::Profiles

      add_swagger_documentation(
        api_version: "v2",
        hide_documentation_path: true,
        mount_path: "/api/v2/swagger_doc",
        hide_format: true
      )
    end
  end
end