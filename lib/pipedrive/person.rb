module Pipedrive
  class Person < Base

    class << self

      def find_or_create_by_name(name, opts={}, api_token = nil)
        find_by_name(name, { :org_id => opts[:org_id] }, api_token).first || create(opts.merge(:name => name), api_token)
      end

    end

    def deals()
      Deal.all(get("#{resource_path}/#{id}/deals", :everyone => 1, :query => { :api_token => api_token}), {}, false, api_token)
    end
  end
end
