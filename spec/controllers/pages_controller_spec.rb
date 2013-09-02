require "spec_helper"

describe PagesController do
  render_views

  let(:b) { @browser }

  it "tests performance" do
    Benchmark.bm do |x|
      options = { times: ENV["TIMES"], benchmark: x }
      run_click_test(options.merge(turbo: false))
      run_click_test(options.merge(turbo: true))
    end
  end

  def run_click_test(options)
    times = Integer(options[:times] || 100)
    benchmark = options.fetch(:benchmark)
    turbo = options.fetch(:turbo)

    b.goto page_path(1, turbo: turbo)
    3.times { b.link(text: "next").click }
    b.link(text: "beginning").click
    benchmark.report " turbolinks: #{turbo}" do
      times.times do
        b.link(text: "next").click
      end
    end    
  end

end