%w[
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
].each { |path| Spring.watch(path) }
Spring.after_fork do
  ENV["DEBUGGER_STORED_RUBYLIB"]&.split(File::PATH_SEPARATOR)&.each do |path|
    next unless /ruby-debug-ide/.match?(path)
    load path + "/ruby-debug-ide/multiprocess/starter.rb"
  end
end
