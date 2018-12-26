namespace :build do
  desc "Run all scenarios in a chrome browser"
  task :chrome do
      console_output = ""
      IO.popen("cucumber BROWSER=chrome", 'r+') do |pipe|
        puts console_output = pipe.read
        pipe.close_write
      end
  end

  desc "Run all scenarios in a firefox browser"
  task :firefox do
      console_output = ""
      IO.popen("cucumber BROWSER=firefox", 'r+') do |pipe|
        puts console_output = pipe.read
        pipe.close_write
      end
  end

  desc "Run all scenarios in a safari browser"
  task :safari do
      console_output = ""
      IO.popen("cucumber BROWSER=safari", 'r+') do |pipe|
        puts console_output = pipe.read
        pipe.close_write
      end
  end

  desc "Launch all browser builds"
  task :all do
    threads = []
    %w{build:chrome build:firefox build:safari}.each do |cuke_tag|
      threads << Thread.new(cuke_tag) do |thread|
        Rake::Task[thread].execute
      end
    end
    threads.each { |thread| thread.join }
  end
end
