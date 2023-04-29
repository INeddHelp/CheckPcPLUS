# frozen_string_literal: true
require 'sys/proctable'

procs = Sys::ProcTable.ps

print 'Do you want to save the log file? (Y/N): '
save_log = gets.chomp.downcase == 'y'

if save_log
  puts 'This process might take a minute or so. Please wait...'
  log_file_path = File.join(File.expand_path('~/Desktop'), 'processes.log')
  File.open(log_file_path, 'w') do |f|
    procs.each do |p|
      f.write("Process ID: #{p.pid}\n")
      f.write("Command line: #{p.cmdline}\n")
      f.write("Memory usage: #{p.rss} KB\n")
      ports = `lsof -i -P -n -p #{p.pid} | grep LISTEN | awk '{print $9}'`
      f.write("Port(s) used: #{ports}\n")

      f.write("---------------------\n")
    end
  end

  puts "Log file saved to #{log_file_path}"
else
  puts 'Log not saved'
end

print 'Do you want to run a ClamAV scan and quarantine any viruses found? (Y/N): '
run_clamav = gets.chomp.downcase == 'y'

if run_clamav
  print 'Please enter your password for sudo: '
  password = gets.chomp

  puts 'Running ClamAV scan. This might take a while. Please wait...'
  `echo "#{password}" | sudo -S clamscan --move=/home/user/quarantine -r /`
end