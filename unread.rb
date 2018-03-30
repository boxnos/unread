#!/bin/env ruby

require 'date'
require 'csv'

$program = File.basename(__FILE__)

def usage(status=0)
  puts "Useage: #{$program} command ..."
  puts
  puts "#{$program} add title page [date]"

  exit status
end

def error(message)
  puts "#{$program} #{message}"
  usage 1
end

def main()
  if ARGV.length < 1
    usage
  end

  case ARGV.shift
  when "add"
    if ARGV.length < 2
      error "argument error [add]"
    end

    title = ARGV.shift
    page = ARGV.shift
    date = Date.today

    # TODO can't open new book
    csv_filename = "./data/#{title}.csv"
    table = CSV.read(csv_filename)

    # TODO search same date and update page
    table.unshift [date, page]

    CSV.open(csv_filename, "w") do |csv|
      table.each do |line|
        csv << line
      end
    end
  else
    error "undefined command"
  end

end

main
