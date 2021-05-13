# typed: true
require 'sorbet-runtime'

module Problems
  attr_accessor :PROBLEM_MAP

  private

  class Problem
    extend T::Sig

    attr_accessor :name

    sig {params(name: String, solver: Proc).void}
    def initialize(name, solver)
      @name = T.let(name, String)
      @solver = T.let(solver, Proc)
    end

    sig {params(data: Hash).returns(Hash)}
    def solve(data)
      solution = @solver.call(data)
      return {solution: solution}
    end

    sig {returns(String)}
    def path
      return "/#{@name}"
    end
  end

  REVERSE_STRING = Problem.new("reverse_string", ->(body) { body["original"].reverse })
  TWO_SUM = Problem.new("two_sum", ->(body) {
    target = body["target"]
    list = body["list"]
    seen_values = Set.new
    list.each do |val|
      needed = target - val
      if seen_values.include?(needed)
        return [needed, val]
      end
      seen_values.add(val)
    end
    return nil
  })
  PROBLEM_MAP = [REVERSE_STRING, TWO_SUM].map { |problem| [problem.path, problem] }.to_h
end
