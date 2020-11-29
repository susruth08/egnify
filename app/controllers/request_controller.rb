class RequestController < ApplicationController
    def index
        response={}
        response[:time] = Time.now
        response[:method] = request.method
        response[:path] = request.path
        response[:body] = params.permit!.to_h.except(:controller, :action, :request)
        wait_time = rand(1..3)
        response[:duration] = wait_time
        Request.add_request(response[:method], response[:duration], $SERVER_TIMESTAMP)
        render json: { status: true, response: response } and return

    end


    def stats
        response = {}
        response[:total_request_count_since_server_startup] = Request.get_requests_by_sererid($SERVER_TIMESTAMP).count
        response[:past_hour_avg_response_time] = Request.get_average_response_time(DateTime.now-1.hours, DateTime.now)
        response[:past_minute_avg_response_time] = Request.get_average_response_time(DateTime.now-1.minute, DateTime.now )
        render json: { status: true, response: response } and return
    end
end
