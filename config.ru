Dir.glob('./{config,controllers,models}/init.rb').each do |file|
  require file
end

run TaskAPI
