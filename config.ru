require 'json'
require_relative 'database'
require_relative 'problems'

class Application
  def call(env)
    req = Rack::Request.new(env)
    handle_request(req)
  end

  private

  def handle_request(req)
    if req.post?
      post(req)
    else
      method_not_allowed(req)
    end
  end

  def post(req)
    puts req.ip
    if Problems::PROBLEM_MAP.include?(req.path_info)
      problem = Problems::PROBLEM_MAP[req.path_info]
      Database.add_problem_call(problem.name)
      problem_calls = Database.get_problem_calls(problem.name).first

      body = JSON.parse(req.body.read)
      solution = problem.solve(body)
      return [200, { "Content-Type" => "application/json" }, [{:solution => solution, :problem_calls => problem_calls}.to_json]]
    end

    return [404, { "Content-Type" => "text/html" }, ["Unrecognized problem #{req.path_info}. Valid problems: #{Problems::PROBLEM_MAP.keys}"]]
  end

  def method_not_allowed(req)
    [405, { "Content-Type" => "text/html" }, ["No such method: You have requested the path #{req.path_info}, using #{req.request_method}"]]
  end
end

run Application.new