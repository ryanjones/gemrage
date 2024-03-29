# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rspec-mocks}
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Chelimsky", "Chad Humphries"]
  s.date = %q{2010-10-09}
  s.description = %q{RSpec's 'test double' framework, with support for stubbing and mocking}
  s.email = %q{dchelimsky@gmail.com;chad.humphries@gmail.com}
  s.extra_rdoc_files = ["README.markdown"]
  s.files = [".autotest", ".document", ".gitignore", "Gemfile", "History.markdown", "License.txt", "README.markdown", "Rakefile", "autotest/discover.rb", "cucumber.yml", "features/README.markdown", "features/message_expectations/block_local_expectations.feature.pending", "features/message_expectations/expect_message.feature", "features/message_expectations/warn_when_expectation_is_set_on_nil.feature", "features/outside_rspec/configuration.feature", "features/stubs/simple_return_value.feature", "features/stubs/stub_chain.feature", "features/stubs/stub_implementation.feature", "features/support/env.rb", "lib/rspec/mocks.rb", "lib/rspec/mocks/argument_expectation.rb", "lib/rspec/mocks/argument_matchers.rb", "lib/rspec/mocks/error_generator.rb", "lib/rspec/mocks/errors.rb", "lib/rspec/mocks/extensions/instance_exec.rb", "lib/rspec/mocks/extensions/object.rb", "lib/rspec/mocks/framework.rb", "lib/rspec/mocks/message_expectation.rb", "lib/rspec/mocks/method_double.rb", "lib/rspec/mocks/methods.rb", "lib/rspec/mocks/mock.rb", "lib/rspec/mocks/order_group.rb", "lib/rspec/mocks/proxy.rb", "lib/rspec/mocks/serialization.rb", "lib/rspec/mocks/space.rb", "lib/rspec/mocks/spec_methods.rb", "lib/rspec/mocks/version.rb", "lib/spec/mocks.rb", "rspec-mocks.gemspec", "spec/rspec/mocks/and_yield_spec.rb", "spec/rspec/mocks/any_number_of_times_spec.rb", "spec/rspec/mocks/argument_expectation_spec.rb", "spec/rspec/mocks/at_least_spec.rb", "spec/rspec/mocks/at_most_spec.rb", "spec/rspec/mocks/block_return_value_spec.rb", "spec/rspec/mocks/bug_report_10260_spec.rb", "spec/rspec/mocks/bug_report_10263_spec.rb", "spec/rspec/mocks/bug_report_11545_spec.rb", "spec/rspec/mocks/bug_report_15719_spec.rb", "spec/rspec/mocks/bug_report_496_spec.rb", "spec/rspec/mocks/bug_report_600_spec.rb", "spec/rspec/mocks/bug_report_7611_spec.rb", "spec/rspec/mocks/bug_report_7805_spec.rb", "spec/rspec/mocks/bug_report_8165_spec.rb", "spec/rspec/mocks/bug_report_8302_spec.rb", "spec/rspec/mocks/bug_report_830_spec.rb", "spec/rspec/mocks/bug_report_957_spec.rb", "spec/rspec/mocks/double_spec.rb", "spec/rspec/mocks/failing_argument_matchers_spec.rb", "spec/rspec/mocks/hash_including_matcher_spec.rb", "spec/rspec/mocks/hash_not_including_matcher_spec.rb", "spec/rspec/mocks/mock_ordering_spec.rb", "spec/rspec/mocks/mock_space_spec.rb", "spec/rspec/mocks/mock_spec.rb", "spec/rspec/mocks/multiple_return_value_spec.rb", "spec/rspec/mocks/nil_expectation_warning_spec.rb", "spec/rspec/mocks/null_object_mock_spec.rb", "spec/rspec/mocks/once_counts_spec.rb", "spec/rspec/mocks/options_hash_spec.rb", "spec/rspec/mocks/partial_mock_spec.rb", "spec/rspec/mocks/partial_mock_using_mocks_directly_spec.rb", "spec/rspec/mocks/passing_argument_matchers_spec.rb", "spec/rspec/mocks/precise_counts_spec.rb", "spec/rspec/mocks/record_messages_spec.rb", "spec/rspec/mocks/serialization_spec.rb", "spec/rspec/mocks/stash_spec.rb", "spec/rspec/mocks/stub_chain_spec.rb", "spec/rspec/mocks/stub_implementation_spec.rb", "spec/rspec/mocks/stub_spec.rb", "spec/rspec/mocks/stubbed_message_expectations_spec.rb", "spec/rspec/mocks/twice_counts_spec.rb", "spec/rspec/mocks_spec.rb", "spec/spec_helper.rb", "specs.watchr"]
  s.homepage = %q{http://github.com/rspec/rspec-mocks}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rspec}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{rspec-mocks-2.0.0}
  s.test_files = ["features/README.markdown", "features/message_expectations/block_local_expectations.feature.pending", "features/message_expectations/expect_message.feature", "features/message_expectations/warn_when_expectation_is_set_on_nil.feature", "features/outside_rspec/configuration.feature", "features/stubs/simple_return_value.feature", "features/stubs/stub_chain.feature", "features/stubs/stub_implementation.feature", "features/support/env.rb", "spec/rspec/mocks/and_yield_spec.rb", "spec/rspec/mocks/any_number_of_times_spec.rb", "spec/rspec/mocks/argument_expectation_spec.rb", "spec/rspec/mocks/at_least_spec.rb", "spec/rspec/mocks/at_most_spec.rb", "spec/rspec/mocks/block_return_value_spec.rb", "spec/rspec/mocks/bug_report_10260_spec.rb", "spec/rspec/mocks/bug_report_10263_spec.rb", "spec/rspec/mocks/bug_report_11545_spec.rb", "spec/rspec/mocks/bug_report_15719_spec.rb", "spec/rspec/mocks/bug_report_496_spec.rb", "spec/rspec/mocks/bug_report_600_spec.rb", "spec/rspec/mocks/bug_report_7611_spec.rb", "spec/rspec/mocks/bug_report_7805_spec.rb", "spec/rspec/mocks/bug_report_8165_spec.rb", "spec/rspec/mocks/bug_report_8302_spec.rb", "spec/rspec/mocks/bug_report_830_spec.rb", "spec/rspec/mocks/bug_report_957_spec.rb", "spec/rspec/mocks/double_spec.rb", "spec/rspec/mocks/failing_argument_matchers_spec.rb", "spec/rspec/mocks/hash_including_matcher_spec.rb", "spec/rspec/mocks/hash_not_including_matcher_spec.rb", "spec/rspec/mocks/mock_ordering_spec.rb", "spec/rspec/mocks/mock_space_spec.rb", "spec/rspec/mocks/mock_spec.rb", "spec/rspec/mocks/multiple_return_value_spec.rb", "spec/rspec/mocks/nil_expectation_warning_spec.rb", "spec/rspec/mocks/null_object_mock_spec.rb", "spec/rspec/mocks/once_counts_spec.rb", "spec/rspec/mocks/options_hash_spec.rb", "spec/rspec/mocks/partial_mock_spec.rb", "spec/rspec/mocks/partial_mock_using_mocks_directly_spec.rb", "spec/rspec/mocks/passing_argument_matchers_spec.rb", "spec/rspec/mocks/precise_counts_spec.rb", "spec/rspec/mocks/record_messages_spec.rb", "spec/rspec/mocks/serialization_spec.rb", "spec/rspec/mocks/stash_spec.rb", "spec/rspec/mocks/stub_chain_spec.rb", "spec/rspec/mocks/stub_implementation_spec.rb", "spec/rspec/mocks/stub_spec.rb", "spec/rspec/mocks/stubbed_message_expectations_spec.rb", "spec/rspec/mocks/twice_counts_spec.rb", "spec/rspec/mocks_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec-core>, ["= 2.0.0"])
      s.add_runtime_dependency(%q<rspec-expectations>, ["= 2.0.0"])
    else
      s.add_dependency(%q<rspec-core>, ["= 2.0.0"])
      s.add_dependency(%q<rspec-expectations>, ["= 2.0.0"])
    end
  else
    s.add_dependency(%q<rspec-core>, ["= 2.0.0"])
    s.add_dependency(%q<rspec-expectations>, ["= 2.0.0"])
  end
end
