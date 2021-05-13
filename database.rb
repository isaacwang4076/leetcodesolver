# typed: false
require 'mongo'
require 'sorbet-runtime'

module Database
  extend T::Sig

  @@client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'test')
  @@db = @@client.database

  sig{params(problem_name: String).void}
  def self.add_problem_call(problem_name)
    current_time = T.let(Time.new.inspect, String)
    # update problem_call document if it exists
    doc = @@client[:problem_calls].find_one_and_update(
      { problem_name: problem_name },
      {'$set': { last_called: current_time }, '$inc': { count: 1 }, '$push': { times: current_time} })

    # otherwise insert a new document for this problem
    if doc.nil?
      @@client[:problem_calls].insert_one({ problem_name: problem_name, count: 1, last_called: current_time, times: [current_time] })
    end

    # print contents of our table
    @@client[:problem_calls].find().each { |doc| puts doc }
  end

  # sig{params(problem_name: String).returns(Mongo::Collection::View)}
  def self.get_problem_calls(problem_name)
    return @@client[:problem_calls].find({problem_name: problem_name})
  end
end
