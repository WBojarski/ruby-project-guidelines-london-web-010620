require'pry'
    def enter_name
        puts "enter your name!"
        name_input = gets.chomp
        name_input
    end
    
    def enter_birthdate
        puts "enter your birthday!"
        dob_input = gets.chomp
        dob_input
    end
    
    def enter_email
        puts "enter your email!"
        email_input = gets.chomp
        email_input
    end


# def invalid_input
#     puts "invalid input please try again"
#     if enter_name == nil || enter_name == " "
#         enter_name
#     elsif enter_birthdate == nil ||enter_birthdate == " "
#         enter_birthdate
#     elsif enter_email == nil || enter_email == " "
#         enter_email
#     else
#         get_user_info
#     end
# end

#def create_new_userend
