#!/bin/env ruby

require 'date'
require 'csv'

def main()
  if ARGV.length < 2
    puts "Useage: #{File.basename(__FILE__)} title page [date]"
    exit
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
end

main
