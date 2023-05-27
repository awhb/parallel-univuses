VAR player_name = ""
VAR popz = 0
VAR rizz = 0
VAR mug = 0

-> prologue

=== function alter(ref x, k) ===
	~ x = x + k

== prologue ==
Hey there. 
It seems like you'd like to try out a life different from your current one. 
If so, you've come to the right place.
-> choose_char

    = choose_char 
    Who would you like to be?
        + [Aaron in NUS FASS] -> confirmation("Aaron")
        + [Beth, NUS Computer Science] -> confirmation("Beth")
        + [Caelan, NUS Law] -> confirmation("Caelan")


    = confirmation(name)
    You're {name}, is that right?
    + [Yes] -> introduction(name)
    + [No] -> choose_char


    = introduction(name)
    #colour blue
    ~ player_name = name
    Hello {player_name}, I'm GuPTa. It's great to finally meet you. It's been a long time since I've met a human like you. #GuPTa
    -> probe_further

    = probe_further
    Tell me, what do you plan to study?
        * {player_name == "Aaron"} FASS[?]! -> praise
        * {player_name == "Beth"} Computer Science[?]! -> praise
        * {player_name == "Caelan"} [I love the arts!] Yes! The Arts! -> praise
        * (Idk) I'm really not sure yet. -> console
        
    = praise
    That's perfect! I'm sure you'll be a great fit, given your tenacity and disposition. 
    -> praise_more
    
    = console
    That's alright! I wouldn't worry too much! Time does magical things beyond even my comprehension. However, you've gotten a place as a {player_name == "Aaron": FASS | {player_name == "Beth": Computer Science | Law }} student in NUS, right?
        * [Yes.] -> praise_more
    
    = praise_more
    I can't wait to see the things you'll achieve. Remember. You only have one life, and it's alright to make mistakes, and no matter the outcome, we're immensely proud of you. It wasn't easy. 
    -> Orientation

== Orientation ==
Your alarm clock rings. You wake up, bleary-eyed.
    * Go back to sleep. -> DONE
    * Wake up. -> DONE


    
-> END

