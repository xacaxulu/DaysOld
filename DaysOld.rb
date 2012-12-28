#This script solves the DayOld problem proposed at:
#http://www.javaranch.com/drive/3/index.jsp

require 'rubygems'
require 'date'


class DayFind

  def initialize
    @year = ""
    @month = ""
    @day = "" 
    birthdate_query	
  end

  def birthdate_query
    if @year.empty?
      puts "In what year were you born? (YYYY)"
      @year = gets.chomp
      year_validator(@year)
    elsif
      @month.empty?
      puts "In what month were you born? (MM)"
      @month = gets.chomp
      month_validator(@month)
    elsif
      @day.empty?
      puts "On what day were you born? (DD)"
      @day = gets.chomp
      day_validator(@day)
    end
  end

  def year_validator(year)
    if year.length == 4 && year.to_i != 0 && year.to_i.between?(1900,2012)
      birthdate_query
    else
      year.clear
      error
    end
  end

  def month_validator(month)
    if month.length == 2 && month.to_i != 0 && month.to_i.between?(1,12)
    birthdate_query
    else
			month.clear
    	error
    end 
  end

  def day_validator(day)
    if day.length == 2 && day.to_i != 0 && day.to_i.between?(1,31)
			next_method
    else
			day.clear
      error
    end
  end

  def next_method
    puts "You were born on #{@year}-#{@month}-#{@day} (YYYY-MM-DD)"
    if @day.to_i.between?(0,10)
      @day = @day.gsub(0,"")
    else
      @birthdate = Time.new(@year,@month,@day)		
      days_since(@birthdate)
    end
  end

  def days_since(birthdate)
    current_date = Time.new.to_date
    birthdate = birthdate.to_date
    @number_of_days = current_date - birthdate
    puts "You are #{@number_of_days.to_s.gsub(/\/[0-9]/, "")} days old!"
  end

  def error
    puts "----------------"
    puts "Please try again"	
    puts "----------------"
		
		birthdate_query
	end
end

###########
#SCRIPT

@dayfind = DayFind.new

