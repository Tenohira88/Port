#-----------------------------------------------------------------------
Wcdonald <- function(){
  print("Welcome to Wcdonald take away")
  print("Our menu")
  print(c("Burger, Fries, Coke, Ice-cream, Coffee, Milkshake"))
  food = list()
  ##1
  while(TRUE){
    order <- readline("What would you like to order?: ")
    if(order == "next"){
      print("Your Orders")
      print(food)
      ##2
      check <- readline("Are your orders correct?(Yes,No): ")
      if (check == "No"){
        print("Please try again")
        stop()
      } else {
        break
      }
    }else{
      food <- append(food,order)
      print("If you finish ordering, please enter 'next'")
      print(c("Burger, Fries, Coke, Ice-cream, Coffee, Milkshake"))
    }
  }
  ##3
  cutlery <- readline("Would you like plastic cutlery?(Yes,No): ")
  if(cutlery == "No"){
    print("Thank you for helping us save the world")
  }else{
    print("We will get them ready")
  }
  ##4  
  print("Available option -> (Pickup), (Delivery)")
  choice <- readline("Which services would you like?: ")
  if(choice == "Pickup"){
    ##5
    timeP <- readline("When will you arrive? (13:00, 20:00, etc.): ")
    print("Thank you for choosing us")
    print(paste("You can pick your order up on",timeP))
  }else{
    timeD <- readline("When do you expect your order? (13:00, 20:00, etc.): ")
    print("Thank you for choosing us")
    print(paste("Your order will be arrived on",timeP))
  }
}  

#-----------------------------------------------------------------------
chub <- function(){
  score <- c(0,0,0)
  while(TRUE){
    options <- c("Rock","Paper","Scissors")
    computer_options <- sample(options,1)
    print(options)
    print("Type 'exit' to leave")
    user_select <- readline("Choose one of three: ")
    result <- c("win","lose","tie")
    
    if(user_select == "exit"){
      print(df)
      print("Thank you for playing")
      break
    } else if(user_select == computer_options){
      print("RESULT:TIE")
      score[3] <- score[3]+1
    } else if (user_select == "Rock" & computer_options == "Scissors"){
      print("RESULT:YOU WIN")
      score[1] <- score[1]+1
    } else if (user_select == "Paper" & computer_options == "Rock"){
      print("RESULT:YOU WIN")
      score[1] <- score[1]+1
    } else if (user_select == "Scissors" & computer_options == "Paper"){
      print("RESULT:YOU WIN")
      score[1] <- score[1]+1
    } else {
      print("RESULT:YOU LOSE")
      score[2] <- score[2]+1
    }
    df <- data.frame(result,score)
  }
}
