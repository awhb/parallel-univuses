Hello <i>Player</i>. 
It seems like you'd like try out a life different from your current one. 

You've come to the right place.

What is your name?
-> Choosing_name
// need to find a variable to accept user_input
== Choosing_name ==
* [Putin] -> Name_confirmation_Putin
* [Bob] -> Name_confirmation_Bob

== Name_confirmation_Putin ==
That's so funny! Pick again.#Putin
//{&Is that a joke?| Very funny!|Poor Ukraine!|Boo!}
-> Choosing_name

== Name_confirmation_Bob ==
You're Bob, is that right?
* [Yes] -> Continue_with_Bob
# colour it blue
* [No] -> Choosing_name


== Continue_with_Bob ==
Hello Bob. It's great to finally meet you. It's been a long time since I've met a human like you. 
-> Probe_further

== Probe_further == 
Tell me, what do you plan to study?
* Computer Science[?]! -> Praise_the_player
* Law[?]! -> Praise_the_player
* Engineering? -> Praise_the_player
* [I love the arts!] Yes! The Arts! -> Praise_the_player
* I only know how to compose epic poetry and am a video game expert. -> END
* I'm really not sure yet. -> Console_the_player

== Praise_the_player == 
That's perfect! I'm sure you'll be a great fit, given your tenacity and disposition. 
-> Praise_the_player_more

== Console_the_player ==
That's alright! I wouldn't worry too much! Time does magical things beyond even my comphrension. 
-> Praise_the_player_more

== Praise_the_player_more == 
I can't wait to see the things you'll achieve. Remember. You only have one life, and it's alright to make mistakes, and no matter the outcome, we're immensely proud of you. It wasn't easy. 
-> END


