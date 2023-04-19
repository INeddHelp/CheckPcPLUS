require 'sys/proctable'
procs = Sys::ProcTable.ps()

print "Do you want to save the log file? (Y/N): "
save_log = gets.chomp.downcase == 'y'

if save_log
  log_file_path = File.join(File.expand_path('~/Desktop'), 'processes.log')
  File.open(log_file_path, 'w') do |f|
    procs.each do |p|
      f.write("Process ID: #{p.pid}\n")
      f.write("Command line: #{p.cmdline}\n")
      f.write("Memory usage: #{p.rss} KB\n")
      f.write("---------------------\n")
    end
  end

  puts "Log file saved to #{log_file_path}"
else
  puts "Log not saved"
end

procs.each do |p|
  puts "Process ID: #{p.pid}"
  puts "Command line: #{p.cmdline}"
  puts "Memory usage: #{p.rss} KB"
  puts "---------------------"
end
