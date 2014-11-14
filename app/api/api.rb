require 'grape'

module API
  class Base < Grape::API
    format :json

    mount API::Customers

    add_swagger_documentation(
      base_path: "/api",
      hide_documentation_path: true,
      hide_format: true
    )
  end
end
