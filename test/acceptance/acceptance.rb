#!/usr/bin/env ruby
# coding: utf-8

current_dir = File.dirname(File.expand_path(__FILE__))

# All acceptance test files begins with 'at_'
acceptance_test_files = Dir["#{current_dir}/at_*"]

# Load each acceptance test file making
# all tests to be run
acceptance_test_files.each { |file| load file }

# Print a report

report = <<EOF

===
Well done!

Below you have a report with all the answers you gave.
It has also some environment information to help us debugging.

If any of the tests have not passed on your environment,
please copy/past the text bellow and send to us.

If you are familiar with GitHub you can report the failing test
as a GitHub issue at https://github.com/JEG2/highline/issues.
If possible, always check if your issue is already reported
by someone else. If so, just report that you are also affected
on the same alredy open issued.

If you are more confortable with e-mail, you could send it to
james@grayproductions.net

=== HighLine Acceptance Tests Report
Date: #{Time.now.utc}
HighLine::VERSION: #{HighLine::VERSION}
Terminal: #{HighLine.default_instance.terminal.class}
RUBY_DESCRIPTION: #{RUBY_DESCRIPTION rescue 'not available'}
Readline::VERSION: #{Readline::VERSION rescue 'not availabe'}
ENV['SHELL']: #{ENV['SHELL']}
ENV['TERM']: #{ENV['TERM']}
ENV['TERM_PROGRAM']: #{ENV['TERM_PROGRAM']}

Answers:
#{HighLine::AcceptanceTest.answers_for_report}
EOF

puts report

timestamp = Time.now.strftime('%Y%m%d%H%M%S')
filename  = "highlinetests-#{timestamp}.log"

File.open "#{filename}", 'w+' do |f|
  f.puts report
end

puts
puts "You can also see the above information in"
puts "a timestamped file named #{filename}"
puts "at the current directory."
puts
