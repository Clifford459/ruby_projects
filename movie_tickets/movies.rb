def movie(card, ticket, perc)
   ticket_count = 0
       system_A = 0
       system_B = 0
   
   until system_A + card <= system_B do
                system_A = (system_A + ticket) * perc
                system_B += ticket
            ticket_count += 1
   end
   
   return ticket_count
   end   #Die een werk.
