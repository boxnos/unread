#!/bin/env ruby

require 'date'
require 'csv'
require 'fileutils'

$program = File.basename(__FILE__)

def usage(status=0)
  puts "Useage: #{$program} command ..."
  puts
  puts "#{$program} list"
  puts "#{$program} init title"
  puts "#{$program} view title"
  puts "#{$program} add  title page [date]"

  exit status
end

def error(message)
  puts "#{$program} #{message}"
  usage 1
end

def check_argv(length=1)
  if ARGV.length < length
    error "arguments error."
  end
end

def get_csv_filename(title)
  "./data/#{title}.csv"
end

def read_table(title)
  CSV.read(get_csv_filename title)
end

def add()
  check_argv(2)

  title = ARGV.shift
  page = ARGV.shift
  date = Date.today

  # TODO can't open new book
  table = read_table title

  # TODO search same date and update page
  table.unshift [date, page]

  CSV.open(get_csv_filename(title), "w") do |csv|
    table.each do |line|
      csv << line
    end
  end
end

def main()
  check_argv

  case ARGV.shift
  when "add"
    add()
  when "init"
    check_argv
    FileUtils.touch(get_csv_filename ARGV.shift)
  when "view"
    check_argv
    pp CSV.read(get_csv_filename ARGV.shift)
  when "list"
    Dir.glob("./data/*.csv").each do |file|
      puts File.basename(file, ".csv")
    end
  else
    error "undefined command"
  end

end

main
