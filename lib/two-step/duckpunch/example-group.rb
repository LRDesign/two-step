require 'rspec/core'
require 'two-step/stepwise'

module TwoStep
  module DSL
    def steps(*args, &block)
      options =
        if args.last.is_a?(Hash)
          args.pop
        else
          {}
        end
      options[:stepwise] = true
      options[:caller] ||= caller
      args.push(options)

      describe(*args, &block)
    end
  end
end

RSpec::Core::ExampleGroup.extend TwoStep::DSL

extend TwoStep::DSL
Module::send(:include, TwoStep::DSL)

RSpec::configuration.include(RSpecStepwise, :stepwise => true)
