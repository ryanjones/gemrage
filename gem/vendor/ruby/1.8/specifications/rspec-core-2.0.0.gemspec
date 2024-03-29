# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rspec-core}
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chad Humphries", "David Chelimsky"]
  s.date = %q{2010-10-09}
  s.default_executable = %q{rspec}
  s.description = %q{RSpec runner and example groups}
  s.email = %q{dchelimsky@gmail.com;chad.humphries@gmail.com}
  s.executables = ["rspec"]
  s.extra_rdoc_files = ["README.markdown"]
  s.files = [".document", ".gitignore", ".treasure_map.rb", "Gemfile", "History.markdown", "License.txt", "README.markdown", "Rakefile", "Upgrade.markdown", "autotest/discover.rb", "bin/rspec", "cucumber.yml", "features/README.markdown", "features/command_line/configure.feature", "features/command_line/example_name_option.feature", "features/command_line/exit_status.feature", "features/command_line/line_number_appended_to_path.feature", "features/command_line/line_number_option.feature", "features/command_line/rake_task.feature", "features/configuration/custom_settings.feature", "features/configuration/fail_fast.feature", "features/configuration/read_options_from_file.feature", "features/example_groups/basic_structure.feature", "features/example_groups/shared_example_group.feature", "features/filtering/exclusion_filters.feature", "features/filtering/inclusion_filters.feature", "features/filtering/run_all_when_everything_filtered.feature", "features/formatters/custom_formatter.feature", "features/hooks/around_hooks.feature", "features/hooks/before_and_after_hooks.feature", "features/hooks/halt.feature", "features/metadata/described_class.feature", "features/mock_framework_integration/use_flexmock.feature", "features/mock_framework_integration/use_mocha.feature", "features/mock_framework_integration/use_rr.feature", "features/mock_framework_integration/use_rspec.feature", "features/pending/pending_examples.feature", "features/spec_files/arbitrary_file_suffix.feature", "features/subject/attribute_of_subject.feature", "features/subject/explicit_subject.feature", "features/subject/implicit_subject.feature", "features/support/env.rb", "lib/autotest/rspec2.rb", "lib/rspec/autorun.rb", "lib/rspec/core.rb", "lib/rspec/core/backward_compatibility.rb", "lib/rspec/core/command_line.rb", "lib/rspec/core/command_line_configuration.rb", "lib/rspec/core/configuration.rb", "lib/rspec/core/configuration_options.rb", "lib/rspec/core/deprecation.rb", "lib/rspec/core/drb_command_line.rb", "lib/rspec/core/errors.rb", "lib/rspec/core/example.rb", "lib/rspec/core/example_group.rb", "lib/rspec/core/extensions.rb", "lib/rspec/core/extensions/instance_eval_with_args.rb", "lib/rspec/core/extensions/kernel.rb", "lib/rspec/core/extensions/module_eval_with_args.rb", "lib/rspec/core/extensions/object.rb", "lib/rspec/core/formatters/base_formatter.rb", "lib/rspec/core/formatters/base_text_formatter.rb", "lib/rspec/core/formatters/documentation_formatter.rb", "lib/rspec/core/formatters/helpers.rb", "lib/rspec/core/formatters/html_formatter.rb", "lib/rspec/core/formatters/progress_formatter.rb", "lib/rspec/core/formatters/snippet_extractor.rb", "lib/rspec/core/formatters/text_mate_formatter.rb", "lib/rspec/core/hooks.rb", "lib/rspec/core/let.rb", "lib/rspec/core/load_path.rb", "lib/rspec/core/metadata.rb", "lib/rspec/core/mocking/with_absolutely_nothing.rb", "lib/rspec/core/mocking/with_flexmock.rb", "lib/rspec/core/mocking/with_mocha.rb", "lib/rspec/core/mocking/with_rr.rb", "lib/rspec/core/mocking/with_rspec.rb", "lib/rspec/core/option_parser.rb", "lib/rspec/core/pending.rb", "lib/rspec/core/rake_task.rb", "lib/rspec/core/reporter.rb", "lib/rspec/core/ruby_project.rb", "lib/rspec/core/runner.rb", "lib/rspec/core/shared_example_group.rb", "lib/rspec/core/subject.rb", "lib/rspec/core/version.rb", "lib/rspec/core/world.rb", "lib/rspec/monkey.rb", "lib/rspec/monkey/spork/test_framework/rspec.rb", "rspec-core.gemspec", "script/console", "spec/autotest/failed_results_re_spec.rb", "spec/autotest/rspec_spec.rb", "spec/rspec/core/command_line_configuration_spec.rb", "spec/rspec/core/command_line_spec.rb", "spec/rspec/core/command_line_spec_output.txt", "spec/rspec/core/configuration_options_spec.rb", "spec/rspec/core/configuration_spec.rb", "spec/rspec/core/deprecations_spec.rb", "spec/rspec/core/drb_command_line_spec.rb", "spec/rspec/core/example_group_spec.rb", "spec/rspec/core/example_spec.rb", "spec/rspec/core/formatters/base_formatter_spec.rb", "spec/rspec/core/formatters/base_text_formatter_spec.rb", "spec/rspec/core/formatters/documentation_formatter_spec.rb", "spec/rspec/core/formatters/helpers_spec.rb", "spec/rspec/core/formatters/html_formatted-1.8.6.html", "spec/rspec/core/formatters/html_formatted-1.8.7-jruby.html", "spec/rspec/core/formatters/html_formatted-1.8.7.html", "spec/rspec/core/formatters/html_formatted-1.9.1.html", "spec/rspec/core/formatters/html_formatted-1.9.2.html", "spec/rspec/core/formatters/html_formatter_spec.rb", "spec/rspec/core/formatters/progress_formatter_spec.rb", "spec/rspec/core/formatters/snippet_extractor_spec.rb", "spec/rspec/core/formatters/text_mate_formatted-1.8.6.html", "spec/rspec/core/formatters/text_mate_formatted-1.8.7-jruby.html", "spec/rspec/core/formatters/text_mate_formatted-1.8.7.html", "spec/rspec/core/formatters/text_mate_formatted-1.9.1.html", "spec/rspec/core/formatters/text_mate_formatted-1.9.2.html", "spec/rspec/core/formatters/text_mate_formatter_spec.rb", "spec/rspec/core/hooks_filtering_spec.rb", "spec/rspec/core/hooks_spec.rb", "spec/rspec/core/kernel_extensions_spec.rb", "spec/rspec/core/let_spec.rb", "spec/rspec/core/metadata_spec.rb", "spec/rspec/core/option_parser_spec.rb", "spec/rspec/core/pending_example_spec.rb", "spec/rspec/core/rake_task_spec.rb", "spec/rspec/core/reporter_spec.rb", "spec/rspec/core/resources/a_bar.rb", "spec/rspec/core/resources/a_foo.rb", "spec/rspec/core/resources/a_spec.rb", "spec/rspec/core/resources/custom_example_group_runner.rb", "spec/rspec/core/resources/formatter_specs.rb", "spec/rspec/core/resources/utf8_encoded.rb", "spec/rspec/core/ruby_project_spec.rb", "spec/rspec/core/runner_spec.rb", "spec/rspec/core/shared_example_group_spec.rb", "spec/rspec/core/subject_spec.rb", "spec/rspec/core/world_spec.rb", "spec/rspec/core_spec.rb", "spec/ruby_forker.rb", "spec/spec_helper.rb", "spec/support/matchers.rb", "specs.watchr"]
  s.homepage = %q{http://github.com/rspec/rspec-core}
  s.post_install_message = %q{**************************************************

  Thank you for installing rspec-core-2.0.0

  Please be sure to look at Upgrade.markdown to see what might have changed
  since the last release.

**************************************************
}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rspec}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{rspec-core-2.0.0}
  s.test_files = ["features/README.markdown", "features/command_line/configure.feature", "features/command_line/example_name_option.feature", "features/command_line/exit_status.feature", "features/command_line/line_number_appended_to_path.feature", "features/command_line/line_number_option.feature", "features/command_line/rake_task.feature", "features/configuration/custom_settings.feature", "features/configuration/fail_fast.feature", "features/configuration/read_options_from_file.feature", "features/example_groups/basic_structure.feature", "features/example_groups/shared_example_group.feature", "features/filtering/exclusion_filters.feature", "features/filtering/inclusion_filters.feature", "features/filtering/run_all_when_everything_filtered.feature", "features/formatters/custom_formatter.feature", "features/hooks/around_hooks.feature", "features/hooks/before_and_after_hooks.feature", "features/hooks/halt.feature", "features/metadata/described_class.feature", "features/mock_framework_integration/use_flexmock.feature", "features/mock_framework_integration/use_mocha.feature", "features/mock_framework_integration/use_rr.feature", "features/mock_framework_integration/use_rspec.feature", "features/pending/pending_examples.feature", "features/spec_files/arbitrary_file_suffix.feature", "features/subject/attribute_of_subject.feature", "features/subject/explicit_subject.feature", "features/subject/implicit_subject.feature", "features/support/env.rb", "spec/autotest/failed_results_re_spec.rb", "spec/autotest/rspec_spec.rb", "spec/rspec/core/command_line_configuration_spec.rb", "spec/rspec/core/command_line_spec.rb", "spec/rspec/core/command_line_spec_output.txt", "spec/rspec/core/configuration_options_spec.rb", "spec/rspec/core/configuration_spec.rb", "spec/rspec/core/deprecations_spec.rb", "spec/rspec/core/drb_command_line_spec.rb", "spec/rspec/core/example_group_spec.rb", "spec/rspec/core/example_spec.rb", "spec/rspec/core/formatters/base_formatter_spec.rb", "spec/rspec/core/formatters/base_text_formatter_spec.rb", "spec/rspec/core/formatters/documentation_formatter_spec.rb", "spec/rspec/core/formatters/helpers_spec.rb", "spec/rspec/core/formatters/html_formatted-1.8.6.html", "spec/rspec/core/formatters/html_formatted-1.8.7-jruby.html", "spec/rspec/core/formatters/html_formatted-1.8.7.html", "spec/rspec/core/formatters/html_formatted-1.9.1.html", "spec/rspec/core/formatters/html_formatted-1.9.2.html", "spec/rspec/core/formatters/html_formatter_spec.rb", "spec/rspec/core/formatters/progress_formatter_spec.rb", "spec/rspec/core/formatters/snippet_extractor_spec.rb", "spec/rspec/core/formatters/text_mate_formatted-1.8.6.html", "spec/rspec/core/formatters/text_mate_formatted-1.8.7-jruby.html", "spec/rspec/core/formatters/text_mate_formatted-1.8.7.html", "spec/rspec/core/formatters/text_mate_formatted-1.9.1.html", "spec/rspec/core/formatters/text_mate_formatted-1.9.2.html", "spec/rspec/core/formatters/text_mate_formatter_spec.rb", "spec/rspec/core/hooks_filtering_spec.rb", "spec/rspec/core/hooks_spec.rb", "spec/rspec/core/kernel_extensions_spec.rb", "spec/rspec/core/let_spec.rb", "spec/rspec/core/metadata_spec.rb", "spec/rspec/core/option_parser_spec.rb", "spec/rspec/core/pending_example_spec.rb", "spec/rspec/core/rake_task_spec.rb", "spec/rspec/core/reporter_spec.rb", "spec/rspec/core/resources/a_bar.rb", "spec/rspec/core/resources/a_foo.rb", "spec/rspec/core/resources/a_spec.rb", "spec/rspec/core/resources/custom_example_group_runner.rb", "spec/rspec/core/resources/formatter_specs.rb", "spec/rspec/core/resources/utf8_encoded.rb", "spec/rspec/core/ruby_project_spec.rb", "spec/rspec/core/runner_spec.rb", "spec/rspec/core/shared_example_group_spec.rb", "spec/rspec/core/subject_spec.rb", "spec/rspec/core/world_spec.rb", "spec/rspec/core_spec.rb", "spec/ruby_forker.rb", "spec/spec_helper.rb", "spec/support/matchers.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec-expectations>, [">= 2.0.0"])
      s.add_development_dependency(%q<rspec-mocks>, [">= 2.0.0"])
      s.add_development_dependency(%q<cucumber>, [">= 0.5.3"])
      s.add_development_dependency(%q<autotest>, [">= 4.2.9"])
      s.add_development_dependency(%q<syntax>, [">= 1.0.0"])
      s.add_development_dependency(%q<flexmock>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
    else
      s.add_dependency(%q<rspec-expectations>, [">= 2.0.0"])
      s.add_dependency(%q<rspec-mocks>, [">= 2.0.0"])
      s.add_dependency(%q<cucumber>, [">= 0.5.3"])
      s.add_dependency(%q<autotest>, [">= 4.2.9"])
      s.add_dependency(%q<syntax>, [">= 1.0.0"])
      s.add_dependency(%q<flexmock>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec-expectations>, [">= 2.0.0"])
    s.add_dependency(%q<rspec-mocks>, [">= 2.0.0"])
    s.add_dependency(%q<cucumber>, [">= 0.5.3"])
    s.add_dependency(%q<autotest>, [">= 4.2.9"])
    s.add_dependency(%q<syntax>, [">= 1.0.0"])
    s.add_dependency(%q<flexmock>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
  end
end
