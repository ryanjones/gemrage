# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rspec-expectations}
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Chelimsky", "Chad Humphries"]
  s.date = %q{2010-10-09}
  s.description = %q{rspec expectations (should[_not] and matchers)}
  s.email = %q{dchelimsky@gmail.com;chad.humphries@gmail.com}
  s.extra_rdoc_files = ["README.markdown"]
  s.files = [".document", ".gitignore", "Gemfile", "History.markdown", "License.txt", "README.markdown", "Rakefile", "Upgrade.markdown", "cucumber.yml", "features/README.markdown", "features/expectations/attribute_of_subject.feature", "features/expectations/customized_message.feature", "features/expectations/diffing.feature", "features/expectations/implicit_docstrings.feature", "features/matchers/access_running_example.feature", "features/matchers/define_diffable_matcher.feature", "features/matchers/define_matcher.feature", "features/matchers/define_matcher_outside_rspec.feature", "features/matchers/define_matcher_with_fluent_interface.feature", "features/matchers/equality.feature", "features/matchers/expect_change.feature", "features/matchers/expect_error.feature", "features/matchers/have.feature", "features/matchers/include.feature", "features/matchers/operators.feature", "features/matchers/predicates.feature", "features/matchers/respond_to.feature", "features/step_definitions/additional_cli_steps.rb", "features/support/env.rb", "features/test_frameworks/test_unit.feature", "lib/rspec-expectations.rb", "lib/rspec/expectations.rb", "lib/rspec/expectations/backward_compatibility.rb", "lib/rspec/expectations/differ.rb", "lib/rspec/expectations/errors.rb", "lib/rspec/expectations/extensions.rb", "lib/rspec/expectations/extensions/array.rb", "lib/rspec/expectations/extensions/kernel.rb", "lib/rspec/expectations/extensions/rspec/core/example_group.rb", "lib/rspec/expectations/fail_with.rb", "lib/rspec/expectations/handler.rb", "lib/rspec/expectations/version.rb", "lib/rspec/matchers.rb", "lib/rspec/matchers/be.rb", "lib/rspec/matchers/be_close.rb", "lib/rspec/matchers/be_instance_of.rb", "lib/rspec/matchers/be_kind_of.rb", "lib/rspec/matchers/change.rb", "lib/rspec/matchers/compatibility.rb", "lib/rspec/matchers/dsl.rb", "lib/rspec/matchers/eq.rb", "lib/rspec/matchers/eql.rb", "lib/rspec/matchers/equal.rb", "lib/rspec/matchers/errors.rb", "lib/rspec/matchers/exist.rb", "lib/rspec/matchers/extensions/instance_exec.rb", "lib/rspec/matchers/generated_descriptions.rb", "lib/rspec/matchers/has.rb", "lib/rspec/matchers/have.rb", "lib/rspec/matchers/include.rb", "lib/rspec/matchers/match.rb", "lib/rspec/matchers/match_array.rb", "lib/rspec/matchers/matcher.rb", "lib/rspec/matchers/method_missing.rb", "lib/rspec/matchers/operator_matcher.rb", "lib/rspec/matchers/pretty.rb", "lib/rspec/matchers/raise_error.rb", "lib/rspec/matchers/respond_to.rb", "lib/rspec/matchers/satisfy.rb", "lib/rspec/matchers/throw_symbol.rb", "rspec-expectations.gemspec", "spec/rspec/expectations/differ_spec.rb", "spec/rspec/expectations/extensions/kernel_spec.rb", "spec/rspec/expectations/fail_with_spec.rb", "spec/rspec/expectations/handler_spec.rb", "spec/rspec/matchers/be_close_spec.rb", "spec/rspec/matchers/be_instance_of_spec.rb", "spec/rspec/matchers/be_kind_of_spec.rb", "spec/rspec/matchers/be_spec.rb", "spec/rspec/matchers/change_spec.rb", "spec/rspec/matchers/compatibility_spec.rb", "spec/rspec/matchers/description_generation_spec.rb", "spec/rspec/matchers/dsl_spec.rb", "spec/rspec/matchers/eq_spec.rb", "spec/rspec/matchers/eql_spec.rb", "spec/rspec/matchers/equal_spec.rb", "spec/rspec/matchers/exist_spec.rb", "spec/rspec/matchers/has_spec.rb", "spec/rspec/matchers/have_spec.rb", "spec/rspec/matchers/include_spec.rb", "spec/rspec/matchers/match_array_spec.rb", "spec/rspec/matchers/match_spec.rb", "spec/rspec/matchers/matcher_spec.rb", "spec/rspec/matchers/matchers_spec.rb", "spec/rspec/matchers/operator_matcher_spec.rb", "spec/rspec/matchers/raise_error_spec.rb", "spec/rspec/matchers/respond_to_spec.rb", "spec/rspec/matchers/satisfy_spec.rb", "spec/rspec/matchers/throw_symbol_spec.rb", "spec/spec_helper.rb", "spec/suite.rb", "spec/support/classes.rb", "specs.watchr"]
  s.homepage = %q{http://github.com/rspec/rspec-expectations}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rspec}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{rspec-expectations-2.0.0}
  s.test_files = ["features/README.markdown", "features/expectations/attribute_of_subject.feature", "features/expectations/customized_message.feature", "features/expectations/diffing.feature", "features/expectations/implicit_docstrings.feature", "features/matchers/access_running_example.feature", "features/matchers/define_diffable_matcher.feature", "features/matchers/define_matcher.feature", "features/matchers/define_matcher_outside_rspec.feature", "features/matchers/define_matcher_with_fluent_interface.feature", "features/matchers/equality.feature", "features/matchers/expect_change.feature", "features/matchers/expect_error.feature", "features/matchers/have.feature", "features/matchers/include.feature", "features/matchers/operators.feature", "features/matchers/predicates.feature", "features/matchers/respond_to.feature", "features/step_definitions/additional_cli_steps.rb", "features/support/env.rb", "features/test_frameworks/test_unit.feature", "spec/rspec/expectations/differ_spec.rb", "spec/rspec/expectations/extensions/kernel_spec.rb", "spec/rspec/expectations/fail_with_spec.rb", "spec/rspec/expectations/handler_spec.rb", "spec/rspec/matchers/be_close_spec.rb", "spec/rspec/matchers/be_instance_of_spec.rb", "spec/rspec/matchers/be_kind_of_spec.rb", "spec/rspec/matchers/be_spec.rb", "spec/rspec/matchers/change_spec.rb", "spec/rspec/matchers/compatibility_spec.rb", "spec/rspec/matchers/description_generation_spec.rb", "spec/rspec/matchers/dsl_spec.rb", "spec/rspec/matchers/eq_spec.rb", "spec/rspec/matchers/eql_spec.rb", "spec/rspec/matchers/equal_spec.rb", "spec/rspec/matchers/exist_spec.rb", "spec/rspec/matchers/has_spec.rb", "spec/rspec/matchers/have_spec.rb", "spec/rspec/matchers/include_spec.rb", "spec/rspec/matchers/match_array_spec.rb", "spec/rspec/matchers/match_spec.rb", "spec/rspec/matchers/matcher_spec.rb", "spec/rspec/matchers/matchers_spec.rb", "spec/rspec/matchers/operator_matcher_spec.rb", "spec/rspec/matchers/raise_error_spec.rb", "spec/rspec/matchers/respond_to_spec.rb", "spec/rspec/matchers/satisfy_spec.rb", "spec/rspec/matchers/throw_symbol_spec.rb", "spec/spec_helper.rb", "spec/suite.rb", "spec/support/classes.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<diff-lcs>, [">= 1.1.2"])
      s.add_development_dependency(%q<cucumber>, [">= 0.6.2"])
      s.add_development_dependency(%q<aruba>, [">= 0.1.1"])
      s.add_development_dependency(%q<rspec-core>, [">= 2.0.0"])
      s.add_development_dependency(%q<rspec-mocks>, [">= 2.0.0"])
    else
      s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
      s.add_dependency(%q<cucumber>, [">= 0.6.2"])
      s.add_dependency(%q<aruba>, [">= 0.1.1"])
      s.add_dependency(%q<rspec-core>, [">= 2.0.0"])
      s.add_dependency(%q<rspec-mocks>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
    s.add_dependency(%q<cucumber>, [">= 0.6.2"])
    s.add_dependency(%q<aruba>, [">= 0.1.1"])
    s.add_dependency(%q<rspec-core>, [">= 2.0.0"])
    s.add_dependency(%q<rspec-mocks>, [">= 2.0.0"])
  end
end
