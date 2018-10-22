require "rubygems"
require "cucumber"
require "cucumber/rake/task"
require "parallel_tests"
require "cuke_sniffer"
require "report_builder"

namespace :timunsuri do
  Cucumber::Rake::Task.new do |t|
    t.cucumber_opts = %w{--format progress}
  end

  Cucumber::Rake::Task.new(:test, "Run Timunsuri Automation Test") do |t|
    # sample use: rake timunsuri:test t=@login REPORT_NAME=2
    t.cucumber_opts = ["-t #{ENV["t"]}"] unless ENV["t"].nil?
    t.cucumber_opts = ["features/#{ENV["f"]}"] unless ENV["f"].nil?
    t.profile = "rake_run"
  end

  desc "Parallel run"
  task :parallel do
    puts " ====== Parallel execution Start ========"
    abort "Failed to proceed, tags needed for parallel (t=@sometag)" if ENV["t"].nil?
    Rake::Task["timunsuri:clear_report"].execute
    Rake::Task["timunsuri:init_report"].execute

    begin
      system "bundle exec parallel_cucumber features/ -n 4 -o '-t #{ENV["t"]}'"
    rescue => exception
      p "Found error!"
      pp exception
    ensure
      p "======= After ========"
      p "merging report:"
      Rake::Task["timunsuri:merge_report"].execute
    end
  end

  task :clear_report do
    puts " ========Deleting old reports ang logs========="
    report_root = File.absolute_path("./report")
    FileUtils.rm_rf(report_root, secure: true)
    FileUtils.mkdir_p report_root
  end

  task :init_report do
    report_root = File.absolute_path("./report")
    ENV["REPORT_PATH"] = Time.now.strftime("%F_%H-%M-%S")
    p "about to create report #{ENV["REPORT_PATH"]}"
    FileUtils.mkdir_p "#{report_root}/#{ENV["REPORT_PATH"]}"
  end

  task :merge_report do
    # Merging all report found in the directory
    # sample usage `rake timunsuri:merge_report REPORT_PATH=2018-09-21_14-42-22`
    puts " =========:: Merging Report ::============="
    FileUtils.mkdir_p "report/output"
    options = {
      input_path: "report/#{ENV["REPORT_PATH"]}",
      report_path: "report/output/test_report_#{ENV["REPORT_PATH"]}",
      report_types: ["retry", "html", "json"],
      report_title: "timunsuri Report",
      color: "blue",
      additional_info: {"Browser" => "Chrome", "Environment" => ENV["BASE_URL"].to_s, "Generated report" => Time.now},
    }
    ReportBuilder.build_report options
  end

  task :run do
    # Before all
    Rake::Task["timunsuri:clear_report"].execute

    # Test 1
    Rake::Task["timunsuri:init_report"].execute
    system "rake timunsuri:test t=@login"

    # Test 2
    Rake::Task["timunsuri:init_report"].execute
    system "rake timunsuri:test t=@signup"

    # After all
    Rake::Task["timunsuri:merge_report"].execute
  end

  task :rerun do
    if File.size("report/#{ENV["REPORT_PATH"]}/rerun.txt") == 0
      puts "==== No failures. Everything Passed ========="
    else
      puts " =========Re-running Failed Scenarios============="
      system "bundle exec cucumber @rerun.txt -f pretty"
    end
  end

  task :police do
    sh "bundle exec cuke_sniffer --out html report/cuke_sniffer.html"
  end

  task :start_appium do
    puts "===== Installing Appium with NodeJS====="
    sh "npm install"
    sh " ./node_modules/.bin/appium > /dev/null 2>&1"
  end

  task parallel_run: [:clear_report, :init_report, :parallel]
end
