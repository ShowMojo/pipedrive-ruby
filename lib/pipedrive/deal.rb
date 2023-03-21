module Pipedrive
  class Deal < Base
    def add_product(opts = {}, api_token = nil)
      res = post "#{resource_path}/#{id}/products", :body => opts.to_json, :query => { :api_token => api_token }
      res.success? ? res['data']['product_attachment_id'] : bad_response(res,opts)
    end

    def products(api_token = nil)
      Product.all(get("#{resource_path}/#{id}/products", :query => { :api_token => api_token }), {}, false, api_token)
    end
    
    def remove_product(product_attachment_id, api_token = nil)
      res = delete "#{resource_path}/#{id}/products", { :body => { :product_attachment_id => product_attachment_id }, :query => { :api_token => api_token } }
      res.success? ? nil : bad_response(res,product_attachment_id)
    end

    def activities api_token = nil
      Activity.all(get("#{resource_path}/#{id}/activities", :query => { :api_token => api_token }), {}, false, api_token)
    end

    def files api_token = nil
      File.all(get("#{resource_path}/#{id}/files", :query => { :api_token => api_token }), {}, false, api_token)
    end

    def notes(opts = {:sort_by => 'add_time', :sort_mode => 'desc'}, api_token = nil)
      Note.all( get("/notes", :query => opts.merge(:deal_id => id, :api_token => api_token) ), {}, false, api_token )
    end
  end
end
