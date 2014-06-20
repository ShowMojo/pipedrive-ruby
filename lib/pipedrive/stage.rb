module Pipedrive
  class Stage < Base
    def self.deals(id, api_token = nil)
      Deal.all(get("#{resource_path}/#{id}/deals", :query => {:everyone => 1, :api_token => api_token}), {}, false, api_token)
    end
  end
end
