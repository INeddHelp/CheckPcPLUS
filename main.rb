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
      ports = `lsof -i -P -n -p #{p.pid} | grep LISTEN | awk '{print $9}'`
      f.write("Port(s) used: #{ports}\n")

      f.write("---------------------\n")
      puts "Done"
    end
  end

  puts "Log file saved to #{log_file_path}"
else
  puts "Log not saved"
end
