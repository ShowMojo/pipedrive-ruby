module Pipedrive
  class Pipeline < Base
    def stages api_token = nil
      Stage.all(get("/stages", { :pipeline_id => self.id, :api_token => api_token }), {}, false, api_token)
    end

    def statistics(id, start_date, end_date, api_token = nil)
      res = get("#{resource_path}/#{id}/movement_statistics",
                :query => {:start_date => start_date, :end_date => end_date, :api_token => api_token})
      res.ok? ? new(res) : bad_response(res,{:id=>id,:start_date=>start_date,:end_date=>end_date})
    end

    def deals(id, stage_id, api_token = nil)
      Pipedrive::Deal.all(get("#{resource_path}/#{id}/deals", :stage_id => stage_id, :api_token => api_token ), {}, false, api_token)
    end
  end
end
