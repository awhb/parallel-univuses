VAR social_life = 0
VAR grades = 0
VAR CCAs = 0
VAR side_hustle = 0

Wake up?
*[Yes] -> Attend_ori
*[No] -> Skip_orientation_entirely

== Skip_orientation_entirely
You wake up three hours later, at 11am. Staring at the walls of your humble bedroom. You glance at the packed bag in the corner, but your mind wanders as the sunlight reminds you that you're feeling a little hungry. You check your phone to see a message from your orientation group leader:
"Hi! We're meeting a the foyer, will you be reaching soon?"
* [Ignore him] -> Screw_ori
* [Reply and say you'll be there after lunch] -> Attend_ori

= Screw_ori
You decide, your life is yours to choose and decide. You have priorities, and orientation ain't one of them. You tumble out of bed and grab a meal from the coffeeshop downstairs and start to wonder what to do with the entire week you just freed up. 
* [Think about meeting your close friends before you lose your social life forever] -> Meet_friends
* [Go to your computer and sort out your adulting activities] -> Sort_adulting

= Meet_friends
A smile and a nod as you say wassup. Dabbing it up, you reminicise the days of National Service, and have a hearty mala. You laugh about the amount of time you had before school started, and how it feels surreal now. He smiles and nods in agreement. 

You both look off into the distance wistfully, wondering how much life will change when university starts. 
 * [A week flies by] ->  Start_Uni

= Sort_adulting
You open your computer and check on your financial investments. Hm, TSLA dropped. You wryly think about the days when you foolishly saved for months to buy a TSLA stock, only for it to be steadly decreasing in market value. You glance at your email inbox: "50% off DBS account holders for flights to Thailand". You then wonder, if it's fate.
* [Spontaneously book a ticket for tomorrow since you don't have orientation to worry about] -> Backpack_baby
* [Roll your eyes and hit the gym] -> Pump_iron_noob
* [Read a book] -> Read_ori

= Read_ori
You pick up Dale Carnegie's "How to Make Friends and influence people", promising to yourself that you'll finish it before school starts, or you might really end up having no friends. 
* [A week flies by] -> Start_Uni

= Backpack_baby
You grin stupidly as you walk out of baggage claim, with your trusty 45L backpack on you. Taking a deep breath, you venture forth out into the hot humid air ready to take on Thailand for the week. Who needs orientation anyway?
* [A week flies by and you acquire a good tan] -> Start_Uni

= Pump_iron_noob
Eleven, twelve. YEAH BUDDY. LIGHTWEIGHT! You wonder to yourself as you gnash your teeth finishing your last rep. You look in the mirror and flex, but you get weird stares. You then remind yourself to wear long pants in the future.
* [A week flies by and you feel at ease with your body] -> Start_Uni

== Attend_ori
Attend ori like a fool.
-> Start_Uni

== Start_Uni
Uni starts. Today is the first day of your tutorials, and you wonder if you'll make any friends at all. People say that it's hard to make friends in university, much less Business School. 

02-24, 02-23. No. Retrace footsteps. 02-25, 02-26, 02-27. That's it. BSP1703. Managerial Economics tutorial. For some reason, you become aware of a tightening in your chest, and a little tiredness overtake you. You take a deep breath, looking around for anyone who might be watching, straighten your back and walk into your first tutorial.

You take a seat near the middle of your class, and listen to your professor introduce himself. 
* [Struggle to stay awake] -> End_class

= End_class
The class has been relatively easy, given your Economics knowledge you had prior. During the class, you notice your seat mate had been doing nothing but doodling and drawing cats. Siu. That was his name. Pretty dank name, you think to yourself.
* [Ask his name anyway] "What's your name bro?" You ask. 
-> Siu_introduction

= Siu_introduction
I'm Siu, he replies. What's yours?
* [I'm Tyler] You reply I'm Tyler -> Siu_friendship
* [Guess my name] -> Guess_name
* [Continue packing] -> Siu_friendship

=Guess_name
He looks at you quizzically. And then breaks into a smile. "That's a first," he says. 

You decide to introduce yourself properly before things get weird. -> Siu_friendship

= Siu_friendship
He continues packing, then pauses. "Yo Tyler, do you wanna grab a meal after this?" 
* [Reply "Yeah, why not?"] -> Eat_meal_Siu
* [Leave without a word] With that you leave. -> Go_home

= Eat_meal_Siu
At the Deck, you are surprised to find out that he went to the same camp as you in National Service. As you part ways, you exchange contact and promise to see each other in the next class. 
-> Settling_into_school_reflection
= Go_home
Ah! You exclaim as you plop down on your bed. You wonder if you just closed off your first social interaction. You feel a little regret, but shrug it off and take an afternoon nap. 
-> Settling_into_school_reflection

== Settling_into_school_reflection
A couple of days have passed. You realise that finding friends is hard. They require effort, some luck and chemistry. You also make a mental note this weekend to spruce up your wardrobe. The dresscode here is something else. 

Living off campus is hard too. You notice that there are a lot of business school students that come from hall, having form cliques during orientation. You find it difficult to talk to them or make friends, and feel like you're missing out on the student life that everyone has raved about. 

// However, you remember that living expenses are expensive, and your parents have to help to fork out extra. On the bright side, your weekly expenditure looks promising, as you have been eating at home. You put the thought aside and decide to make a more conscious effort to make do with what you have. 

You check your mail and remember that CCAs are a thing. Do you want to consider them?

* [Yes] You glance at your inbox and see numerous intake emails for NUS-wide CCAs, and even the BizAd EXCO. -> Choose_CCA
* [No] You shrug and figure that nothing would really interests you. -> Ignore_post_reflection

=Choose_CCA
You narrow it down to a few, related to your future prospects. You've been a climber for over 5 years to some degree of success. But you wonder if you want to try out something new. 
* Apply for NUS Climbing -> Apply("Climbing")
* You have always wanted to try out Takewondo -> Apply("Takewondo")
* You have always wanted to try out Marketing, so you want to try to apply for a Marketing role with NUS BizAd -> Apply("BizAd")

= Apply(CCA)
You are accepted into {CCA}! Hurray!
-> END

== Ignore_post_reflection
Unmotivated and feeling tired from school already, you take a nap. 

Just like that, weeks pass. Since classes in Business are relatively sparse, you find yourself mostly at home, spending your time playing computer games. Although you spend plenty of time alone, you feel strangely at ease. This is the life you have chosen, and no one can stop you. With the amount of free time you have, you are able to ace many quizzes and presentations for your module. 

One day during the routine meals you have been having Siu, he asks you: "Do you plan to do anything else this semester? Join a CCA, find a girlfriend, start something of your own?"
* "Not really[."]", you reply. I am happy where I am. I want to keep my grades where they are, spend time with my family, and my close friends. 
-> Mid_terms
* "Yeah, maybe. I'll think about it." -> Reconsider_commitments

= Reconsider_commitments
You return home and decide to draw out a chart. 
Social life, grades, side hustle, sleep. A girlfriend? Are these the things that everyone wants?. You remember the girl you accidentally locked eyes with during Decision Analytics class (DAO1704). You panicked and looked away, but you remembered she did the same. 

Not thinking too much of it, you take a good long think about your seemingly insignificant list of priorities. Pick one to pursue for now. 
* [Get to know that girl] -> Pursue_girl
+ [Get into climbing again with NUS Climbing] You're a little late for the application, you discover. -> Reconsider_commitments
+ [Apply for BizAd EXCO] You're a little late for the application, you discover. -> Reconsider_commitments
* Start a side-hustle -> Side_hustle
* Try to get more sleep -> Enough_sleep

= Enough_sleep
You have been getting enough sleep, but you fall asleep before you can think further. 
-> Mid_terms

= Pursue_girl
You take a deep breath. It's been awhile since you've really considered dating someone. The last time you liked someone it ended up as a train wreck. But now you're in a much better place now. You started taking care of yourself, began reading more again, and continued to keep your grades up. 

Maybe, things might work out well. You remember hearing from Siu that she was one of the heads of Takewondo, and heavily involved in BizAd, while maintaining a great CAP. You ask yourself if you really want to go for it. 
* [You only live once]"I only live once right?" You think, and settle on your decision.
-> Pursue_girl_cont
* Maybe I'll just focus on myself -> Focus_on_self

=Focus_on_self
You focus on yourself.
-> END

= Pursue_girl_cont
The next week comes agonisingly slowly. On tutorial day, you muster some miraculous confidence as class ends. Before she walks out, you ask: 

"Hey, can I ask you something? 

Did you look at the assignment on Decision Trees?"

She flashes a confused smile. She says "Dude, it's crazy, I don't get it either. I'm two weeks behind."

Without missing a beat you answer: 
* [Dammit... Uh... Wanna work on it after class?] She laughs at your silly attempt. You realised you fooled no one. She then meets your gaze and agrees 

-> Find_out_after_class
* [Ah, never mind then. Wait sorry, what's your name?] Her eyes crinkle into a wry and suspicious smile. I'm Marie. You? -> Find_out_after_class

= Find_out_after_class
After introducing each other, you both agree to have lunch at the Deck, where you get to know each other. You realise that she is heavily involved in school activities, and also stays on campus. 

"So are you involved in school activities?"
{ 
- CCAs > 0:
-> Interested
- else:
-> Not_interested
}

= Interested
"Yeah! you reply." You excited tell her about the events you are trying to plan, and admit that work is bogging you down a little. She looks surprised, and you sense you're on the right track. 
-> END

= Not_interested
"Not really." You say. 

Adding, "I usually just play computer games at home."

"Ah, I see." She looks a little crestfallen. You, an empath, realised it might have been something you said.

Uneventfully, both of you work on the assignment together after, and manage to finish it. She thanks you for your help and leaves. 
-> END

= Side_hustle
You open a website and dips 
-> END

= Mid_terms
Mid-term arrives before you know it. 
-> END








