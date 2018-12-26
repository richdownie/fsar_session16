namespace :build do
  desc "Launch all cuke builds"
  task :all do
    threads = []
    %w{build:chrome build:firefox build:safari}.each do |cuke_tag|
      threads << Thread.new(cuke_tag) do |thread|
        Rake::Task[thread].execute
      end
    end
    threads.each { |thread| thread.join }
  end

  desc "Run cukes in a chrome browser"
  task :chrome do
      console_output = ""
      IO.popen("cucumber BROWSER=chrome", 'r+') do |pipe|
        puts console_output = pipe.read
        pipe.close_write
      end
  end

  desc "Run cukes in a firefox browser"
  task :firefox do
      console_output = ""
      IO.popen("cucumber BROWSER=firefox", 'r+') do |pipe|
        puts console_output = pipe.read
        pipe.close_write
      end
  end

  desc "Run cukes in a safari browser"
  task :safari do
      console_output = ""
      IO.popen("cucumber BROWSER=safari", 'r+') do |pipe|
        puts console_output = pipe.read
        pipe.close_write
      end
  end
end
