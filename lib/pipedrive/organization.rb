module Pipedrive
  class Organization < Base

    def persons(api_token = nil)
      Person.all(get("#{resource_path}/#{id}/persons", :query => { :api_token => api_token }), {}, false, api_token)
    end

    def deals(api_token = nil)
      Deal.all(get("#{resource_path}/#{id}/deals", :query => { :api_token => api_token }), {}, false,  api_token)
    end

    class << self

      def find_or_create_by_name(name, opts={}, api_token = nil)
        find_by_name(name, {}, api_token).first || create(opts.merge(:name => name), api_token)
      end

    end
  end
end
