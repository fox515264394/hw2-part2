require 'sqlite3'
load  'hw22.rb'


def get_choice 
    puts "\n1--Add"
    puts "2--Delete"
    puts "3--Modify"
    puts "4--View all"
    puts "0--Quit"
    puts "Please make your move:"
    STDOUT.flush

    _choice = gets.chomp
    return _choice
end

def add_item
    puts "\nPlease input the Title?"
    _title = gets.chomp
    puts "What's the due date?"
    _due_date = gets.chomp
    puts "Status is?"
    _status = gets.chomp
   
    Reminder.new(:title =>_title, :due_date =>_due_date, :status => _status).save
    puts "Successfully added a reminder:)"
    STDOUT.flush
end

def delete_item
    puts "\nPlease enter the title id:"
    _id= gets.chomp
    if Reminder.find(_id)
        Reminder.find(_id).destroy
    else
        puts "No such record"
    end
end

def alter_item
    puts "\nPlease enter the title id"
    _id = gets.chomp
    record = Reminder.find(_id)
    puts record.inspect 

    puts "Re-enter title:"
    _title = gets.chomp
    puts "Re-enter due date?"
    _due_date = gets.chomp
    puts "Re_enter status?"
    _status = gets.chomp

    Reminder.update(_id,:title=>_title,:due_date =>_due_date, :status=>_status)
end

def view_all
    if Reminder.count == 0
        puts "---No Reminders!"
    else
        puts "---All Records:"
        Reminder.all.each do |reminder|
            puts reminder.inspect
        end
    end
end

def choices(_choice)
    while _choice != "0" do
        case _choice
        when "1"
            add_item
        when "2"
            delete_item
        when "3"
            alter_item
        when "4"
            view_all
        else
            puts "Invalide choice"
        end
        _choice = get_choice
    end
    puts "Goodbye!\n"
end

def main
    puts "My Reminder!"
    choices(get_choice)
end

if __FILE__==$0
    main
end

