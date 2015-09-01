#puts a line of *
def separator
  puts "*" * 80
end

#Asks a question and displays answer options.
def ask_question(question, options)
  puts question, options
  gets.chomp.downcase
end

#Ask and wait for user to type enter to continue
def ask_wait_to_continue(question)
  puts question
  gets.chomp
end


separator
puts "Welcome to the fair. This is not the jungle, but we have fun and games."
separator
$num = 7 #initialize number for the player to guess
options = ["guess a number", "be amazed", "have a beer", "go home"]


#Mini guess a number game.
def guess_a_num
  begin
	  guess = ask_question("I'm thinking of a number between 0 and 10. Try to guess.", "Enter a number between 0 and 10..")
    separator
  end until guess.to_i <= 10 && guess.to_i >= 0


  begin
    if guess.to_i < $num
      guess = ask_question("My number is greater than that! Try again.", "Enter a number between 0 and 10.")
    elsif guess.to_i > $num
  	  guess = ask_question("My number is lower than that! Try again.", "Enter a number between 0 and 10.")
    end
  end until guess.to_i == $num

  puts "Great guess! My number was #{$num}!"

  #Change the number for next try
  if $num - 2 > 0
    $num -= 2
  elsif $num + 3 < 10
    $num += 1
  else
    $num = 5
  end

  separator
end


#Mini be amazed game.
def be_amazed
  yey_nay = ["yes", "no"]

  ask_wait_to_continue("Think of a number. Hit enter when you are done.")
  ask_wait_to_continue("Now add 4 to that number and multiply it by 2. Hit enter when you are done.")
  ask_wait_to_continue("Ok, ok. Let me concentrate. Subtract 6 and divide the result by 2. Hit enter when you are done.")
  ask_wait_to_continue("I think I can see into your mind now. Now subtract the number you thought of in the first place. Hit enter when you are done.")

  puts "Hahahaha! The result is ONE! Is that correct? (Yes or no)"
  y_n = gets.chomp.downcase

  if y_n == "yes"
    puts "I knew it!!!"
  else
    puts "You are just lying..."
  end

  separator
end


  #loop to keep going to the main menu until the user wants to leave or gets drunk.
begin
  quit = false

  #ask to choose an activity until a valid answer is typed by the user.
  begin
    activity = ask_question("What would you like to do now?", "Guess a number, be amazed, have a beer, go home.")
  end until options.include? activity
  separator

  #Flow control for choosing activity
  case activity
  when "guess a number"
    guess_a_num
  when "be amazed"
    be_amazed
  when "have a beer"
    if ask_question("Cheers!", "How many have you had?").to_i > 10
      puts "Go home, you are drunk."
      quit = true
    end
  when "go home"
    puts "That doesn't sound like fun. See ya!"
    quit = true
  end
end until quit == true
