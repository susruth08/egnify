class Request < ApplicationRecord


    def self.add_request(method, response_in_seconds, server_session_id)
        req = Request.new(method: method, response_in_seconds: response_in_seconds, server_session_id: server_session_id)
        if req.save
            return [true, "success"]
        else
            return [false, req.full_error_messages]
        end
    end

    def self.get_requests_by_sererid(server_session_id)
        reqs = Request.where(server_session_id: server_session_id)
        reqs
    end

    def self.get_average_response_time(starttime, endtime)
        response_times = Request.where(created_at: starttime..endtime).pluck(:response_in_seconds)
        if response_times.present?
            ans =  ( response_times.sum/response_times.count ).to_i
        else
            ans=0
        end
        return ans
    end


    


end
