module V1
  class Base < Grape::API
    format :json

    mount V1::Customers

    add_swagger_documentation(
      base_path: '/api',
      api_version: 'v1',
      hide_documentation_path: true,
      hide_format: true
    )
  end
end
