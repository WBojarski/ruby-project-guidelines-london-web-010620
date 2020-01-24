require_relative "../config/environment"

def welcome_message
    puts CLIColorize.safe_colorize <<-'EOF'
    
    | |     / ___  / _________  ____ ___  ___     / /_____     / ____/ / / | |     / /
    | | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \   / __/ __ \   / / __/ /_/ /| | /| / / 
    | |/ |/ /  __/ / /__/ /_/ / / / / / /  __/  / /_/ /_/ /  / /_/ / __  / | |/ |/ /  
    |__/____\___/_/\___/\____/_/ /___/_/____/   \__/\____/   \______/ /_/  |__/|__/   
       / __ \___  ____  / /_____ _/ /  / __ \_________ ______/ /_(_________           
      / / / / _ \/ __ \/ __/ __ `/ /  / /_/ / ___/ __ `/ ___/ __/ / ___/ _ \          
     / /_/ /  __/ / / / /_/ /_/ / /  / ____/ /  / /_/ / /__/ /_/ / /__/  __/          
    /_____/\___/_/ /_/\__/\__,_/_/  /_/   /_/   \__,_/\___/\__/_/\___/\___/ 
    

    EOF
    puts CLIColorize.safe_colorize("----------------------------------------------",:red)
    puts CLIColorize.safe_colorize("We are here to help you 24/7! No pain no gain!",:blue)
    puts CLIColorize.safe_colorize("----------------------------------------------\n\n",:red)
end

def run
    puts CLIColorize.safe_colorize(welcome_message, :blue)
    register_login    
end
run
