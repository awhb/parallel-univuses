VAR player_name = ""
VAR Faculty = ""
VAR grades = 0
VAR consistency = 0
VAR leadership_roles = 0
VAR CCA_num = 0
LIST CCAs = floorball, climbing, squash, fintech, Hallcommittee, frisbee, band, band_wait, football_comp, football
VAR all_CCAs = ()
VAR interest_to_try = 0
VAR rizz = 0
VAR CCA_name = ""
VAR side_hustle = "side hustle"
VAR business_name = ""
VAR friends = 0
VAR sleep_amount = 0
VAR specialisation_choice = ""
VAR social = 0
VAR charm = 0
VAR discipline = 0
VAR your_CCAs = ()
VAR your_CCA = ""
LIST girls = Sophia, Adeline, Denise, Sarah
VAR love_interests = ()
VAR date = "Nobody"
VAR NUSC_SCORE = 0
VAR LAW_SCORE = 0
VAR attached = false

-> prologue
== prologue ==
Hey there. 
It seems like you'd like to try out a life different from your current one. 
If so, you've come to the right place.
-> choose_char

    = choose_char 
    Who would you like to be?
        + [Aaron in NUS FASS] -> confirmation("Aaron")
        + [Bess, NUS Computer Science] -> confirmation("Bess")
        + [Caelan, NUS Law] -> confirmation("Caelan")
        + [Daryl, NUS Business] -> confirmation("Daryl")


    = confirmation(name)
    You're {name}, is that right?
    + [Yes] -> introduction(name)
    + [No] -> choose_char


    = introduction(name)
    ~ player_name = name
    Hello {player_name}, I'm GuPTa. It's great to finally meet you. It's been a long time since I've met a human like you. 
    -> probe_further

    = probe_further
    Tell me, what do you plan to study?
        * {player_name == "Aaron"} FASS[?]! 
        ~ Faculty = "FASS"
        -> praise
        * {player_name == "Bess"} Computer Science[?]! 
        ~ Faculty = "Computer Science"
        -> praise
        * {player_name == "Caelan"} [Law!] Yes! Law! 
        ~ Faculty = "Law"
        -> praise
        * {player_name == "Daryl"} [Business!] Yes! Money! 
        ~ Faculty = "Business"
        -> praise
        * (Idk) I'm really not sure yet. -> console
        
    = praise
    That's perfect! I'm sure you'll be a great fit, given your tenacity and disposition. 
    -> praise_more
    
    = console
    That's alright! I wouldn't worry too much! Time does magical things beyond even my comprehension. However, you've gotten a place as a {Faculty} student in NUS, right?
        * [Yes.] -> praise_more
    
    == praise_more
    I can't wait to see the things you'll achieve. Remember. You only have one life, and it's alright to make mistakes, and no matter the outcome, I'm immensely proud of you. 
    
    {
    -player_name == "Aaron":
    * [Begin.]
    -> Orientation
    
    
    -player_name == "Bess":
    * [Begin.]
    -> Start_CompScience
    
    
    -player_name == "Caelan":
    * [Begin.]
    -> C_Choice
    
    
    -player_name == "Daryl":
    * [Start School.]
    -> Start_Business_School
    }
    
// AARON START

== Orientation ==
Your alarm clock rings. You wake up, but keeping your eyelids open takes an insane amount of effort. 
* [Go back to sleep.] -> Orientation_skip
* [Wake up.] -> Orientation_go
    
    = Orientation_go
    Remembering that a life without discipline leads nowhere, you get up and brush your teeth. Then it strikes you that as a Psychology Major you signed up for the NUS FASS Orientation, which began today. Pleased that you got up, you pack and leave to school on time.
    ~ discipline ++
    * [Orientation.] -> Orientation_1
    
    = Orientation_skip
    You sleep.
    ...
    ...
    You wake up at 10am in the morning, when the sun is too bright you can't sleep any longer. You look at your phone. Then you remember that as a Psychology Major you signed up for the NUS FASS Orientation, which had already started.
    
    Crap. 
    * [Still try to attend orientation] -> Orientation_Late
    * [Skip it.] -> School
    
    = Orientation_1
    You arrive at the venue mentioned in the orientation welcome email. You check your orientation group, and head to where it's supposed to be. Then you spot your OGL, wearing the camp shirt. You freeze in shock. It's your ex.
    
    * "Hey, Jessica".
        -> Bad_Impression
    * "Hey, Sophia."
        -> Awkward
    * "Hey, ..." [(what was it again?)] 
        -> Bad_Impression
    
    = Bad_Impression
    She smiles as though nothing has happened, but her eyes take on a scary look. "I'm Sophia."
    Oops. You cursed your bad memory. It's been two years, but...
    Why did you have such rotten luck?
    
    Throughout the rest of orientation, you could only pray no one noticed the tension between the two of you. You still made a few friends, though.
    ~social += 2
    
    * [Start of school.] -> School
    
    = Awkward
    You exchange pleasantries, but things settle into an awkward silence. At the first opportunity, you shift to the back of the group. Orientation activities continue, and you did have some fun, but...
    ~social += 2
    ~charm ++
    ~love_interests += Sophia
    
    * [Start of school.] -> School
    
    = Orientation_Late
    Finding your OGL's Telegram contact, you realise she's Sophia, your ex-girlfriend. And you had almost forgotten her name, too. You text her about being late, and were cooly told where to report. 
    
    You attend the rest of orientation after reaching the venue. You still make a few friends, though some cliques had already formed. 
    
    ~social ++
    * [Start of school.] -> School
    
    = School
    Week 0 passes in a whirl, and week 1 begins. You wake up at 9am to check Modreg for module allocation, and realise you were allocated a tutorial at 10am. You are still at home. It takes more than an hour to reach school.
    + [Skip class.] -> Confirmation_Social
    + [Hurry and attend.] -> Confirmation_Studies
    
    = Confirmation_Social
    You hesitate. Not attending the very first lesson of the term would likely make a bad impression, as well as being a predecent for more class-skipping. Continue?
    + [Yes.] -> Aaron_Social
    + [No.] -> School
    
    = Confirmation_Studies
    You hesitate. Even if you reached class, you'd already have missed half of it. You really don't see too much point in making the rush, and consider calling in sick instead. Continue with the decision anyway?
    + [Yes.] -> Aaron_Studies
    + [No.] -> School
    
    
    
== Aaron_Social ==
Being pragmatic about the situation, you call in sick to the tutor. Studies don't matter that much anyway, you think. Might as well spend the energy on finding the right CCAs and friends. 

    * [Student Life Fair.] -> SLF

    = SLF
    You visit the Student Life Fair later in Week 1. Visiting various CCA booths, you found quite a few CCAs appealing. What CCAs would you try for?
    * [Football.] 
        ~ your_CCAs += football
        -> SLF
    * [Ultimate Frisbee. ]
        ~ your_CCAs += frisbee
        -> SLF
    * [Amplified (a CCA for band performances).] 
        ~ your_CCAs += band
        -> SLF
    * {LIST_COUNT(your_CCAs) >= 2 } [That's all.]
        ->Week_2
        
    = Week_2
    Week 2 went a little faster than week 1, but you still had fun. 
    
    {your_CCAs has football: 
        You also attend football tryouts on Thursday night. The members seemed to get along well. You had a blast playing with them. You pray that you did well enough to be selected for the competitive team.
        ~social ++
        {social >= 2: 
            ~your_CCAs += football_comp
        }
    }
    * [Life goes on.]
    -> Before_Recess
    
    = Before_Recess
    Schoolwork begins to pile up, with the start of tutorials for some modules. 
    You go clubbing with your orientation friends, whom you've grown quite close to. Rocking your bodies to the beat never felt better after a boring week of school. You've started chatting with an ex-OG mate named Adeline over similar music interests. Her energy is endearing, and you do spot some initial signs of mutual affection, but you rather not commit this soon.
    ~love_interests += Adeline
    
    {your_CCAs has band: 
    You also begin attending Amplified sessions as a bassist. The regular practice pays off, and your musical skills have improved significantly. You've also formed a band with other freshmen and are enjoying the times you jam together.
        ~social ++
        ~charm ++
    }
    
    {   
        - your_CCAs has football_comp:
        You also got the happy news that you made it in to the football competitive team! Trainings are twice a week on Monday and Thursday nights, but you hardly mind; you would rather the break from schoolwork.
        ~social += 2
        ~charm ++
        
        - your_CCAs has football:
        You found out you didn't make it into the football competitive team, but it doesn't get you down for long because you know you tried your best. You still join in for the occasional game organised by your peers. 
        ~social ++
    }
    
    {
        - your_CCAs has frisbee:
        In addition, you join frisbee recreationally, and enjoy playing with other schoolmates in the late afternoon, after lessons.
        
        ~social ++
    }
    * [Recess week.] -> Recess_Week
    
    = Recess_Week
        The days go by, and recess week arrives. Deadlines loom for several assignments you've not spent much time on beforehand, so you rush the papers out by burning a few all-nighters. 
        
    {   
        - your_CCAs has football_comp:
        Your football team will also be participating in the Singapore University Games after recesss week, so you attend trainings scheduled during recess week. Between those and the projects, you begin to feel exhausted. 
        ~social ++
        ~discipline --
    }
    
    * [End of recess week.] -> Post_Recess
        
    = Post_Recess
        {
            - discipline < 0:
            Having spent little time on studying, you perform rather poorly for midterm assignments and tests. While classmates average A-s, you find yourself faced with Bs and even a B-. You feel embarrassed about your grades. 
            - discipline == 0:
            You've spent some time on studying, but things did not go as well as you'd hoped. You average a B+ grade across your modules, lower than your classmates.
            - else:
            Understanding the importance of discipline, you'd spent a little more effort during this period to buck up your grades. Your performance is not remarkable, but definitely nothing to scoff at with a mix of A-s and B+s.
        }
        
        But the tempo of life in university is heating up, and between the hectic lesson schedules and the tough assignments, you begin to buckle under the stress. Another person would wonder if you should have had this many non-acadmic commitments, but you just wonder if you should just S/U most of your modules this semester. 
        
        * [Just S/U] 
            ~discipline --
            -> Before_Finals
        * [No, study.]
            ~discipline ++
            -> Before_Finals
    
    = Before_Finals
        {
            - your_CCAs has football_comp:
            -> SUniG ->
        }
        The weeks fly by in a blur of lectures, tutorials, assignments and activities. Everyone begins to hunker down on their studies, and you follow suit. 
        
        Still, there are occasional episodes of fun: your OG organises a visit to Halloween Horror Nights, which you join. The queue was dreadfully long, and it took hours to enter, but the actual experience was quite okay. You took several cool pictures with the actors there. 
        
        { 
            - your_CCAs has frisbee:
            Though less people show up to frisbee now, given its recreational nature, you still go anyway. You start chatting with the seniors there, and they give good advice for exams. 
            ~discipline ++
            ~social ++
        }
        
        {   your_CCAs has band:
            Band practice continues at a relaxed pace. Strangely, you feel most at ease there, vibing to the music you play together. Your drummer, Denise, plays impressively every time. You find yourself slightly charmed by her musical skills. 
            
            ~love_interests += Denise
        }
        
    * [Finals.] -> Finals
        
    = Finals
    Getting through finals was exhausting. The various take-home assignments take till the thursday of reading week to complete, and there are still three papers you have to take. And you realised you're not a statistics person, so grinding through the papers was quite the horror.
    
    {
        - discipline <= 0: 
        Your low motivation to study resulted in a poor showing during the examinations. You would soon learn that your grades average out to an upsetting B-.
        - else:
        Your consistent efforts in disciplining yourself to focus on the right priorities pays off. You would soon learn that your grades average out to a B. Though it is not a bad result, you are not satisfied with it either.
    } 
    
    * [Winter break.] -> Winter_Trip

    = Winter_Trip
    
    The first week of winter break, you've arranged a trip to Shibuya, Japan with some pre-university friends. Cheerfully, you meet at the airport and board the flight. After landing, you check in to the planned hostel. 
    
    * [Try to have fun.] -> Winter_Trip_2
    
    = Winter_Trip_2
    Together with your friends, you visit various shops, eateries and attractions. Most are entertaining, but your mind often drifts towards your poor grades performance. You knew you were not very studious, but performing this poorly for the first semester of university, you wonder if you will even get honours when you graduate from NUS.
    
    One night, a buddy of yours asks you about it. "What's on your mind?"
    
    * [Tell him the truth.] -> Counselling
    * [Nope, nothing.] -> Avoidant
    
    = Avoidant
    "Nope, nothing." You say. Poor grades seemed like such a trivial worry to talk about with friends.
    "All right," he says. "If anything's weighing on your mind, try to not take the burden too hard on yourself."
    * [End of winter trip]-> Winter
    
    = Counselling
    You share your academic struggles with him. 
    "I see." He says. "I won't say grades aren't too important, but you can't neglect grades either. Play hard, but work hard also, yeah?"
    It was pretty lame advice that you already kind of knew, but you did feel relieved after sharing it with your friend. Your friend speaking the words aloud also helped you internalise them better.
    
    ~discipline += 2
    ~social ++
    * [End of winter trip]-> Winter
    
    = Winter 
    The trip overseas ends, and you return to Singapore. You apply for part-time jobs and are selected for two. Which would you prefer?
    
    * [Warehouse packer.] -> Warehouse
    * [Pet shop assistant.] -> Pets
    
    = Warehouse
    You opt for the late shifts to earn more, but it tires you out slightly. Work is tiring, but you get better at managing your time.
    ~discipline += 1
    
    * { social >= 4 } [Think about your love life.] 
    -> Love
    * { social < 4 } [Back to school.] 
    -> Semester_2
    
    = Pets
    You work at a large pet shop as an assistant, dealing with all sorts of pets. You find dogs adorable and would often play with them. You learn from the shopkeeper how to take better care of them.
    ~charm += 1
    
    * { social >= 4 } [Think about your love life.] 
    -> Love
    * { social < 4 } [Back to school.] 
    -> Semester_2
    
    = Love
        As time passes, you begin to feel the need for companionship and recall the girls you've talked to so far in the semester. Some of them seem to have good rapport with you. Perhaps your innate rizz could score you the right girl of your choice. 
    
        * { love_interests has Sophia && charm >= 2 } [Sophia, again.] 
        ~date = Sophia
        -> Date
        * { love_interests has Adeline && charm >= 2 } [Adeline.] 
        ~date = Adeline
        -> Date
        * { love_interests has Denise && charm >= 2 } [Denise.] 
        ~date = Denise
        -> Date
        * ->
            However, you haven't really met any girls that clicked with you during the past semester. Tough luck, buddy. 
            -> Semester_2

    
    = Date
    You innocuously start texting {date}, who reciprocates enthusiasm in her replies. The build-up pays off; you ask her out on a date, and she agrees. 
    
    { date == Sophia: 
        You meet at a good sushi restaurant near your places. Sophia sports a white crop top and a plaid skirt for a simple but attractive look. You remember orientation, and how much more relaxed she seems with you right now. While enjoying the meal, you end up discussing reasons for the previous breakup, and she clarifies that it was simply due to her choosing to prioritise her A levels, nothing more. You can tell that she is currently interested in you. 
        * [Success.] -> Semester_2
    }
    
    { date == Adeline:
        You meet at a good Italian restaurant in town. Adeline is dressed to impress, wearing a black blouse and skirt that tightly hug her outline. You talk about passions, hobbies and funny experiences. You find yourself entertained by her enthusiasm throughout, and her frequent laughter suggests it is mutual. You end up agreeing to watch the upcoming Marvel movie together. Though dinner was expensive, Adeline was willing to split the bill too.
        * [Success.] -> Semester_2
    }
    
    { date == Denise:
        You meet at a trendy cafe. Denise is dressed even more like a rock star than usual: baggy shirt and jeans with piercings on her nose and lips. You chat about favourite artists and bands, and find much in common. Finding out that a mutually liked band will be holding a live concert soon, you purchase tickets and agree to attend the concert together. 
        * [Success.] -> Semester_2
    }
    
    = Semester_2
    The weeks of winter break pass all too soon and school resumes. You have reflected over the holidays and realise that you should probably take on fewer commitments this semester to avoid flunking or burning out. 
    * [Drop football.] 
        ~ your_CCAs -= football
        ~social -= 1
        ~discipline += 1
        -> Semester_2
    * [Drop frisbee. ]
        ~ your_CCAs -= frisbee
        ~social -= 1
        ~discipline += 1
        -> Semester_2
    * [Drop Amplified.] 
        ~ your_CCAs -= band
        ~ your_CCAs += band_wait
        ~social -= 1
        ~discipline += 1
        -> Semester_2
    
    * {LIST_COUNT(your_CCAs) > 0 } [No more.]
        -> S2_precess
    
    * {LIST_COUNT(your_CCAs) == 0 } [I've dropped everything.]
        ~ charm -= 3
        -> S2_precess
    
    
    = S2_precess
    Your gut was right: all too quickly, you find yourself swamped with the heavy workload of level 2 core modules. 
    {
        - LIST_COUNT(your_CCAs) == 3 && your_CCAs has band: 
        Your choice to remain in all your CCAs leads to a tight, gruelling schedule. You barely have any time to spend on studies, let alone with your family{date != "Nobody": or {date}}.
        ~discipline -= 1
        ~social -= 1
        ~charm -= 3
        
        - else:
        Though you would have rather remained in the commitments you dropped, you know that practically speaking, you would not have had any time if you chose that path.{date != "Nobody": As the semester gets busy, you and {date} meet less often, but you still exchange encouraging texts from time to time.}
    }
    
    * [Recess Week.] -> Recess_Week_S2
    
    = Recess_Week_S2
    Recess week finally arrives.{ discipline >= 2: You are more mentally prepared for the grind for assignment submissions and test preparations, and though it isn't easy, you meet the deadlines. }{discipline < 2: Your commitments have you constantly on the move, leaving you little time to complete your assignments. You scrape by the submissions and revision with minimal effort. }
    {
        - date != "Nobody": 
            {date} asks you out on a date to the park, without more elaboration. You arrive and sit beside her. 
        {
            - charm < 0:
            She tells you she wants to break up. 
            Shocked by the news, you ask why, and she reveals that her feelings for you died during the semester with the little meetups you had. 
            You feel overwhelmed, and are at a loss for words. You leave, depressed. 
            ~date = "Nobody"
            ~social -= 1
            ~discipline -= 1
            
            - else:
            She asks you if you want to keep staying together. 
            "I love you." You say honestly. She seems touched by your statement. 
            You both complain about your busy schedules, laugh them off and cheer each other on. You leave, happier and more motivated than ever. 
            ~discipline += 1
        }
        
    }
    * [End of recess week.] -> S2_Second_half
    
    = S2_Second_half
    Recess week ends and midterms arrive. You get back your results.
    {   
        - discipline >= 4:
        Your study-life balance seems to have worked out. You score above the median in all your modules, which pleases you since you expected to do worse. You give yourself a mental pat on the back{date != "Nobody": and tell {date} the good news}.
        
        - else:
        With the little time you've spent studying, your grades take a dive. You score below the 25th percentile in most of your modules. You wonder what to tell your parents when they ask.
    }
    * [After midterms.] -> Encounter
    
    = Encounter
    
    You spend the weeks after midterms keeping up with schoolwork and graded projects, but also go for the occasional outing with your friends. Your OG meets less often now, but you have no lack of coursemates taking the same modules to hang out with. 
        {   
            - your_CCAs has band:
            Your band signs up to perform for Amplified's annual concert, held after finals. Everyone in the band agrees that it will be a nice round-off to the semester. 
        }
        { 
            - your_CCAs has band_wait:
                On the Friday of Week 8, Adrian, vocalist of the band you left earlier this semester, invites you for a drink. During the conversation, he reveals that the band wants to stage a performance at the annual Amplified concert after finals, and that they wanted you to join them.
                
            * [Accept.] 
            ~your_CCAs += band
            -> Finals
            
            * [Reject.]
            ~your_CCAs -= band_wait
            -> Finals
            
        }
        {   
            - your_CCAs has football:
            Football has wound down a notch this semester with competitions already over, so the frequency of sessions has decreased. You've made friends in the team, and you go down the same time every week to join them in a fun game before going out for dinner.
            ~social += 1
        }
        {   
            - your_CCAs has frisbee:
            You've made two friends in frisbee who share your major, but you meet up for schoolwork more often than for games. Discussions between you three have proved quite fruitful in helping you understand concepts taught during class.
            ~discipline += 1
        }
        { not (your_CCAs has band_wait): 
            * [Finals.] -> Finals_S2
        }
        
        = Finals_S2
        Reading week passes and finals (finally) arrive. You've put in the hours, and the adequate preparation pays off. You aren't stumped by too many questions, and are satisfied with your performance.
        * [Summer.] -> Summer
        
        = Summer
        {
            - your_CCAs has band:
            -> Performance ->
        }
        Having had the plan to unwind and explore during summer throughout the semester, you've booked a trip abroad with the same pre-university friends, this time a 3-week trip to Italy. {date != "Nobody": You've also asked {date} if she wants to spend a week together at Kuala Lumpur, and she's agreed. You're equally looking forward to both trips.}
        
        You've also joined the Orientation committee as an OGL for the incoming batch of freshmen. You want to enjoy orientation with them, and help them transition smoothly into university life. 
        
        Your year 1 life was filled with ups and downs, but looking back, you've had more fond memories than you have regrets. To you, experiencing life's different flavours has always came first, and you were satisfied with your freshman experience.
        -> END
        
        
        = Performance
        The end of finals signals the start of the summer break, but first came the Amplitude concert. Your fellow band members are as hyped as you are.
        
        Standing on stage and facing a live audience gave you an exhilarating thrill like never before. You rock to the songs you've rehearsed countless times over the weekly meetups, and everything seemed both clear and hazy at the same time. In the middle of the show, you get an epiphany: experiences like this are what'll stay with you for the rest of your life. 
        
        At the end of the concert, the band goes out for drinks. Everybody looks exhausted but unbelievably happy, complimenting each other and chatting about summer plans. You really hope you can stay on in the same band after summer. 
        * [Summer.] ->->
    
// SINGAPORE UNI GAMES SNIPPET

== SUniG == 
    After the constant trainings, the Singapore University Games finally begin. You've been given the role of attacking midfielder for your team. Your first game blazes off to an tense start with neither side able to score before half-time. You remain on the field in the second half.
    
    Suddenly, your marking pays off and you steal the ball from your target. You could pass it to your striker, or play for a goal yourself. Which do you go for?
    * [Pass.] -> Team_Player
    * [Try to score.] -> Egoist
    
    = Team_Player
        Ever the team player, you have faith in your striker and launch the ball towards him with a high kick. He catches the ball perfectly. Successfully distracting the opposing goalkeeper with a fake shot, he slots the ball into the opposite corner of the goalpost. The stand erupts. 
        
        Riding on the momentum from that goal, your team sweeps the enemy team. Everyone was all smiles after the game.
        
        ~ social ++
        * [Next game.] -> Subsequently
    
    = Egoist
        You take off towards the goal, confident in your ability to score. Your running is top-notch, and you use the dribbling tricks learned during training to slip past another defender. You end up before the goalpost, facing down the goalkeeper. You spot a gap in his left. Where do you shoot? 
        
        * [Left.] -> Blocked
        * [Right.] -> Score
        
        
    = Blocked
        It was a trick! The goalkeeper was ready to cover the hole once he spots your ball trajectory. Your shot rebounds and passes into the opposing team's possession. "You need more experience before the goalpost, mate. It's so obvious." Your striker, Adam, complains. 
        
        The match ends in a victory for your team, but only during the penalty kick shootout.
        
        * [Next game.] -> Subsequently
        
    = Score
        You suspect a trap, and do a fakeshot towards the left before shooting with your other foot towards the right. The goalkeeper falls for your trick, and the ball sails into the goalpost. The stand erupts in cheer.
        
        Your team members run up and hug you. "Amazing goal!" your striker, Adam, says. "Couldn't have done it better myself. You should try playing as striker sometime."
        
        Riding on the momentum from that goal, your team sweeps the enemy team. Everyone was all smiles after the game.
        ~ social ++
        ~ charm ++
        
        * [Next game.] -> Subsequently
    
    = Subsequently
        Though your team put on a strong showing in the next game, you were still trounced by the team from SIT, who had some of the most talented attacking players who had good mutual synergy. "They were all freshmen," Your coach complained. 
        
        Nonetheless, you were not too unhappy with your showing. You hope to join the team again at the next competition. 
        * [Back to school life.] ->->

// AARON STUDIES

== Aaron_Studies == 
You slap yourself mentally. You need to prioritise your grades, that's why you came to university after all: to get a degree. You call in to your tutor explaining the situation, and she accepts your apology. You make it to class 15 minutes late and learn about course expectations for the module you've taken. 

    * SLF. -> SLF
    
    
    = SLF
    You visit the Student Life Fair later in Week 1. Visiting various CCA booths, you found quite a few CCAs appealing, but you are worried that your grades would drop if you joined more than 1 CCA. What CCA would you choose?
    * [Football.] 
        ~ your_CCA = football
        -> Week_3
    * [Ultimate Frisbee. ]
        ~ your_CCA = frisbee
        -> Week_3
    * [Amplified (a CCA for band performances).] 
        ~ your_CCA = band
        ->Week_3
        
        
    = Week_3
    //TBD: Flesh Sarah out more with autonomy
    {your_CCA == football: You join recreational football, but after the first session, you stop going for training. You find you don't mesh too well with the rowdy people there.}
    {your_CCA == band: You join Amplified, but after the first session, you stop going for training. You find you don't know enough about music to vibe with the people there.}
    {your_CCA == frisbee: You join frisbee, but after the first session, you stop going for training. You aren't all too interested in the sport.}
    On a bus trip home from school, you meet Sarah, who attended the same Introduction to Psychology tutorial as you. She seems to be as well read as you are into niche texts on Psychology. You remain in conversation until you alight at your stop, and leave with a light mood.
    
    * [First half of semester.] -> Before_Recess
    
    = Before_Recess
    The first weeks of school pass by. You spend the time poring over the assigned readings and staying on top of work, also indulging in your hobby of creative writing in your free time. You and Sarah often meet on the bus home, and her warmth quickly leads to a budding friendship between the two of you.
    
    * [Recess Week.] -> Recess_Week
    
    = Recess_Week
    You complete the written assignments and the revision papers with time to spare. You end up whiling away a lot of time, for lack of other things to do.
    
    * [Midterms.] -> Midterms
    
    = Midterms
    Midterms went well. Viewing online discussions about the papers, you estimate that you are on track to at least an A- for your modules this semester. 
    
    * [Towards finals.] -> Towards_finals
    
    = Towards_finals
    As the weeks go by, you begin to feel isolated from your peers. Cliques have formed around factors like residential living and CCAs, but you are not in any of them. You are still happy to have Sarah as a friend, but when she is not around you begin to feel lonely. 
    
    You stave off the loneliness by writing more fiction. But the stories you write begin to feel bland and repetitive.
    
    *[Reading Week.] -> Reading_Week
    
    = Reading_Week
    You don't really venture out of home during reading week, and your general listlessness makes you start watching Netflix series in your free time. However, you cannot control yourself, and start binging Netflix series in daily marathons. You put in less effort for assignments and finals revision and feel guilty about it.
    
    *[Finals.] -> Finals
    
    = Finals
    Not having spent enough time on schoolwork proved disastrous. You perform below expectations, making many careless mistakes that you would have avoided had you been more focussed. 
    
    You would later learn that you scored 3 B+s and 2 A-s. 
    * [Winter break.] -> Winter_Trip

    = Winter_Trip
    
    The first week of winter break, you've arranged a trip to Shibuya, Japan with some pre-university friends. You meet at the airport and board the flight. and check in to the planned hostel after landing. 
    
    * [Try to have fun.] -> Winter_Trip_2
    
    = Winter_Trip_2
    Together with your friends, you visit various shops, eateries and attractions. Most are entertaining, but your mind often drifts towards your bland social life in university. You knew that grades took priority, but you wonder if you would have done better for our first semester on the whole had you stretched yourself and chosen more social pasttimes.
    
    One night, a buddy of yours asks you about it. "What's on your mind?"
    
    * [Tell him the truth.] -> Counselling
    * [Nope, nothing.] -> Avoidant
    
    = Avoidant
    "Nope, nothing." You say. A lack of a social life seemed like such an awkward topic to discuss with friends.
    "All right," he says. "If anything's weighing on your mind, try to not take the burden too hard on yourself."
    * [End of winter trip]-> Winter
    
    = Counselling
    You share your struggles with him. 
    "I see." He says. "I won't say university grades aren't unimportant, but you don't really shape your life either. Try to figure out what you really want in life, yeah? It doesn't necessarily rely on grades as much as you think."
    It was pretty lame advice that you already kind of knew, but you did feel relieved after sharing it with your friend. Your friend speaking the words aloud also helped you internalise them better.
    
    ~social += 1
    * [End of winter trip]-> Winter
    
    
    = Winter 
    The trip overseas ends, and you return to Singapore. You apply for part-time jobs and are selected for two. Which would you prefer?
    
    * [Warehouse packer.] -> Warehouse
    * [Pet shop assistant.] -> Pets
    
    = Warehouse
    You opt for the late shifts to earn more, but it tires you out slightly. Work is tiring, but you get better at managing your time.
    ~discipline += 1
    
    * [Back to school.] -> Semester_2
    
    = Pets
    You work at a large pet shop as an assistant, dealing with all sorts of pets. You find dogs adorable and would often play with them. You learn from the shopkeeper how to take better care of them.
    ~charm += 1
    
    * [Back to school.] -> Semester_2
    
= Semester_2
    The weeks of winter break pass all too soon and school resumes. You have reflected over the holidays and realise that you should probably take on more commitments this semester to make friends and do something worthwhile in your free time.
    * { your_CCA == football } [Re-join football.] 
        ~social += 1
        -> S2_W3
    * { your_CCA == band } [Re-join Amplified.] 
        ~social += 1
        -> S2_W3
    * { your_CCA == frisbee } [Re-join frisbee.] 
        ~social += 1
        -> S2_W3
    * [Don't want to re-join.]
        ~your_CCA = "Nothing"
        -> S2_W3

    
    = S2_W3
    {
        - your_CCA != "Nothing":
        Texting the people in charge, you succeed at joining {your_CCA} again. 
        You start talking to the people there, and realise they're all too ready to be friends with you. You gain much more confidence, having a group of friends to hang out with.
    }
    
    By some strange twist of fate, you end up in the same tutorial group as Sarah in another module, PL2131. It is a statistics-heavy module and you're not looking forward to it, but you also find out that Sarah is dreading the module as much as you are. You start meeting up after school hours, helping each other with work while also joking about the difficulty.
    
    * [Weeks 4-6.] -> S2_precess
    
    = S2_precess
    The weeks go on. The workload begins to get heavier, but good time management and keeping the proper priorities helps you stay afloat.
    
    You find yourself part of a 5-person project group that has good chemistry. After having a meeting over dinner in UTown, the conversation topic strays to a couple in the group. "How did you get together?" Another friend asks. 
    They went on a long ramble with numerous interjections in between. In summary, they were groupmates who bonded over doing all the work in the team. They began talking more and more as friends, until one day he confessed, and she accepted. 
    
    Hearing their story, you can't help but think about Sarah and yourself. You wonder if you and Sarah might work out romantically as well.
    
    * [Recess Week.] -> Recess_Week_S2
    
    = Recess_Week_S2
    Recess week arrives, and though the workload is tougher than ever, you still find the time to indulge a whim of browsing through travel catalogues about Hong Kong. You wonder if you should go there during summer. 
    
    But you've also spent a lot of time pondering if you should make a move on Sarah. You know clearly she sees you as a close friend; you've gotten to the point where you talk about daily happenings all the time. But you fear that she does not see you romantically, and the friendship collapses as a result of you confessing your feelings for her. 
    
    * [Confess.] -> Rejection
    
    = Rejection
    You come to a decision: better to try than to regret having not done so. You invite Sarah for lunch, and she accepts. The day arrives and you catch up over the meal. The conversation gets to a point where you're praising each other's strengths, and you decide it is time. 
    
    "Actually, I think I like you not just as a friend. Would you want to be boyfriend and girlfriend?"
    
    She looks stunned. It seems an eternity before she finally replies. "No."
    
    * [Oh.] -> Postmortem
    
    = Postmortem
    Recess week ends and midterms pass. Throughout that period, you simply find yourself going through the motions. Your mind toes the line to being a jumbled mess. 
    Though you knew that going in, there was a chance that Sarah would reject you, having it actually happen still hurt. Neither of you have broken the silence since. You do not forsee the friendship continuing. 
    The pain of losing a close friend like her was almost unbearable.
    
    * [Continue on.] -> Hope
    
    = Hope
    It is week 9. You find yourself scrolling through Youtube recommendations aimlessly. You view a motivational clip by Shuzo Matsuoka. You watch it again. And again. The sincerity and positivity in his message to never give up moves you. You finally let go of the emotional burden you've been bearing, and cry. 
    
    * [Don't give up.] -> Realisation
    
    = Realisation
    Over the next few days, you begin to pull yourself together. You start thinking about what you really want out of life, and come to the conclusion that you want to explore. Whether it be through touring the world or through creative writing, you want to keep being able to discover something new. This newfound perspective gives you the energy to stay motivated amid the hustle of university life.
    
    * [Reading Week and Finals.] -> Finals_S2
    
    = Finals_S2 
    Finals approach, and you prepare for it the best you can, arranging consults with tutors and asking seniors for notes. {your_CCA != "Nothing": Your friends in {your_CCA} notice the change in your demeanour and ask you about it. "It's simply positivity," you say, though it seems to them as anything but.}
    
    // at/above expectations 
    You show a decent performance in finals. You would later learn you got a mix of A-s and B+s, which you are satisfied with. You did not have overly heavy expectations on grades. 
    
    * [Summer break.] -> Summer
    
        = Summer

        Summer break begins. Your desire to explore made you sign up for summer school in Italy, and you plan to go on a solo trip across Europe afterwards. 
        
        By being open to interacting with many more people this past semester, you've joined many groups friends who are making plans together over the holidays. You may not be able to attend all of them, but you know they'd understand, and you hope to stay friends even after summer ends.
        
        Your year 1 life was filled with ups and downs, but looking back, you've had more fond memories than you have regrets. You've come to realise that your university experience is itself a part of your larger life story and are now moving towards your goals in life. On a whole, you are satisfied with your freshman experience.
        -> END
    
    
    -> END

// BESS START

== Start_CompScience
Orientation starts in a few days. You don't know what to expect from this choice you made a few months ago. All you know is that your decision often raised eyebrows when you discussed university plans with your friends. 
Still, you decide to stick to it. You take a deep think about why you picked the major.
* [You were always fascinated by computers, programming, and how things worked behind the screen.] -> Bess_passion_path
* [You heard from family that it was a lucrative degree with a bright future.] -> Bess_money_path


== Bess_passion_path
You constantly remind yourself that you belong in this major, and will stick by the choice. 

* [Start School.] -> PP_W1

    = PP_W1
    You enjoy Week Zero and Week One, having plenty of fun meeting friends from different majors. You think to yourself: "This is pretty fun!"
    
    You navigate the complexities of ModReg, try out CCAs and travel out for suppers with your new friends. You also spend some time decorating your room. 
    
    You attend your first lectures for CS1101S, the programming methodology module, and CS1231S, the notoriously difficult Discrete Math module. It takes you some time to process what is going on, but you do not worry too much about it.
    
    You learn words such as ternary operators, looking something like this:
    
    (A True or False condition) ? (Expression if true) : (Expression if false)
    
    "Cool! You think to yourself."
    
    * [Start tutorials in Week Three.] -> PP_W3_tutorial
    
    = PP_W3_tutorial
    With little to no warning, the content suddenly picks up. CS1101S has weekly assignments, which take you a surprising amount of time to solve. Discrete Math also presents as challenging, with many new concepts such as boolean algebra. 
    
    One day, at your CS1101S tutorial, your teaching assistant calls you out in the group of six. 
    
    Bess, can you write out how a ternary operation would look like if you passed your exam, with the expressions being your emotion?
    
    You are shocked and your mind goes temporarily blank. What do you say? (PS: Google if you're stuck!)
    -> PP_W3_tutorial_question
    
    = PP_W3_tutorial_question
    Task: Write out how a ternary operation would look like if you passed your exam, with the two expressions being your emotion
    + [(Pass exam) : (Happy) ? (Sad)] You write it out, but he gently pushes, "Are your symbols correct?" 
    -> PP_W3_tutorial_question
    + [(Pass exam) : (Sad) ? (Happy)] You write it out, but he winks, "If pass exam is true, why would you be sad? The symbols look a little wrong too." 
    -> PP_W3_tutorial_question
    + [(Pass exam) ? (Sad) : (Happy)] You write it out, but he promises you're close. "If pass exam is true, why would you be sad?" 
    -> PP_W3_tutorial_question
    + [(Pass exam) ? (Happy) : (Sad)] You write out the answer. "That's correct, good job Bess!" responds your TA. 
    -> PP_W3_tutorial_answer
    
    = PP_W3_tutorial_answer
    You are shaken but heave a sigh of relief. You go back and do a little more revision. 
    
    Outside of academics, you've always wanted to be more involved in student life, but you have a feeling you might not be able to keep up with too many commitments. 
    
    What do you plan to do?
    * [Join Floorball.]
    ~ CCA_num ++
    ~ CCA_name = "Floorball"
    -> PP_W3_end
     * [Apply to join Frisbee.]
     ~ CCA_num ++
     ~ CCA_name = "Frisbee"
     -> PP_W3_end
     * [Apply for both.] 
     ~ CCA_num += 2
     ~ CCA_name = "Floorball and Frisbee"
     -> PP_W3_end
     * [Choose not to apply for anything. ]
     ~ CCA_name = "none"
     -> PP_W3_end
    
    = PP_W3_end
    You decide on {CCA_name}. 
    
    However, the workload shows no signs of ceasing. You are also taking Linear Algebra, for which you have been trying to keep up by attending lectures at 8AM. You struggle to get your sleep and find yourself turning down many offers from your friends to have supper. 
    
    You also find it hard to difficult to ask for help from your friends. You feel bad and don't want to appear foolish. 
    
    * [Start Week 4.] -> PP_W4_start
    
    
    = PP_W4_start
    The weekly coding problems come incessantly, and you wonder if it will ever end. You become aware of a "practical exam" coming soon where you have an hour and a half to solve six coding problems. 
    
    Bearing in mind you have to practice for them, you also start working on the linear algebra and discrete math assignment due before recess week. 
    
    It is very difficult, and initially you are extremely lost. You are only able to do a few questions. 
    
    Furthermore, you have to write essays for your University Level Requirement modules. 
    
    Overwhelmed, you close your eyes and begin to tear up. 
    
    * [Keep your head down and continue working.] -> PP_W6_start
    * [Consider giving up.] -> PP_W6_wanna_give_up
    
    = PP_W6_wanna_give_up
    You consider giving up, so you text one of your friends and share your predictament. She gently tells you that giving up and letting the workload snowball will not add to your relief. She tells you to just do what you can and then decide after Semester 1. 
    * [Keep at it a little longer.]
    -> PP_W6_start
    
    = PP_W6_start
    Recess Week peeks around the corner. You keep your head down and push your way through deadline after deadline.
    
    You also manage to complete the assignments with much difficulty, did your best for the practical exam and the quizzes.
    
    You find yourself saving your meetups with friends you genuinely appreciate and slowly acclimatise to the constant state of rigour. You are more comfortable with saying no to CCA trainings. 
    * [Start Recess Week] -> PP_Recess_week_start

    = PP_Recess_week_start
    Recess week is spent practicising past year papers. It is difficult to remain focussed, but you do your best anyway. 
    
    You sit for the examinations the week after. 
    *[Finish your last paper.]
    -> PP_Post_Exams
    
    = PP_Post_Exams
    You heave a sigh of relief as you finish your last paper. It didn't go especially bad, but neither did it go exceedingly well. You take a good long break, and treat yourself to a mala with friends at UTown, with some GongCha. 
    
    It is not long later that you receive an email for your results.
    * [View results.] 
        { CCA_num:
        - 0: You choose to view your results, and your perform surprisingly well. You achieved a mix of of A-s and B+s. You were able to keep up with the workload, and had time after class to revise the concepts again. A plus for not having any CCAs, you wonder to yourself. 
            ~ grades = grades + 3
        * [Start Week 8.] -> PP_W8_start
        - 1: You choose to view your results, and your perform not too poorly. You achieved a mix of of A-s and B+s. You were able to keep up with most of the workload, and attempted revise after class the concepts again. "Just one CCA" might work for me", you think to yourself. 
            ~ grades = grades + 2
            * [Start Week 8.]-> PP_W8_start
        - else:
            You choose to view your results, and you perform on average. You achieved a mix of of B+s and a B. You feel frustrated, but you remember that you missed a few lectures due to the CCA volume and did not keep up consistently with the workload. Regardless, you pick yourself up, and you say to yourself: "It is what it is".
            ~ grades = grades + 1
            * [Start Week 8.] -> PP_W8_start
            }
    = PP_W8_start
    You are able to catch a little breather. 
    
    You brush yourself off, treat yourself to a nice meal, and take a deep breath before lessons go into full swing again. 
    
    * [Start Week 9.] -> PP_W9_start

    = PP_W9_start
    With little warning, the workload spikes again. This time, you are mentally more prepared.
    
       { CCA_num:
        - 0: -> PP_W10_start
        - 1: Your {CCA_name} CCA is opening applications for EXCO positions for the next semester. Do you want to try out for it?
        * {CCA_name == "Floorball"} [Try out for EXCO position.] -> PP_W10_try_floorball
        * {CCA_name == "Frisbee"} [Try out for EXCO position.] -> PP_W10_try_frisbee
        
            Week 10 begins. -> PP_W10_start
        - else:
            Both {CCA_name} are opening applications for EXCO positions for the next semester. Do you want to join?
            * [Try out for Floorball EXCO.] 
             -> PP_W10_try_floorball
            * [Try out for Frisbee EXCO.] 
             -> PP_W10_try_frisbee
            * [Choose not to.] -> PP_W10_start
        }
            
        = PP_W10_try_floorball
        You try to run for the Captain for Floorball. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change.
            ~ leadership_roles ++
            * [Start Week 10.]
            -> PP_W10_start
        
        = PP_W10_try_frisbee
        You try to run for the Captain for Frisbee. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change.
            ~ leadership_roles ++
            * [Start Week 10.]
            -> PP_W10_start
            
    = PP_W10_start
    The days flash by quickly. Mentally, you operate by weeks now. Another wave of "practical exam", written assignments and essays come your way. 
    
    You manage to stay afloat. 
    
    * [Submit essay for ULR module and your written assignments for discrete math and linear algebra.]
    -> PP_Reading_Week
    
    = PP_Reading_Week
    Reading Week starts and you find yourself practicising past year papers individually in your room. However, the math questions are not easy which makes you feel very stressed. You are also less productive than you expect, and only start halfway into the week. 
    // Find better studying tactics in Sem2
    
    Before long, it is Sunday, but you have one more practice paper you want to cram before the Linear Algebra exam tomorrow at 9AM. What do you choose to do?
    * [Ignore the paper and decide sleep is more important.] You decide to go to bed instead, at 12AM. 
    ~ sleep_amount = 2
    -> PP_Start_Exam
    * [Do the paper because you are stressed.] You decide to do it, and go to bed at 2AM. 
    ~ sleep_amount = 1
    -> PP_Start_Exam
    
    = PP_Start_Exam
    { sleep_amount:
    - 1:
    The examination goes reasonably well. With the extra sleep, you feel refreshed and are able to answer the auestions easily. However, you found out later that one of the questions came out in the past year paper that you didn't do. Regardless, you think to yourself: "If I didn't get enough sleep, I might not have been able to answer the other questions". 
    
        You continue working through the other exams.
        
    * [Finish Papers.] -> PP_Before_Winter
    - 2:
    The examination goes reasonably well. With lesser sleep, you start to feel lethargic towards the end. Thankfully however, the last question came out in the past year paper that you attempted the night before.
    
    You continue working through the other exams.
    
    * [Finish Papers.] -> PP_Before_Winter
    }

    = PP_Before_Winter
    { leadership_roles> 0:
    Winter is coming. You are informed that you were voted in as the captain for {CCA_name}. You are surprised but also nervous. Next semester will definitely be busy and you have to stay on the ball.  
    - else: 
    Winter comes round the corner. 
    }
    * [Start Winter.] -> PP_Start_Winter
    
    = PP_Start_Winter
    You move out of campus residence back home. 
    
    Here is how your Winter plans currently look like: 
    - Go overseas with your family for a week in Vietnam
    
    You have a few options on how to fill the rest of your 3 weeks.
    * [Rest, you are exhausted.] -> PP_long_rest
    * [Self-learn next semester's topics.] -> PP_try_study
    
    = PP_long_rest
    You take a long rest, and let out the deepest sigh you have ever known. 
    *[Reflect.] -> PP_post_S1_think
    
    = PP_try_study
    You try to do so, but you feel hopelessly burnt out. You cannot bring yourself to continue consistently.
    *[Reflect.] -> PP_post_S1_think
    
    = PP_post_S1_think
    You sit down and take a deep think. You remind yourself you took this major out of interest, but you were always interested in the application. How websites work, how traffic systems work and how Google finds the best routes to places. Not ternary operations, Relations, and Gaussian Elimination. 
    
    You mull over it a little longer, until you slowly come to terms with the present. "It is, what it is," you tell yourself. 
    * [Start Sem 2.]
    -> PP_Sem2_Starts
    
== PP_Sem2_Starts
    School starts again! You move back into hall, albeit tiring, and complete the frustrating CourseReg period easier than last semester.

    This time, your modules include: GEA1000, CS2030S (the continuation of CS1101S), CS2040S (Data structures and Algorithms), MA1521 (Calculus) and a random module for fun. 
    
    Before you start, you remind yourself to keep up with lectures, remain consistent, and be willing to turn down meetings if you are too stressed. You also decide to work with your friends instead of alone. -> PP_S2_W3
    
    = PP_S2_W3
    As anticipated, a lot of content was covered within the first few weeks. You realise that weekly coding problems have returned, and the first is the assignment known for its "rite-of-passage" difficulty. 
    
    You grit your teeth and take the assignments head on. -> PP_S2_W3
    
    = PP_S2_W6
    Slowly, you start to find your rhythm once again. Watch lectures, complete assignments with friends, attend {CCA_name} training, and sleep in on Sundays. 
    
    Before long, recess week starts again, and you settle into your groove. 
    
    * [Finish Mid-Terms]
    -> PP_S2_Post_Midterms
    
    = PP_S2_Post_Midterms
    Midterms are over. You nervously check your results soon after. 
    { leadership_roles:
    - 0: Thankfully, your hard work has paid off and you are happy with your grades. Some B+s. 
        * [Move on.] You hang out with friends and get yourself a little treat for your hard work.
        -> PP_S2_Commitments
    - else :
    You achieve some B+s and a B. You are satisfied with your performance!
        * [Move on.] You pick yourself up and dust yourself off. You also get yourself a little treat for your hard work.
        -> PP_S2_Commitments
    }
    
    
    = PP_S2_Commitments
    Things continue to be difficult. You discover your code does not compile for the practical exam, resulting in a straight zero. All you can say is, "It is what it is". 
    
    Planning for CCA also proves to be difficult, but thankfully you enjoy the sport and love the community that your seniors have helped to build. Furthermore, your vice-captain has also been very supportive and takes up the slack when needed. It is during this time you become painfully grateful for your support system of friends during such a difficult period. 
    
    It is also during this time where a familiar male friend starts to talk to you more often. You do not think much about it, and continue maintaining your flow of things.
    * [Start Reading Week]
    -> PP_S2_Reading_Week
    
    = PP_S2_Reading_Week
    "It is funny how time makes you forget how painful things were in the past," you think to yourself. Reading Week does not get any easier, as you do paper after paper. Slowly, you gain a little more confidence each time. 
    
    You sit for the exams the week after. 
    *[Finish your last paper.]
    -> PP_S2_Post_Exams
    
    = PP_S2_Post_Exams
    You manage to achieve satisfactory grades this time, pulling the CAP to a 4.0. 
    *[Prepare for Summer.] -> PP_Start_Summer
    
    == PP_Start_Summer
    It is time to move out. 
    
    Before you know it, Year 1 comes to an end. You reflect on your successes and failures, and evaluate whether your goals have been met. 
    
    You decide on a few things on your last night in your little room you called home. 
    
    * [Apply for internship.] You decide to accept the internship you thoughtlessly applied for in Semester 1. With that, you drift off to sleep, ending your first academic year in NUS.-> END
    * [Pursue Orbital, a summer module where you code a project in pairs.] You decide you might as well clear 4MCs, and also try out coding something totally new. You think about a text-based adventure, where NUS students can choose their path. -> END
    * [Backpack and travel.] You decide you need a rest for the summer, and things as they come. With that, you plan potential destinations, and drift off to sleep, ending your first academic year in NUS. -> END
    
    
    
    
== Bess_money_path
You hold back some nervousness as you embark on this journey. You have heard horror stories from seniors and friends about how difficult CS is. Regardless, you hope for the best and decide that it will all be worth it when you get your first paycheck.

* [Start School.] -> MP_W1

    = MP_W1
    You enjoy Week Zero and Week One, having plenty of fun meeting friends from different majors. You think to yourself: "This is pretty fun!"
    
    You navigate the complexities of ModReg, try out CCAs and travel out for suppers with your new friends. You also spend some time decorating your room. 
    
    You attend your first lectures for CS1101S, the programming methodology module, and CS1231S, the notoriously difficult Discrete Math module. It takes you some time to process what is going on, but you do not think too much about it.
    
    You learn words such as ternary operators, looking something like this:
    
    (A True or False condition) ? (Expression if true) : (Expression if false)
    
    "What even... You think to yourself."
    
    * [Start tutorials in Week Three.] -> MP_W3_tutorial
    
    = MP_W3_tutorial
    With little to no warning, the content suddenly picks up. CS1101S has weekly assignments, which take you a surprising amount of time to solve. Discrete Math also presents as challenging, with many new concepts such as boolean algebra. 
    
    One day, at your CS1101S tutorial, your teaching assistant calls you out in the group of six. 
    
    Bess, can you write out how a ternary operation would look like if you passed your exam, with the expressions being your emotion?
    
    You are shocked and your mind goes temporarily blank. What do you say?
    -> MP_W3_tutorial_question
    
    = MP_W3_tutorial_question
    Task: Write out how a ternary operation would look like if you passed your exam, with the two expressions being your emotion
    + [(Pass exam) : (Happy) ? (Sad)] You write it out, but he gently pushes, "Are your symbols correct?" 
    -> MP_W3_tutorial_question
    + [(Pass exam) : (Sad) ? (Happy)] You write it out, but he winks, "If pass exam is true, why would you be sad? The symbols look a little wrong too." 
    -> MP_W3_tutorial_question
    + [(Pass exam) ? (Sad) : (Happy)] You write it out, but he promises you're close. "If pass exam is true, why would you be sad?" 
    -> MP_W3_tutorial_question
    + [(Pass exam) ? (Happy) : (Sad)] You write out the answer. "That's correct, good job Bess!" responds your TA. 
    -> MP_W3_tutorial_answer
    
    = MP_W3_tutorial_answer
    You are shaken but heave a sigh of relief. You do not think much about it and agree to go clubbing with friends that night. 
    
    Outside of academics, you've always wanted to be more involved in student life, but you have a feeling you might not be able to keep up with too many commitments. 
    
    What do you plan to do?
    * [Join Floorball.]
    ~ CCA_num ++
    ~ CCA_name = "Floorball"
    -> MP_W3_end
     * [Apply to join Frisbee.]
     ~ CCA_num ++
     ~ CCA_name = "Frisbee"
     -> MP_W3_end
     * [Apply for both.] 
     ~ CCA_num += 2
     ~ CCA_name = "Floorball and Frisbee"
     -> MP_W3_end
     * [Choose not to apply for anything. ]
     ~ CCA_name = "none"
     -> MP_W3_end
    
    = MP_W3_end
    You decide on {CCA_name}. 
    
    However, the workload shows no signs of ceasing. You are also taking Linear Algebra, for which you have been skipping its 8AM lectures. You struggle to get your sleep and find yourself lagging behind, which forces you to turn down offers from your friends to have supper. 
    
    You also find it hard to difficult to ask for help from your friends. You feel bad and don't want to appear foolish. 
    
    * [Start Week 4.] -> MP_W4_start
    
    
    = MP_W4_start
    The weekly coding problems come incessantly, and you wonder if it will ever end. You become aware of a "practical exam" coming soon where you have an hour and a half to solve six coding problems. 
    
    Bearing in mind you have to practice for them, you also start working on the linear algebra and discrete math assignment due before recess week. 
    
    It is very difficult, and initially you are extremely lost. You are only able to do a few questions. 
    
    Furthermore, you have to write essays for your University Level Requirement modules. 
    
    Overwhelmed, you close your eyes and begin to tear up. 
    
    * [Keep your head down and continue working.] -> MP_W6_start
    * [Consider giving up.] -> MP_W6_wanna_give_up
    
    = MP_W6_wanna_give_up
    You consider giving up, so you text one of your friends and share your predictament. She gently tells you that giving up and letting the workload snowball will not add to your relief. She tells you to just do what you can and then decide after Semester 1. 
    * [Keep at it a little longer.]
    -> MP_W6_start
    
    = MP_W6_start
    Recess Week peeks around the corner. You keep your head down and push your way through deadline after deadline.
    
    You also manage to complete the assignments with much difficulty, did your best for the practical exam and the quizzes.
    
    You find yourself saving your meetups with friends you genuinely appreciate and slowly acclimatise to the constant state of rigour. You are more nonchalant about saying no to CCA trainings. 
    * [Start Recess Week.] -> MP_Recess_week_start

    = MP_Recess_week_start
    Recess week is spent practicising past year papers. It is difficult to remain focussed, but you do your best anyway. 
    
    You sit for the examinations the week after. 
    *[Finish your last paper.]
    -> MP_Post_Exams
    
    = MP_Post_Exams
    You heave a sigh of relief as you finish your last paper. It didn't go especially bad, but neither did it go exceedingly well. You take a good long break, and treat yourself to a mala with friends at UTown, with some GongCha. 
    
    It is not long later that you receive an email for your results.
    * [View results.] 
        {CCA_num:
        - 0: You choose to view your results, and your perform surprisingly well. You achieved a mix of of A-s and B+s. You were able to keep up with the workload, and had time after class to revise the concepts again. A plus for not having any CCAs, you wonder to yourself. 
            ~ grades = grades + 3
        * [Start Week 8.] -> MP_W8_start
        - 1: You choose to view your results, and your perform not too poorly. You achieved a mix of of A-s and B+s. You were able to keep up with most of the workload, and attempted revise after class the concepts again. "Just one CCA" might work for me", you think to yourself. 
            ~ grades = grades + 2
            * [Start Week 8.]-> MP_W8_start
        - else:
            You choose to view your results, and you perform on average. You achieved a mix of of B+s and a B. You feel frustrated, but you remember that you missed a few lectures due to the CCA volume and did not keep up consistently with the workload. Regardless, you pick yourself up, and you say to yourself: "It is what it is".
            ~ grades = grades + 1
            * [Start Week 8.] -> MP_W8_start
            }
    = MP_W8_start
    You are able to catch a little breather. 
    
    You brush yourself off, treat yourself to a nice meal, and take a deep breath before lessons go into full swing again. 
    
    * [Start Week 9.] -> MP_W9_start

    = MP_W9_start
    With little warning, the workload spikes again. This time, you are mentally more prepared. 
    
    { CCA_num:
        - 0: -> MP_W10_start
        - 1: Your {CCA_name} CCA is opening applications for EXCO positions for the next semester. Do you want to try out for it?
        * {CCA_name == "Floorball"} [Try out for EXCO position.] -> MP_W10_try_floorball
        * {CCA_name == "Frisbee"} [Try out for EXCO position.] -> MP_W10_try_frisbee
        
            Week 10 begins. -> MP_W10_start
        - else:
            Both {CCA_name} are opening applications for EXCO positions for the next semester. Do you want to join?
            * [Try out for Floorball EXCO.] 
             -> MP_W10_try_floorball
            * [Try out for Frisbee EXCO.] 
             -> MP_W10_try_frisbee
            * [Choose not to.] -> MP_W10_start
        }
            
        = MP_W10_try_floorball
        You try to run for the Captain for Floorball. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change.
            ~ leadership_roles ++
            * [Start Week 10.]
            -> MP_W10_start
        
        = MP_W10_try_frisbee
        You try to run for the Captain for Frisbee. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change.
            ~ leadership_roles ++
            * [Start Week 10.]
            -> MP_W10_start
            
    = MP_W10_start
    The days flash by quickly and you operate by weeks now. Another wave of "practical exam", written assignments and essays come your way. 
    
    You barely stay afloat. 
    
    * [Submit essay for ULR module and written assignments for discrete math and linear algebra.]
    -> MP_W12_copy_code
    
    = MP_W12_copy_code
    This week, One of your CS1101S assignments prove to be incredibly difficult. You spent hours on it, but you still cannot figure it out. The deadline is in 30 minutes, but you haven't gotten anywhere near the intended result.
    
    You have two options:
    
    * [Copy your friends code and change it a little.] -> MP_copy_code
    * [Submit what you have and take the L.] -> MP_dont_copy
    
    = MP_copy_code
     You ask your unwilling friend for help and change a few variable names before submitting. 
     * [Start Reading Week.]
     -> MP_Reading_Week
    
    = MP_dont_copy
     You submit what you have.
     * [Start Reading Week.]
    -> MP_Reading_Week
    
    
    = MP_Reading_Week
    Reading Week starts and you find yourself practicising past year papers individually in your room. However, the math questions are not easy which makes you feel very stressed. You are also less productive than you expect, and only start halfway into the week. 
    // Find better studying tactics in Sem2
    
    Before long, it is Sunday, but you have one more practice paper you want to cram before the Linear Algebra exam tomorrow at 9AM. What do you choose to do?
    * [Ignore the paper and decide sleep is more important.] You decide to go to bed instead, at 12AM. 
    ~ sleep_amount = 2
    -> MP_Start_Exam
    * [Do the paper because you are stressed.] You decide to do it, and go to bed at 2AM. 
    ~ sleep_amount = 1
    -> MP_Start_Exam
    
    = MP_Start_Exam
    { sleep_amount:
    - 1:
    The examination goes reasonably well. With the extra sleep, you feel refreshed and are able to answer the auestions easily. However, you found out later that one of the questions came out in the past year paper that you didn't do. Regardless, you think to yourself: "If I didn't get enough sleep, I might not have been able to answer the other questions". 
    
        You continue working through the other exams.
        * [Finish papers.] -> MP_Before_Winter
    - 2:
    The examination goes reasonably well. With lesser sleep, you start to feel lethargic towards the end. Thankfully however, the last question came out in the past year paper that you attempted the night before.
    
    You continue working through the other exams.
    
    * [Finish papers.] -> MP_Before_Winter
    }

    = MP_Before_Winter
    { leadership_roles> 0:
    Winter is coming. Before that, you are informed that you were voted in as the captain for {CCA_name}. You are surprised but also nervous. You realise next semester will definitely be busy and you have to stay on the ball.  
    - else: 
    Winter comes round the corner. 
    }
    * [Start Winter.] -> MP_Start_Winter
    
    = MP_Start_Winter
    You move out of campus residence back home. 
    
    Here is how your Winter plans currently look like: 
    - Go overseas with your family for a week in Vietnam
    
    You have a few options on how to fill the rest of your 3 weeks.
    * [Rest, you are exhausted.] -> MP_long_rest
    * [Self-learn next semester's topics.] -> MP_Cannot_Study
    
    = MP_Cannot_Study
    You try to do so, but you feel hopelessly burnt out. You cannot bring yourself to continue consistently.
    * [Reflect.]
    -> MP_post_S1_think

    = MP_long_rest
    You take a long rest, and let out the deepest sigh you have ever known. 
    *[Reflect.] -> MP_post_S1_think
    
    = MP_post_S1_think
    You sit down and take a deep think. You question if you are really enjoying this major. 
    
    You mull over it a little longer, until you slowly come to terms with the present. "It is, what it is," you tell yourself. 
    -> MP_Sem2_Starts
    
== MP_Sem2_Starts
    School starts again! You move back into hall, albeit tiring, and complete the frustrating CourseReg period easier than last semester.

    This time, your modules include: GEA1000, CS2030S (the continuation of CS1101S), CS2040S (Data structures and Algorithms), MA1521 (Calculus) and a random module for fun. 
    
    Before you start, you remind yourself to keep up with lectures, remain consistent, and be willing to turn down meetings if you are too stressed. You also decide to start working with your friends instead of alone. -> MP_S2_W3
    
    = MP_S2_W3
    As anticipated, a lot of content was covered within the first few weeks. You realise that weekly coding problems have returned, and the first is the assignment known for its "rite-of-passage" difficulty. 
    
    You grit your teeth and take the assignments head on. -> MP_S2_W3
    
    = MP_S2_W6
    Slowly, you start to find your rhythm once again. Watch lectures, complete assignments with friends, attend {CCA_name} training, and sleep in on Sundays. 
    
    Before long, recess week starts again, and you settle into your groove. 
    
    * [Finish Mid-Terms]
    -> MP_S2_Post_Midterms
    
    = MP_S2_Post_Midterms
    Midterms are over. You nervously check your results soon after. 
    { leadership_roles:
    - 0: Thankfully, your hard work has paid off and you are happy with your grades. Some B+s. 
        * [Move on.] You hang out with friends and get yourself a little treat for your hard work.
        -> MP_S2_Commitments
    - else :
    You achieve some B+s and a B. You are satisfied with your performance!
        * [Move on.] You pick yourself up and dust yourself off. You also get yourself a little treat for your hard work.
        -> MP_S2_Commitments
    }
    
    
    = MP_S2_Commitments
    Things continue to be difficult. You discover your code does not compile for the practical exam, resulting in a straight zero. All you can say is, "It is what it is". 
    
    Planning for CCA also proves to be difficult, but thankfully you enjoy the sport and love the community that your seniors have helped to build. Furthermore, your vice-captain has also been very supportive and takes up the slack when needed. It is during this time you become painfully grateful for your support system of friends during such a difficult period. 
    
    It is also during this time where a familiar male friend starts to talk to you more often. You do not think much about it, and continue maintaining your flow of things. 
    
    * [Start W12]
    -> MP_W12_copy_code
    
    = MP_W12_copy_code
    This week, another familiar situation arises. One of your CS2030S lab assignments prove to be incredibly difficult. You again spend hours on it, but this time you still cannot figure it out. The deadline is in an hour, but you haven't gotten anywhere near the intended result.
    
    You have two options:
    
    * [Copy your friends code and change it a little.] -> MP_S2_copy_code
    * [Submit what you have and take the L.] -> MP_S2_dont_copy
    
    = MP_S2_copy_code
     You ask your unwilling friend for help and change a few variable names before submitting. 
     * [Start Reading Week.]
     -> MP_S2_copy_code_destruction
    
    = MP_S2_dont_copy
     You submit what you have.
     * [Start Reading Week.]
    -> MP_S2_Reading_Week
    
    = MP_S2_copy_code_destruction
    A few days later you receive an email from your TA saying that your assignment has been flagged for plagarism. 
    
    What do you do?
    
    * [Vehemently deny everything] -> MP_S2_copy_code_deny
    * [Admit to your mistake] -> MP_S2_copy_code_admit
    
    = MP_S2_copy_code_deny
    You try to vehmently deny everything. 
    
    Yet, the evidence is overwhelming. You merely changed the variable names due to the time crunch and every single line of the 4 files submitted are identical. 
    
    You are informed that due to your dishonesty, the case is being raised higher in the academic committee, and will face a severe penalty that threatens suspension and even expulsion. 
    * [Start Reading Week]
    -> MP_S2_Reading_Week
    
    = MP_S2_copy_code_admit
    You admit to your mistake, and await your punishment. 
    
    You heave a huge sigh of relief when you later find out that you are not expelled. You are given a zero for the assignment and graded poorly for your student conduct. Though the mark will be there forever, you learn your lesson. Copying code does not make you a better programmer. Just a more clueless one. 
    * [Start Reading Week]
    -> MP_S2_Reading_Week
    
    = MP_S2_Reading_Week
    "It is funny how time makes you forget how painful things were in the past," you think to yourself. Reading Week does not get any easier, as you do paper after paper. Slowly, you gain a little more confidence each time. 
    
    You sit for the exams the week after. 
    *[Finish your last paper.]
    -> MP_S2_Post_Exams
    
    = MP_S2_Post_Exams
    You manage to achieve satisfactory grades this time, pulling the CAP to a 4.0. 
    *[Prepare for Summer.] -> MP_Start_Summer
    
    == MP_Start_Summer
    It is time to move out. 
    
    Before you know it, Year 1 comes to an end. You reflect on your successes and failures, and evaluate whether your goals have been met. 
    
    You decide on a few things on your last night in your little room you called home. 
    
    * [Apply for internship.] You decide to accept the internship you thoughtlessly applied for in Semester 1. With that, you drift off to sleep, ending your first academic year in NUS.-> END
    * [Pursue Orbital, a summer module where you code a project in pairs.] You decide you might as well clear 4MCs, and also try out coding something totally new. You think about a text-based adventure, where NUS students can choose their path. -> END
    * [Backpack and travel.] You decide you need a rest for the summer, and things as they come. With that, you plan potential destinations, and drift off to sleep, ending your first academic year in NUS. -> END
    
// CAELAN START

== C_Choice ==
Your university story begins earlier than most, with a surprising notification from NUS. They inform you that you've applied for and have been selected into a program called NUS College. Apparently, you had marked a checkbox in the form labelled "Apply to NUS College". You realise you had mistook it to be another confirmation about applying to NUS itself; you had never heard of such a program. 

Doing more research, you find out that NUS College(NUSC) is a newly started programme with foundations in the University Scholars Programme (USP) and Yale-NUS College. It seeks to provide its students with a broad-based interdisciplinary education. Though you are interested in the education offered and the student community featured, the workload looks rigorous, and you already plan to work in law: the extra-disciplinary knowledge may not be that useful.

-> Decision

    = Decision
    + [Accept the offer.] -> Confirmation_Inter
    + [Reject the offer.] -> Confirmation_Intra
    
    = Confirmation_Inter
    You contemplate your decision. Joining NUSC would mean taking overloading with NUSC modules in addition to already demanding law modules. Your additional identity as an NUSC student would also mean you have less time to spend on pursuits in NUS Faculty of Law. Make the decision anyway?
    + [Yes.] -> Caelan_Inter
    + [No.] -> Decision
    
    
    = Confirmation_Intra
    You contemplate your decision. You've been piqued by the opportunity the programme offers, to learn from and interact with people from other walks of life. As a law student, you would otherwise spend most of your days on the small Bukit Timah campus, interacting with a small group of fellow law students. You wonder if you're giving up a valuable opportunity. 
    + [Yes.] -> Caelan_Intra
    + [No.] -> Decision
    

== Caelan_Inter ==

    -> Orientation_Caelan_Inter

    = Orientation_Caelan_Inter
    You accept the offer from NUS College. Having chosen to be a student under both the NUS Law faculty and the NUSC, you soon sign up for orientation activities organised by both.
    
    The orientation activites arranged by NUS Faculty of Law were a blast. Starting from Law Camp in June, the orientation activities succeeded not only in being engaging, but also bringing you closer to other freshmen in NUS Law. You've gotten to know many new people during the months before the official start of school, and look forward to going through freshman year with them. 
    
    The orientation activites arranged by NUSC were less engaging in comparison, and did not foster as much interaction between freshmen. You suspect they may have been curated by the faculty, as the seniors didn't really play much of a role throughout the activities. You recognise a few other faces from law orientation, and you meet up during the blocks of idle time between orientation activities.  
    
    * [First weeks of school.] -> First_Weeks
    
    = First_Weeks
    // choice between law fac CCA and NUSCProds?
    School begins. You check in to your suite room in Cinnamon College for on-campus accomodation. You spend the first weeks of school chatting with your floormates and joining them as they eat, drink (wink) and play games in lounge. 
    
    In these weeks, you are also exposed to various interest groups within NUS, from NUS-wide interest groups to those under the Faculty of Law, and even those under NUSC. You decide to join NUSCProductions, an interest group that works to create plays at the end of Semester 1 each year.
    
    * [School ramps up.] -> Next_Weeks
    
    = Next_Weeks
    The pace of school quickens. The law modules are no joke: you begin to truly understand the pain of having up to 10 hours of readings assigned per module, per week. Though the actual lesson durations are short, law students being expected to show up to class prepared does burn most of your time outside of lessons. Overloading with an NUS College module about literature called Global Narratives does not help, either. You end up scheduling the tutorials in the evenings after coming back from law school, and you struggle to concentrate in class on an empty stomach.
    
    Every Tuesday night, you also attend NUSCProductions sessions. You were shortlisted as a cast member in their upcoming play, titled "Parallel Universes". You play the role of a student from a galaxy far, far away who visits this universe.
    
    On another note, you've started talking to a girl named Jolene who lives on your floor (it's mixed-gender) and is majoring in PPE. You find yourself drawn to her outspoken and empathetic nature, and are thinking of confessing to her.
    
    * [Confess.] -> Single_No_More
    * [Don't confess.] -> Single_For_Life

    = Single_No_More
    Jolene accepts your confession readily, something you did not expect. After years of being single, you find yourself in a relationship. You find it strange on some level.
    ~attached = true
    
    * [Recess Week.] -> Recess_Week
    
    = Single_For_Life
    You decide not to confess. You have been single for years by choice, and though you find Jolene attractive, you do not believe you desire a relationship in your life at the moment. Perhaps sometime in the future, you think and leave it at that.
    ~attached = false
    * [Recess Week.] -> Recess_Week
    
    = Recess_Week
    Recess week came as a timely break from the tempo of school. However, you were kept on your toes by assignments for both Law and NUS College modules, and you stay on campus throughout the week to focus on the work you have. You find the NUS College assignments more challenging, and you suspect it might be because you didn't spend as much time on those modules. 
    
    {attached == true: Jolene and you go out on a date to the movies. You enjoy the new Spider-Man movie together. You hold hands during the movie, then chat at a nearby cafe.}
    
    * [End of recess week.] -> Post_Recess
    
    = Post_Recess
    Recess week ends and lessons resume. Your time is at a premium now: the number of readings assigned for your law modules seems to never end. You begin to sleep at 2am everyday only to wake up at 7am so as to not miss breakfast and the BTC bus to campus at the Faculty of Law.
    
    On a silver lining, NUSCProductions is making good progress in developing its theatrical production. Sessions only last two hours per week, but full rehearsals are already underway. You are optimistic about the show at the end of the semester. 
    
    * [Towards finals.] -> Towards_Finals
    
    = Towards_Finals
        Weeks fly by in a blink. You spend less time with your floor and suitemates, and you even choose to stay at home on some days of the week, travelling directly to law school for greater convenience. 
        
        The NUSC-specific module you are taking, Global Narratives, quickly becomes the module you spend the least effort on. It's not that you aren't interested in the narratives featured, existing in literary form or otherwise. In fact, you quite enjoyed reading poems like the Lays. However, your law modules do not leave you much time to spend, and you'd rather put in the minimum effort to S/U the module than burn out trying to handle the additional workload.
        
    * [Finals.] -> Finals
    
    = Finals 
    Reading week arrives, followed by finals. You do your due diligence for the law modules, but spend considerably less time on the NUSC Global Narratives module. You would later learn that you scored an A- for LC1025, the only semester-long law module, and a B for your NUS College module. As planned, you would S/U the module. 
    * [Winter break.] -> Winter
    
    = Winter
    Winter arrives. NUSCProductions rehearsals become more frequent towards the show date in the early part of winter break. You've gradually gotten closer to your fellow production members, and hardly mind the extra practices.
    
    The show date arrives, and you visit the venue. 
    
    * [Good day.] -> Winter_Trip
    
    = Winter_Trip
    Following the play, you go on a two-week family trip to Switzerland. During the trip, your parents ask about how you've done. As your mother and uncle are both practicing law, you often receive questions from your family about your experience studying in NUS Faculty of Law. You tell them the news, and they seem slightly concerned. "Do you see the point of taking this NUS College module at all, since you're already busy with law modules?" Your uncle asks. 
    
    It was a good question which you ponder over the trip. -> Decision
    
    = Decision
    On one hand, you know that law school is only going to get more challenging over the semesters. You forsee spending the majority of time on those modules instead of the NUS College ones. You wonder why you're even taking the NUSC modules in the first place. You could be better off engaging pursuits within the Faculty of Law or in the wider law industry. 
    On the other hand, you do appreciate the group of friends you've made in NUS College. You've made some friends in the Faculty of Law at the start, but the bulk of your friends are ones made in NUS College, especially in NUSCProductions. You wish to keep these friends throughout your college experience. 
    
    + [Drop out of NUS College.] -> Drop_Confirmation
    + [Stay in NUS College.] -> Stay_Confirmation
    
    = Drop_Confirmation
    You reconsider the bold move you are about to take. 
    + [Drop out anyway.] -> Dropped
    + [Reconsider.] ->  Decision
    
    = Stay_Confirmation
    You reconsider your decision to stay. 
    + [Stay.] -> Stayed
    + [Reconsider.] ->  Decision    
    
    = Dropped
    You inform the relevant staff of your decision to drop out of NUS College. They arrange for a talk, and after you share your rationale they agree to let you go. You complete the relevant paperwork, and are informed that beginning next semester, you will no longer be part of NUS College.
    
    {attached == true: You also inform Jolene about the news. She sounded sad over the call, but supports your decision anyway. You agree to continue the relationship for the time being. }
    
    * [Semester 2.] -> Dropped_Sem2
    
    = Stayed
    You decide to tough it out in NUS College. Having made the choice, you reflect on how you could better use your time in NUS College. Though you expect to have even less free time next semester, you decide to join more floor activities as well as spend more time with friends from NUS College. 
    
    * [Semester 2.] -> Stayed_Sem2
    
    = Dropped_Sem2
    Semester 2 begins. You start getting used to living and studying at home. The greater customisability of your own room allows you to better optimise it to study more productively. In addition, the commute time from your home turns out to be comparably faster than the BTC bus to the Bukit Timah campus. You take quite well to living at home, despite having fewer people your age to talk to outside of school hours. 
    
    In addition, with more free time on your hands, you join the NUS Pro Bono group out of a desire to serve. You are quickly welcomed and invited to join in the planning of its annual flagship event: the NUS Pro Bono Week, held in March.
    
    * [The semester continues.] -> Dropped_Recess_S2
    
    = Dropped_Recess_S2
    The weeks continue and workload ramps up. Staying on the scenic Bukit Timah campus from morning to evening on most days, you begin to make more friends in the Faculty of Law. You also connect with other law students who've remained in NUS College.
    
    {attached == true: Though you and Jolene still talk, you haven't really had the chance to meet up since school started due to your different schedules. You begin to realise that maintaining the relationship will be difficult given the circumstances. }
    
    NUS Pro Bono Week took place in week 6. As part of the team responsible for planning the first-ever Pro Bono night market to raise funds for Pro Bono SG, you feel great satisfaction seeing the high level of student participation, not just in student-run businesses but also as visitors of the night market. 
    
    * [Second half of semester.] -> Dropped_SecondHalf_S2
    
    = Dropped_SecondHalf_S2
    Recess week comes and goes, and the second half of the semester begins. 
    {
        -attached == true: 
        You've also decided to break up with Jolene. You tell her it's for the best that you part ways since there was nothing much keeping you together outside of NUSC. She seems to understand it as well; as you part ways, You wish each other all the best. 
        ~attached = false
    }
    Work begins to ramp up for the second half of the semester. The year-long modules that you are taking, nearing their end, begin to dole out even more work than before. You've joined an unofficial peer group with students from the Pro Bono Club to discuss content together and to solicit notes from seniors. Clubs and activities in NUS Faculty of Law begin to wind down before the assessment period, providing you with much-needed time to prepare.
    * [Towards finals.] -> Dropped_Finals
    
    
    = Dropped_Finals
    Reading week arrives, followed by finals season. Your preparation proves effective: Though the papers were difficult and you weren't confident about your performance, you exceed expectations by scoring 4 A-s and 1 B+. 
    * [Summer break.] -> Dropped_Summer
    
    = Dropped_Summer
    Summer break arrives, and your time as a first year law student ends. You've chosen to intern at a law firm during your vacation, shadowing a practicing lawyer; You've also applied to join the freshmen orientation central committee, wanting to help the first years with orientation into NUS, and gotten accepted for it.
    On a whole, you've taken a more interesting journey than most: joining NUS College for a semester before choosing to drop it. Yet there are no actual answers to life; Your current path is as valid as any other, and you should be proud of yourself for making it this far. 
    
    -> END
    
    
    = Stayed_Sem2
    Semester 2 begins. Returning to hostel, you find everyone in high spirits after the break from school. You find it easy to join in as everyone catches up with each other after the long break over more games, food and drinks (wink).
    
    You've also joined Cinnacaff, the residential coffee-brewing interest group. You take the chance to learn about coffee brewing, and help to man the booth on the mornings that you are free.
    
    For academics, you are only studying law modules only this semester. You believe that this semester would be even busier than last semester, and overloading with an NUSC module would be short-changing your time.
    
    * [The semester continues.] -> Stayed_Recess_S2
    
    = Stayed_Recess_S2
    The weeks continue and workload ramps up. Some days, you stay on the scenic Bukit Timah campus from morning to evening, but when there are no lessons for the day, you stay in UTown. Gradually, you begin to make more friends both in NUSC as well as the Faculty of Law. You basically know most of the NUSC freshmen studying Law at this point, and are in no lack of friends to ask for assistance with regard to schoolwork.
    
    {
        -attached == true: 
        Jolene and you have been steady for long enough that you've met and gotten to know each other's close friends. For Jolene's birthday, you prepare a surprise party with mutual friends in your floor lounge, and trick her into coming over. The look on her face was priceless, and she gives you a warm hug right after.
    }
    
    * [Second half of semester.] -> Stayed_SecondHalf_S2

    = Stayed_SecondHalf_S2
    Recess week comes and goes, and the second half of the semester begins. 
    Work begins to ramp up for the second half of the semester. The year-long modules that you are taking, nearing their end, begin to dole out even more work than before. You've formed a friend group with some other NUSC people studying law, and though you consistently burn late nights studying together until 4am, the company makes the situation tolerable.

    * [Towards finals.] -> Stayed_Finals
    
    
    = Stayed_Finals
    Reading week arrives, followed by finals season. Your preparation proves effective: Though the papers were difficult and you weren't confident about your performance, you exceed expectations by scoring 4 A-s and 1 B+. You applaud your wise choice at the start of this semester to not overload with an NUSC module. 
    * [Summer break.] -> Stayed_Summer
    
    = Stayed_Summer
    Summer break arrives, and your time as a first year law student ends. You've chosen to go on an overseas trip to Taiwan with floormates from NUS College. You've also applied to join the freshmen orientation central committee, wanting to help the first years with orientation into NUS, and gotten accepted for it.
    On a whole, you've made a daring choice to commit to the newly started NUS College. Nobody knows where it will lead; yet your bold choice should be lauded. Don't be afraid to go off the beaten path if you see something in the shrubbery, as I say. 
    -> END
    
-> END

== Caelan_Intra ==

    = Orientation_Caelan_Intra
    You reject the offer from NUS College. Choosing only to be a student under the NUS Law faculty, you sign up for its orientation. 
    
    The orientation activites arranged by NUS Faculty of Law were a blast. Starting from Law Camp in June, the orientation activities succeeded not only in being engaging, but also bringing you closer to other freshmen in NUS Law. You've gotten to know many new people during the months before the official start of school, and look forward to going through freshman year with them. 
    
    * [First weeks of school.] -> First_Weeks
    
    = First_Weeks
    School begins. You are exposed to various interest groups within NUS, from NUS-wide interest groups to those under the Faculty of Law, and even those under NUSC. You decide to join the NUS Law Mooting and Debating Club, a club that seeks to grant students with mooting abilities and  opportunities. You believe the oratory skills you will learn will be very helpful for your future career life. 

    The first lessons begin for each of your modules as well. Two of them, Contract law and Legal Analysis, Research & Communication, will last a whole year, which you take some time to figure out. What you can't figure out is the mountains of readings assigned before each lesson that you have to complete. The seniors' warnings were clearly not enough to prepare you for this.
    
    * [School ramps up.] -> Next_Weeks
    
    = Next_Weeks
    The pace of school quickens towards recess week. You clear the readings before every lesson, but always just barely. And even then, you never understand enough to contribute meaningfully to the lesson. You remember your mother who once studied law telling you that NUS Law was easier than A-levels. What a load of bollocks, you think.
    
    You go out with friends from the mooting and debating club for a meal outing. You have fun eating together and exchanging pleasantries, but one of the people there started talking about schoolwork and the whole conversation derails. Listening to them, you begin to feel stressed about the schoolwork yourself. In your opinion, the discussion about schoolwork ruined the atmosphere of the outing.
    * [Recess Week.] -> Recess_Week
    
    = Recess_Week
    Recess week came as a timely break from the tempo of school. You find the time to join your family on an impromptu vacation to Johor. Your parents ask you how you're coping with law school. With your mother and uncle practicing law, you often receive questions from your family about your experience in law school. 
    
    * [I'm struggling.] -> Counselling
    * [I'm perfectly fine.] -> Avoidant
    
    = Avoidant
    "I'm perfectly fine." You lie. You're afraid to share your struggles, afraid that you might cause them unnecessary worry. Your mother has high expectations for you in the field of law too, adding to your reluctance to tell the truth.
    "Great to hear," your father says. "Do tell us if you need any help, we'll be happy to assist." 
    You feel guilty lying to your well-meaning parents. 
    * [End of recess week.]-> Post_Recess
    
    = Counselling
    You share your academic struggles with your parents. 
    "It won't be easy, sweetie, but you'll pull through." Your mother says. "Just keep your eye on the prize: you want to become a criminal defense lawyer to uphold justice in court, right? Don't give in to self-doubt, and you'll be there before you even realise."
    
    You wonder if you still had the same childhood deam that your mother outlined. 
    
    * [End of recess week.] -> Post_Recess

    = Post_Recess
    Recess week ends and lessons resume. Your time is at a premium now: the number of readings assigned for your law modules seems to never end. You begin to sleep for around 4 hours everyday, not out of choice; you cannot keep up with the pace of school without sacrificing sleep, unhealthy though it is. 
    
    You can see that the workload also took a toll on the other students, as well. Many people stopped coming to the mooting and debating club in the second half of the semester. Also, compared to the first half of the semester when the campus venues were often lively with student-led initiatives, people would gather there in small groups to revise together. 
    * [Finals.] -> Finals
    
    = Finals 
    Reading week arrives, followed by finals. You try to do your due diligence for the law modules, but quickly run out of motivation to do so. You would later learn that you scored a B for LC1025, the only semester-long law module.
    * [Winter break.] -> Winter
    
    = Winter
    During winter, you take on a 5-week internship at a medium-sized law firm. You take on a secretarial role for your assigned mentor, helping him with filing documents and research. 
    As the weeks pass, you begin to notice certain behaviours at work: your colleagues at the firm have a haggard look about them due to always working outside of office hours, especially the juniors. Moreover, in the brief span of the few weeks you were there, you've seen two juniors leave. 
    You find out that various young lawyers have been leaving the industry due to the high stress and long hours associated with being a lawyer, something you never knew despite your family background in law. 
    
    * [Reconsider becoming a lawyer.] -> Reconsider
    
    = Reconsider
    Your internship experience, as well as your academic struggles, prompt you to reconsider your choice of major. At this point, your dream of being a criminal defense lawyer seems childishly naive. The expectation mismatch between your childhood goal career and the reality of being a lawyer gnaws at you. You consider dropping out of law school and changing your major.
    
    + [Drop out of law school.] -> Drop_conf
    + [Stay in law school.] -> Stay_conf
    
    = Drop_conf
    You hesitate. Dropping out of law school would be a sizeable setback in your education journey, not to mention it would come as a huge shock to your family. 
    
    + [Go ahead anyway.] -> Drop
    + [Reconsider.] -> Reconsider
    
    = Stay_conf
    You hesitate. Seeing the gulf between reality and your expectations, you wonder if you even have a purpose in studying law anymore. You truly wonder if you would be a better fit for a different industry given your aptitude and attitude. 
    
    + [Stay anyway.] -> Stay
    + [Reconsider.] -> Reconsider
    
    = Drop
    You decide to drop out of law school. Your family was rightly shocked when you inform them about your decision. In typical Asian parent fashion, your parents tell you that you're letting a privilege you were given go to waste. It takes your family considerable time to accept your decision, albeit with a condition: that you talk to a staff member at school first. 
    * [Talk to a staff member.] -> Reach_out

    
    = Reach_out
    You contact your LARC tutor about your decision, given that he seemed both caring and genuine.
    
    You have an online call, where you explain to him your rationale for leaving. He listens understandingly, and shares his advice. "I don't think that you should tough it out like your parents say, just because of practical concerns. Tough it out because you see meaning behind what you do." He shares his journey as a lawyer: he, too, once struggled with long hours and high stress at his firm, but his supervisor kept telling him he would soon be able to see the benefits in the people he served. Soon enough, he was allowed to take on clients for the firm, and the experiences helping various people with their woes was cathartic and kept him going ever since. 
    
    His story touched you: You consider if you could find a new path to call your own in law. 
    
    * [Stay.] -> Stay_talk
    * [Leave anyway.] -> Goodbye
    
    = Goodbye
    
    You then reach out to the school administration to inform them of your decision to leave. The administrative work is settled quickly, and once you return your matriculation card, the process is complete; you are no longer an NUS student.
    
    As you still have no concrete idea of where your interests or aptitude lie, you decide to take a gap year to rediscover your life goals. You have applied to an internship with Youth Corps, believing that service will guide you towards the path you wish to lead. 
    
    You've buckled your family's expectations to seek a path to call your own; Your decision to only commit to something that you find meaning in is laudable. After all, life is not a sprint but a marathon, and no setback, including your decision to drop out of law school, is permanent. A summation of your life can only be done towards it's end, don't you agree?
    
    -> END
    
    
    = Stay
    You've decided to stay in law school. You made the decision to get a degree in law when you applied, and you believe in sticking with your decision.
    Still feeling lost about your paths in law, your reach out to your LARC tutor, someone you believe to be both caring and genuine. Over an online call, he listens understandingly to your concerns, and shares his personal journey as a lawyer: he, too, once struggled with long hours and high stress at his firm, but his supervisor kept telling him he would soon be able to see the benefits in the people he served. Soon enough, he was allowed to take on clients for the firm, and the experiences helping various people with their woes was cathartic and kept him going ever since. 
    
    * [You were inspired.] -> Stay_talk
    
    = Stay_talk
    You learn from your tutor's life story that it is all about perspective. Though struggles exist in your work, how do you even compare them with the life issues that your clients are facing? You realise how major serving the populace is in law, and that gives you motivation to stay. Perhaps you have finally found the role you wish to fulfill in law.
    
    * [Start of Semester 2.] -> Stay_Sem2
    
    = Stay_Sem2
    Semester 2 begins. Seeking to gain a more holistic perspective of law, you join the NUS Pro Bono group; you believe that its spirit of volunteerism in law aligns with your values. You are quickly welcomed and invited to join in the planning of its annual flagship event: the NUS Pro Bono Week, held in March.
    
    Finding a new purpose in practicing law also motivates you to put even more effort into the law modules you are taking this semester. You ask for module notes from your seniors ahead of time, and begin using scientifically proven learning techniques to internalise what you've learned on a daily basis.
    
    * [The semester continues.] -> Stay_Recess_S2
    
    = Stay_Recess_S2
    The weeks continue and workload ramps up. You successfully join a moot team representing the University at an international mooting competition, emerging as runners up. Though not the ideal result, you still believe that it was an invaluable experience; you have learned much that you believe will be helpful to share with others with regard to mooting.
    
    NUS Pro Bono Week took place in week 6. As part of the team responsible for planning the first-ever Pro Bono night market to raise funds for Pro Bono SG, you feel great satisfaction seeing the high level of student participation, not just in student-run businesses but also as visitors of the night market. 
    
    
    * [Second half of semester.] -> Stayed_SecondHalf_S2

    = Stayed_SecondHalf_S2
    Recess week comes and goes, and the second half of the semester begins. 
    Work begins to ramp up for the second half of the semester. The year-long modules that you are taking, nearing their end, begin to dole out even more work than before. Nevertheless, by leveraging on the experiences of seniors in school, you implement a study system that you believe will adequately prepare you for the finals about to come.
    
    * [Towards finals.] -> Stayed_Finals
    
    = Stayed_Finals
    Reading week arrives, followed by finals season. Your newfound drive and implemented changes in studying techniques yield a considerable improvement in your grades: Though the papers were difficult and you weren't confident about your performance, you exceed expectations by obtaining 2 A-s and 3 B+s, a far cry from your mediocre performance last semester. 
    * [Summer break.] -> Stayed_Summer
    
    = Stayed_Summer
    Summer break arrives, and your time as a first year law student ends. You have applied and been selected to intern at Pro Bono SG, where you hope to gain insights into the lives of lawyers doing pro bono work. In helping others, you have learned to see how blessed you are, and you wish to continue doing what you can to give back as a lawyer.
    
    You've had a meaningful year 1 experience, gaining insights into the law industry that contradict your ideals but still choosing to stick to your degree anyway. Your commitment should be lauded and your journey of self-rediscovery yields insights that would be inspiring for one and all.
    -> END
    

    
    
// DARYL START    
== Start_Business_School
You just finished an enjoyable dinner with your family, but you feel a gnawing feeling in your chest. Your first year of university starts next week, and you have no idea how it will be like. Taking a deep breath, you decide to give it some thought- about what you want out of NUS Business School. 

You were always a natural leader and a community-driven person. Hence, school to you naturally was the perfect place for you to find your crowd and lead your CCAs and EXCOs to greater heights. But, you've always wanted to try running your own business, and being a fashionable person yourself, you often toyed with the idea of your own thrift shop.
-> Business_School_Choice

== Business_School_Choice
You know that doing both makes a poor decision, as neither of the goals would meaningfully recieve your fullest attention. 

How do you envision your univeristy life?

 + [Make make the most out of your hall life and join CCAs.] -> Daryl_campus_life
 + [Focus on nurturing your entrepreneurial goal, a thrift shop.]  -> Daryl_side_hustle
 
 == Daryl_side_hustle
 So you have decided to try something different. This journey will be tough and arduous, and not as glamourous as it sounds. You will not be able to look back after this, but you can surely at the end of it have said you tried. It's not too late to go back.
 + [Rethink your choice.] You decide to rethink your choice. -> Business_School_Choice
 * [Stick to your decision.] -> Daryl_side_hustle_confirm
 
 == Daryl_side_hustle_confirm
 This is it. Once you've set your mind on something, you'll never give up. With your decision in mind, you are reminded that you will have to compromise on your participation in CCAs, meetings with loved ones, and more that you do not know enough about yet. 
 * [Start school.] -> School_side_hustle_W1
 
    = School_side_hustle_W1
     Week Zero and One seems to pass by quickly. Your nights in hall are spent talking with friends, having supper at the annoyingly convenient Supper Stretch, and trying out new sports with your newfound friends.
     
     At the end of the week, you decide to take a closer inspection of your entrepreneurial plans. If anything, you have two interests- animals and fashion. For now, you lean towards thrift store.
     
     You do a little bit of research and make a tentative decision. 
     * [Plan with the end goal of a thrift shop.] 
     ~ side_hustle = "thrift shop"
     -> Start_of_tutorials
     // * [Plan with the end goal of engraving pet name tags.]
     //~ side_hustle = "pet collar tags"
     // ->Start_of_tutorials
     
    = Start_of_tutorials
    Week Two peeks around the corner, and the first of many decisions comes your way. 
     
     After your first tutorial (DAO1704) on Monday morning, your coincidental deskmates ask you if you want to have lunch together. You learn their names are Zachary and Alan, who have been friends for a long time. They were planning to have lunch together anyway. 
     
     * [Agree to get lunch together.] 
          ~ friends += 1
          -> SSH_W2_go_home
     
     * [Pass on the lunch and have lunch alone instead.]
        -> SSH_W2_go_home
        
    = SSH_W2_go_home
    { friends > 0:
    You decide why not? They seem like a cool bunch to be around with. 
     
        After the meal, you decide that you had a good time with them.
        
        * [Go home.] ->SSH_W2_CCAdecisions
        
    - else: 
    You figure that class was tiring, and you weren't quite in the mood to make friends. 
     
         You find a seat at the Deck and order a promising bowl of fish noodle soup. 
     
        After a delicious and quiet meal at the Deck, you decide to
        * [Go home.] ->SSH_W2_CCAdecisions
    }
     
     = SSH_W2_CCAdecisions
     Outside of tutorials, you heard many things about university being a chance to try new sports. You have always wanted to try Ultimate Frisbee and you consider joining their weekly trainings. You also used to play floorball in secondary school.
     What do you plan to do?
     * [Apply to join Frisbee.]
     ~ CCA_num ++
     ~ CCA_name = "Frisbee"
     -> SSH_W2_end
     * [Apply to join Floorball.]
     ~ CCA_num ++
     ~ CCA_name = "Floorball"
     -> SSH_W2_end
     * [Apply for both.] 
     ~ CCA_num += 2
     ~ CCA_name = "Floorball and Frisbee"
     -> SSH_W2_end
     * [Choose not to apply for anything. ]
     ~ CCA_name = "none"
     -> SSH_W2_end
     
     = SSH_W2_end
     You decide on {CCA_name}.
     
     The week of your very first tutorials goes by uneventfully.  You meet many individuals that leaves you excited but also drained at times. Throughout the week, you had to make many decisions, such as deciding if you want to meet new friends, deciding on your CCA commitments and keeping up with the relentless information being dispensed. 
     
     To end every week off, you head out for a dinner with your usual supper buddies from hall, Edward and Thaddeus and have a good time :) 
    * [End week 3] -> SSH_W3_start
    
    = SSH_W3_start
    As week three begins, you realise you may have underestimated university. The workload for your modules starts to get heavy and you haven't been been able to focus on your larger plans outside of school. You attend some project meetings and presentation rehearsals during week 3-4. 
    
    { CCA_num:
    - 0: You have plenty of time, and spend time exploring your side hustle. You identify a suitable business model and logistics plan for your {side_hustle}.
    ~ consistency ++
        -> SSH_Recess_Week
    - 1: Given you also have {CCA_num} CCAs, you have to commit to their weekly trainings, which leaves you tired nearly every day. 
    -> SSH_Recess_Week
    - else:
        Given you also have {CCA_num} CCAs, you have to commit to their weekly trainings, which leaves you incredibly tired every day. You decide that you have to focus on one thing at a time now and work on your side hustle when you have more time. 
        * [End week 4] Recess week pulls around the corner. 
    -> SSH_Recess_Week
    }
    
    = SSH_Recess_Week
    Recess week begins. You are buried in work, and stressed for your first mid-terms, which are worth 30% of the module's grade. It is difficult to remain focussed, but you do your best anyway.
    
    You sit for the exams the week after. 
    *[Finish your last paper.]
    -> SSH_Post_Exams
    
    = SSH_Post_Exams
    You heave a sigh of relief as you finish your last paper. It didn't go especially bad, but neither did it go exceedingly well. You take a good long break, and treat yourself to a mala with friends at UTown, with some GongCha. 
    
    It is not long later that you receive an email for your results.
    * [View results.] 
        { CCA_num:
        - 0: You choose to view your results, and your perform surprisingly well. You achieved a mix of of As and A-s. You were able to keep up with the workload, and had time after class to revise the concepts again. A plus for not having any CCAs, you wonder to yourself. 
            ~ grades = grades + 3
        * [Start Week 8.] -> SSH_W8_start
        - 1: You choose to view your results, and your perform not too poorly. You achieved a mix of of A-s and B+s. You were able to keep up with most of the workload, and attempted revise after class the concepts again. "Just one CCA" might work for me", you think to yourself. 
            ~ grades = grades + 2
        * [Start Week 8.]-> SSH_W8_start
        - else:
            You choose to view your results, and you perform on average. You achieved a mix of of B+s and a B. You feel frustrated, but you remember that you missed a few lectures due to the CCA volume and did not keep up consistently with the workload. Regardless, you pick yourself up, and you say to yourself: "It is what it is".
            ~ grades = grades + 1
            * [Start Week 8.] -> SSH_W8_start
            }
    
    = SSH_W8_start
    You remember about your personal goal of having a side-hustle. Just after mid-terms might be the only pocket of time you have to work on it before lessons go into full swing again. 
    
    At the same time, your friend asks if you want to join a case competition organised by JLL Singapore. 
    
    What do you choose?
    * [Join your friends for the case competition.] -> SSH_Join_CaseComp
    * [Pass on the opportunity and research and develop your side-hustle plan.] -> SSH_Develop_Plan
    
    =SSH_Develop_Plan
    ~ consistency ++
    You do even more research into starting a thrift store. Here's what you have so far. Your business plan includes your business structure, inventory planning, and analysis into inventory planning and sales strategy. 
    
    Since you aim to derive some profit from your business, you must  register your company with the Singapore Government. Now you have to think of a name for your shop 
    * [Find Drips then Dips]
    ~ business_name = "Find Drips then Dips"
    -> SSH_Registered_Business
    * [Ugly Thrifts]
    ~ business_name = "Find Drips then Dips"
    -> SSH_Registered_Business
    * [Onion Rings and Other Funny Things]
    ~ business_name = "Onion Rings and Other Funny Things"
    -> SSH_Registered_Business
    * [I don't know]
    ~ business_name = "I don't know"
    -> SSH_Registered_Business
    
    = SSH_Registered_Business
    {business_name}! What a great name! You think to yourself. With that, you submit your application to ACRA and pay the $315. "This is it", you mutter to yourself. Things are finally getting off the ground. With a satisfied sigh, you take a rest, and post another of your cryptic story on Instagram to flex your creation. 
    -> SSH_W9_start
    
    = SSH_Join_CaseComp
    You decide to join the case competition with your friends, which takes up around three days of your time. You end up pitching a sustainable logistics solution for restocking supermarkets using dropshipping. 
    
    Having some prior experience in art, you design the pitch deck, which gets good reviews and constructive feedback. However, the business proposal fails to convince the judges. Your team achieves 4th place, and a pat on the back for your hard work. 
    
    Regardless, you view this as a great and positive learning experience. Your team members are also impressed with each others' performance and you agree to work as a team again in the future. Before you know it, tutorials start again in full swing and you are swarmed with assignments again. 
    * [Start Week 9.] -> SSH_W9_start
    
    = SSH_W9_start
    Week 9 rolls around the corner. 
    { CCA_num:
        - 0: You get some research into your side hustle since you have some time. You calculate that you need around 20k to start your {side_hustle} business.
        * [Start Week 10.] -> SSH_W10_start
        - 1: Your {CCA_name} CCA is opening applications for EXCO positions for the next semester. Do you want to try out for it?
        * [Try out for EXCO position.] You try to run for the Captain for {CCA_name}. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change. 
        ~ leadership_roles++
        
            Week 10 begins. -> SSH_W10_start
        - else:
            Both {CCA_name} are opening applications for EXCO positions for the next semester. Do you want to join?
            * [Try out for EXCO position.] You try to run for the Captain for {CCA_name}. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change. -> SSH_W10_start
            ~ leadership_roles += 2
            * [Choose not to.] -> SSH_W10_start
            }
    
    = SSH_W10_start
    Week 10 begins and you are swarmed with assignments again. 
    You meet at obscure timings when everyone in your project group can make it, and try your best to remain helpful and pull your weight. Of course, you see your fair share of unhelpful team members, but with a little prodding they listen to your requests and work is cleared on time. 
    
    The presentations are successful, although you are worried about one of the modules which you suspect you may have to S/U.
    * [Start Reading Week.] -> SSH_Start_Reading_Week
    
    = SSH_Start_Reading_Week
    Reading Week starts and you find yourself practicising past year papers individually in your room. However, the questions are not easy which makes you feel stressed. You are too shy to ask your friends, and so you simply skip the question if you are unable to figure them out. 
    // Find better studying tactics in Sem2
    
    Before long, it is Sunday, but you have one more practice paper you want to cram before the exam tomorrow at 9AM. What do you choose to do?
    * [Ignore the paper and decide sleep is more important.] You decide to go to bed instead, at 12AM. 
    ~ sleep_amount = 2
    -> SSH_Start_Exam
    * [Do the paper because you are stressed.] You decide to do it, and go to bed at 2AM. 
    ~ sleep_amount = 1
    -> SSH_Start_Exam
    
    = SSH_Start_Exam
    { sleep_amount:
    - 1:
    The examination goes reasonably well. With the extra sleep, you feel refreshed and are able to answer the auestions easily. However, you found out later that one of the questions came out in the past year paper that you didn't do. Regardless, you think to yourself: "If I didn't get enough sleep, I might not have been able to answer the other questions". 
    
        You continue working through the other exams and winter begins shortly. 
    - 2:
    The examination goes reasonably well. With lesser sleep, you start to feel lethargic towards the end. Thankfully however, the last question came out in the past year paper that you attempted the night before.
    
    You continue working through the other exams and soon winter begins shortly. 
    }
    { leadership_roles> 0:
    However, before summer starts, you are informed that you were voted in as the captain for {CCA_name}. You are surprised but also happy. Next semester will definitely be busy. 
    - else: 
    Winter comes round the corner. 
    }
    * [Start Winter.] -> SSH_Start_Winter
    
    = SSH_Start_Winter
    You move out of hall back home. 
    
    Here is how your Winter plans currently look like: 
    - Go overseas with your family for a week in Vietnam
    
    You have a few options on how to fill the rest of your 3 weeks. 
    * [Intern somewhere.] You decide to intern at a thrift store to find out how they function. It was eye-opening, although you notice that word of mouth and digital presence was what secured many of the customers.
    ~ consistency++
    -> SSH_Sem2_Starts
    * [Work on your thrift shop.] You spend the summer setting up your online website. You learn how to code a small amount of HTML/CSS, and with the help of your Computer Science friends, purchase a domain. It looks great!
    ~ consistency++
    -> SSH_Sem2_Starts
    * [Go on a one week vacation with your hall friends to Bali.] You have a blast with them in Bali, and when you return, you spend the rest of your time finally catching up with friends outside university and telling them how school went. 
    -> SSH_Sem2_Starts
    
    == SSH_Sem2_Starts
    School starts again! You move back into hall, albeit tiring, and complete the frustrating ModReg period easier than last semester.
    
    School does not last for long before the Chinese New Year break comes. 
    
    *[Start Chinese New Year] -> SSH_CNY_Start
    
    =SSH_CNY_Start
    You visit your extended family who reside in Malaysia. Your mother is Chinese while your father is Malay, so you end up visiting your mother's relatives in Malaysia. 
    
    They ask you the usual questions, such as if you have found a girlfriend already. "No," you reply, but you share with them about your plans of starting your own business. 
    
    Intrigued, they ask you what you have done to show for it. 
    {
    - consistency > 2:
    You take a short think and proudly tell them about what you have done, such as registering your company and starting a website. However, they seem unimpressed. 
    - consistency == 1:
    You take a think and tell them that you have done some research. Understandably, they seem unimpressed. 
    - else: 
    You take a think and tell them that you have only done some research. Understandably, they seem unimpressed. You also know that you had prioritised other activities, and there is little you can do right now to change that.  
    }
    
    * [Start Week 4.] -> SSH_S2_W4_start
    
    = SSH_S2_W4_start
    Before you know it, it is already Week 4, and the amount time given to understand content is drastically less compared to Semester 1. 
    You have a difficult time adjusting to your workload and your position as the captain for {CCA_name}. Still, you remain hardy and push on despite the lack of sleep. 
    
    As you work on one of your many projects, one member of a group becomes especially difficult to deal with. He does not show up for tutorials, which your group spends discussing on the final project. Furthermore, whenever work is allocated to him, he does not reply and when he does, the calibre of the content is severely lacking. 
    
    When it comes to the mid-sem peer review, he pleads on the Telegram group for you and your friend to give him a good score. You do not reply the message.
    
     On the feedback form you:
    * [Give him a poor score.] 
    -> SSH_S2_W5_Poor_Feedback
    * [Give him a good score.] -> SSH_S2_W5_Good_Feedback
    
    = SSH_S2_W5_Poor_Feedback
    You write about his shortcomings and his lack of contribution, and give a low score of 3/10. 
    * [Start Week 5.] -> SSH_S2_W5_Feedback
    
    = SSH_S2_W5_Good_Feedback
    You give him a good score but do not write much detailing his contributions.
    * [Start Week 5.] -> SSH_S2_W5_Feedback
    
    = SSH_S2_W5_Feedback
    As week five comes around, you notice a girl from your hall, who you have gotten to know over the past semester. You realise that you might be starting to take a deeper liking to her, as you have mutual friends, and during passing conversations she appeared independent, thoughtful and endearing in a warm way. Her name was Chelsea, and also the captain for softball, and also Edward's classmate in high school. 
    
    You however, regret discussing your feelings with Edward and Thaddeus, who constantly tease you whenever you see her around hall. 
    
    On Wednesday, Edward says that he's going for dinner with Chelsea tonight, and asks if you want to come along. 
    
    What do you do?
    * [Agree.] -> SSH_S2_W5_Agree
    * [Panic.] -> SSH_S2_W5_Panic
     
     =SSH_S2_W5_Panic
     You panic. "What? Wait I already have dinner plans!" you exclaim. 
    
     "Cancel them obviously," Edward replied. 
     
     You realise you already made that decision in your head. 
     
     * [Meet for dinner.]
     ->SSH_S2_W5_Meeting_Chelsea
     
     =SSH_S2_W5_Agree
     You agree, surprised that he invited you. He gives you a knowing wink and says: "I gotchu." 
     
     * [Meet for dinner.]
     ->SSH_S2_W5_Meeting_Chelsea
   
    
    = SSH_S2_W5_Meeting_Chelsea
    "So what do you do in your free time?" asks Chelsea at Al Amaans, the convenient supper spot near hall.  
    { leadership_roles > 0:
    Before you say anything, Edward interrupts: "David is the captain for {CCA_name} and he's also modestly working on a side hustle on his side.
    - else:
    Before you say anything, Edward says: "David is working on a crazy side hustle on his side, plus he's an academic weapon in school as well."
    }
    You give him a wry smile and thank him for his compliment. The rest of dinner goes great, and you hope you left a positive impression. You do not think much about it. 
    *[End Week 5] -> SSH_S2_W6_Peer_review
    
    = SSH_S2_W6_Peer_review
    You receive an personal email from your tutor for the module with the problematic group project. It writes:
    
    "It has come to my attention that everyone has been given a poor review by Jack. As the group leader for your team, I'd like to check if there are major issues with the team, and if you require my assistance."
    
    Some of Jack's feedback for the other members write: "Not useful at all; Does not reply messages; Does not provide suggestions and only turns ideas down".
    
    You are shocked, as Jack was the useless one who asked for everyone to give him a good review. Ironically, he embodies every point of the feedback. 
    
    What do you do?
    
     * [Reveal the truth.] -> SL_Reveal_truth
    
    = SL_Reveal_truth
    You draft an emotionally charged email back to the tutor. However, you delay sending the email until night, as you wish to phrase it as objectively as possible. 
    * [Start Week 7.]
    -> SSH_S2_W7
    
    = SSH_S2_W7
    Recess week comes by again.
    
    { CCA_num:
    - 0: This time, you have been staying on the ball with the content and you find plenty of time to continue to update your website with the clothes you are planning to sell and set up collections with your friends. 
        * [End Recess Week.]
        -> SSH_S2_Post_Midterms
    - 1: This time, you have been staying relatively on the ball with the content and you even find some time to set up agreements to collect clothing from your friends. 
        * [End Recess Week.]
        -> SSH_S2_Post_Midterms
    - else:
        Your CCA takes up most of the time the past few weeks, and welfare activities and booking of facilities together with training leaves you grossly unprepared for recess week. You spend it stressing and studying as much as you can. 
        * [End Recess Week.]
        -> SSH_S2_Post_Midterms
    }
    
    = SSH_S2_Post_Midterms
    Midterms are over. Results follow soon after. 
    { leadership_roles:
    - 0: Thankfully, your hard work has paid off and you achieve nearly all As. 
        * [Move on.] You hang out with friends and get yourself a little treat for your hard work.
        -> SSH_S2_Get_Girl
    - 1 :
    You achieve mostly A- and a single B+. You are satisfied with your performance!
        * [Move on.] You pick yourself up and dust yourself off. You also get yourself a little treat for your hard work.
        -> SSH_S2_Get_Girl
    - else: 
    You achieve mostly Bs and a single B+. You have been overloaded with commitments and lagged behind in content. You are unsurprised, but also disappointed.
        * [Move on.] You pick yourself up and dust yourself off. You get yourself a little treat for your hard work.
        -> SSH_S2_Get_Girl
    }
    
    = SSH_S2_Get_Girl
    Just then, you receive a text from Chelsea, who asks if you want to grab supper together. You discover Edward arranged for another supper and then mumbled something about "suddenly not being able to make it". 
    
    What do you do?
    
    *[Get cold feet and pass.] -> SSH_Double_it_and_give_it_to_no_one
    *[Go anyway.] -> SSH_SMASH
    
    = SSH_SMASH
    You agree, and it turns out to be a memorable night. The both of you walk to supper stretch, before spontaneously deciding to eat McDonald's and walking to HarbourFront. 
    
    It soon became the start of many many supper "dates", and you start to become deeply invested in the "friendship". 
    
    Before recess week starts, you give a little gift to Chelsea. It's a hug which she accepts.
    ~ rizz ++
    
    * [Start Recess Week.] -> SSH_S2_Finals
    
    = SSH_Double_it_and_give_it_to_no_one
    You decide to double it and give it to no one, so you decline the offer, saying you have to go home tonight. 
    
    You hope she asks again about it, but she never does. 
    
    You decide to join another case competition that your previous team recently suggested. 
    
    Your team end up winning first place, but you constantly find distractions to stop yourself from thinking about her. 
    
    * [Start Recess Week.] -> SSH_S2_Finals
    
    = SSH_S2_Finals
    In the second half of semester two, you promise to stay on the ball more often, so as finals pokes around the corner, you do not feel as stressed as before. 
    
    You manage to achieve excellent grades this time, pulling the score for nearly all your modules to an A. 
    *[Prepare for Summer.] -> SSH_Start_Summer
    
    == SSH_Start_Summer
    It is time to move out. 
    
    Before you know it, Year 1 comes to an end. You reflect on your successes and failures, and evaluate whether your goals have been met. 
    
    You decide on a few things on your last night in your little room you called home. 
    
    { consistency > 2:
    * [Decide to launch {side_hustle}.] -> SSH_Launch
    -else:
    * [Accept the internship you randomly applied for in Semester 1.] -> SSH_Accept_internship 
    * [Rest for the Summer.] -> SSH_Rest_Summer
    }
    
    = SSH_Launch
    You decide that you want to kick off {business_name} after a year's of hard work.
    
    * [The Last Decision.] -> SSH_Ask_Chelsea
    
    = SSH_Accept_internship
    You decide to accept the internship you thoughtlessly applied for in Semester 1. 
    
    * [The Last Decision.] -> SSH_Ask_Chelsea
     
     
    = SSH_Rest_Summer 
    You decide to take a rest for the summer, and take things as they come. 
    
    * [The Last Decision.] -> SSH_Ask_Chelsea
    
    = SSH_Ask_Chelsea
    Lastly, 
    
    You decide whether you want to take a leap of faith. 
    * [Ask Chelsea out.] You text Chelsea: "Supper next week at Springleaf?" ->  SSH_Sleep
    * [Hard Pass.] You decide no one has time for this. -> SSH_Sleep
    
    = SSH_Sleep
    With that, you drift off to sleep, ending your first academic year in NUS.
    -> END
    
    
    
 == Daryl_campus_life
 So you have decided you want to live a rich and fulfilling student life on campus. Naturally, you've heard so much from your seniors, siblings, and friends. That university will be the best years of your life, and you should cherish them well. 
 
 Gently, you let down the entrepreneurial idea, but something tugs at you. Nevertheless, you remain excited about the prospect of being free, independent and the chance to try things you've never done before. 
 
 It's not too late to go back. 
  + [Rethink your choice.] You decide to rethink your choice. 
  -> Business_School_Choice
  * [Stick to your decision.] -> Daryl_campus_life_confirm

== Daryl_campus_life_confirm
    = Campus_Life_W1
     Week Zero and One seems to pass by quickly. Your nights in hall are spent talking with friends, having supper at the annoyingly convenient Supper Stretch, and trying out new sports with your newfound friends.
     
     At the end of the week, you decide to take a closer inspection of your plans for university. You are inspired by the words of advice from your orientation seniors, and the seemingly at ease appearance of your seniors in the CCAs that you have attended try outs for.
     
     You plan to do a little bit of research and narrow down the clubs in NUS/hall that you are most interested in. How many CCAs do you plan to join?
     
    //  = SL_Number_of_interests
     * [1] 
     ~ interest_to_try = 1
     -> SL_interest
     * [2] 
     ~ interest_to_try = 2
     -> SL_interest
     * [3] 
     ~ interest_to_try = 3
     -> SL_interest
     * [4] 
     ~ interest_to_try = 4
     -> SL_interest
    
     = SL_interest
     You narrow down the CCAs that you're the most interested in, and then apply for them. 
        
    * [Floorball.] 
        ~ all_CCAs += floorball
        -> SL_interest
    * [Ultimate Frisbee.]
        ~ all_CCAs += frisbee
        -> SL_interest
    * [Squash.]
        ~ all_CCAs += squash
        -> SL_interest
    * [NUS Climbing.]
        ~ all_CCAs += climbing
        -> SL_interest
    * [NUS Fintech.] 
        ~ all_CCAs += fintech
        -> SL_interest
    * [Hall Committee.] 
        ~ all_CCAs += Hallcommittee
        -> SL_interest
    * {LIST_COUNT(all_CCAs) >= interest_to_try } [That's all.]
        -> SL_Specialisation_choice
     
    = SL_Specialisation_choice
    You hear about some students talking about a specialisation for business. Peer pressured, you decide to look it up. Which seems the most appealing to you?
    * [Business Analytics]
    ~ specialisation_choice = "Business Analytics"
    -> SL_Start_of_tutorials
    * [Innovation and Entrepreneurship Specialisation]
    ~ specialisation_choice = "Innovation and Entrepreneurship"
    -> SL_Start_of_tutorials
    * [Business Economics Specialisation]
    ~ specialisation_choice = "Business Economics"
    -> SL_Start_of_tutorials
    * [Leadership and Human Capital Management Specialisation]
    ~ specialisation_choice = "Leadership and Human Capital Management"
    -> SL_Start_of_tutorials
    * [Finance]
    ~ specialisation_choice = "Finance"
    -> SL_Start_of_tutorials
    * [Marketing Specialisation]
    ~ specialisation_choice = "Marketing Specialisation"
    -> SL_Start_of_tutorials
    * [Operations and Supply Chain Management]
    ~ specialisation_choice = "Operations and Supply Chain Management"
    -> SL_Start_of_tutorials
     
    = SL_Start_of_tutorials
    Week Two peeks around the corner, and the decisions don't stop coming your way. 
     
     After your first tutorial (DAO1704) on Monday morning, your coincidental deskmates ask you if you want to have lunch together. You learn their names are Zachary and Alan, who have been friends for a long time. They were planning to have lunch together anyway. 
     
     * [Agree to get lunch together.] 
          ~ friends += 1
          -> SL_W2_go_home
     
     * [Pass on the lunch and have lunch alone instead.]
        -> SL_W2_go_home
        
    = SL_W2_go_home
    { friends > 0:
    You decide why not? They seem like a cool bunch to be around with. 
     
        After the meal, you decide that you had a good time with them.
        
        * [Go home.] -> SL_W2_end
        
    - else: 
    You figure that class was tiring, and you weren't quite in the mood to make friends. 
     
         You find a seat at the Deck and order a promising bowl of fish noodle soup. 
     
        After a delicious and quiet meal at the Deck, you decide to
        * [Go home.] ->SL_W2_end
    }
     
     
     = SL_W2_end
     
     The week of your very first tutorials goes by uneventfully.  You meet many individuals that leaves you excited but also drained at times. Throughout the week, you had to make many decisions, such as deciding if you want to meet new friends, deciding on your CCA commitments and keeping up with the relentless information being dispensed. 
     
     To end every week off, you head out for a dinner with your usual supper buddies from hall, Edward and Thaddeus and have a good time :)
    * [End Week 2.] -> SL_W3_start
    
    = SL_W3_start
    As week three begins, you realise you may have underestimated university. The workload for your modules starts to get heavy. You attend some project meetings and presentation rehearsals during week 3-4. 
    
    { LIST_COUNT(all_CCAs) < 2:
    With {LIST_COUNT(all_CCAs)} CCAs, you are able to commit to their weekly trainings, which leaves you tired nearly every day. 
    -> SL_Recess_Week
    - else:
        Given you have {LIST_COUNT(all_CCAs)} CCAs, you have to commit to their weekly trainings, which leaves you incredibly tired every day. You are behind on content and struggle to keep up. 
        * [End Week 4.] -> SL_Recess_Week
    }
    
    = SL_Recess_Week
    Recess week pulls around the corner. 
    
    You are buried in work, and stressed for your first mid-terms, which are worth 30% of the module's grade. It is difficult to remain focussed, but you do your best anyway.
    
    You sit for the exams the week after. 
    *[Finish your last paper.]
    -> SL_Post_Exams
    
    = SL_Post_Exams
    You heave a sigh of relief as you finish your last paper. It didn't go especially bad, but neither did it go exceedingly well. You take a good long break, and treat yourself to a mala with friends at UTown, with some GongCha. 
    
    It is not long later that you receive an email for your results.
    * [View results.] 
        { LIST_COUNT(all_CCAs): 
        - 4: 
        You choose to view your results, and you perform on average. You achieved a mix of of B+s and a B. You feel frustrated, but you remember that you missed a few lectures due to the CCA volume and did not keep up consistently with the workload. Regardless, you pick yourself up, and you say to yourself: "It is what it is".
            ~ grades = grades + 1
            * [Start Week 8.] -> SL_W8_start
        - 3: You choose to view your results, and your perform not too poorly. You achieved a mix of of A-s and B+s. You were able to keep up with most of the workload, and attempted revise after class the concepts again. 
        
        "This might be working for me", you think to yourself. 
            ~ grades = grades + 2
        * [Start Week 8.]-> SL_W8_start
        - else:
            You choose to view your results, and your perform decently well. You achieved a mix of of As and A-s. You were able to keep up with the workload, and had time after class to revise the concepts again. A plus for having fewer CCAs, you wonder to yourself. 
            ~ grades = grades + 3
        * [Start Week 8.] -> SL_W8_start
            }
    
    = SL_W8_start
    You hear about your friends talk about their plans for internships. Just after mid-terms might be the only pocket of time you have to research on it, prepare for applications and set your goals before lessons go into full swing again. 
    
    * [Apply for internships.] -> SL_Apply_internships
    
    = SL_Apply_internships
    ~ consistency ++
    You do even more research into {specialisation_choice}
    
    {specialisation_choice == "finance": 
    You narrow down your search to UOB, HP and IRAS, amongst other financial institutions. 
    - else:
    You narrow down your search to IMDA, CirclesLife, Shoppee and EY, amongst others. 
    }
    
     * [Apply] You YOLO and apply to them and do not think much about it.
    -> SL_Join_CaseComp
    
    
    = SL_Join_CaseComp
    Not too long after, your friend asks if you want to join a case competition organised by JLL Singapore. 
    * [Join your friends for the case competition.] -> SL_Start_CaseComp
    * [Rest instead.] You decide to rest.
    -> SL_W9_start
    
    = SL_Start_CaseComp
    You decide to join the case competition with your friends, which takes up around three days of your time. You end up pitching a sustainable logistics solution for restocking supermarkets using dropshipping. 
    
    Having some prior experience in art, you design the pitch deck, which gets good reviews and constructive feedback. However, the business proposal fails to convince the judges. Your team achieves 4th place, and a pat on the back for your hard work. 
    
    Regardless, you view this as a great and positive learning experience. Your team members are also impressed with each others' performance and you agree to work as a team again in the future. Before you know it, tutorials start again in full swing and you are swarmed with assignments again. 
    * [Start Week 9.] -> SL_W9_start
    
    = SL_W9_start
    Week 9 rolls around the corner. 
    
    ~ CCA_name = CCAs(1)
    Your {CCA_name} CCA is opening applications for EXCO positions for the next semester. Do you want to try out for it?
        * [Try out for EXCO position.]
        ~ leadership_roles++
        -> SL_CCA_Exco_choice
        * [Choose not to.] -> SL_W10_start

    
    = SL_CCA_Exco_choice
    You try to run for the Captain for {CCA_name}. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change.
            
        *[Start Week 10.] -> SL_W10_start
        
    
    
    = SL_W10_start
    Week 10 begins and you are swarmed with assignments again. 
    You meet at obscure timings when everyone in your project group can make it, and try your best to remain helpful and pull your weight. Of course, you see your fair share of unhelpful team members, but with a little prodding they listen to your requests and work is cleared on time. 
    
    The presentations are successful, although you are worried about one of the modules which you suspect you may have to S/U.
    * [Start Reading Week.] -> SL_Start_Reading_Week
    
    = SL_Start_Reading_Week
    Reading Week starts and you find yourself practicising past year papers individually in your room. However, the questions are not easy which makes you feel stressed. You are too shy to ask your friends, and so you simply skip the question if you are unable to figure them out. 
    // Find better studying tactics in Sem2
    
    Before long, it is Sunday, but you have one more practice paper you want to cram before the exam tomorrow at 9AM. What do you choose to do?
    * [Ignore the paper and decide sleep is more important.] You decide to go to bed instead, at 12AM. 
    ~ sleep_amount = 2
    -> SL_Start_Exam
    * [Do the paper because you are stressed.] You decide to do it, and go to bed at 2AM. 
    ~ sleep_amount = 1
    -> SL_Start_Exam
    
    = SL_Start_Exam
    { sleep_amount:
    - 1:
    The examination goes reasonably well. With the extra sleep, you feel refreshed and are able to answer the auestions easily. However, you found out later that one of the questions came out in the past year paper that you didn't do. Regardless, you think to yourself: "If I didn't get enough sleep, I might not have been able to answer the other questions". 
    
        You continue working through the other exams and winter begins shortly. 
    - 2:
    The examination goes reasonably well. With lesser sleep, you start to feel lethargic towards the end. Thankfully however, the last question came out in the past year paper that you attempted the night before.
    
    You continue working through the other exams and soon winter begins shortly. 
    }
    { leadership_roles> 0:
    However, before summer starts, you are informed that you were voted in as the captain for {CCA_name}. You are surprised but also happy. Next semester will definitely be busy. 
    - else: 
    Winter comes round the corner. 
    }
    * [Start Winter.] -> SL_Start_Winter
    
    = SL_Start_Winter
    You move out of hall back home. 
    
    Here is how your Winter plans currently look like: 
    - Go overseas with your family for a week in Vietnam
    
    You have a few options on how to fill the rest of your 3 weeks. 
    * [Intern somewhere.] 
    -> SL_Before_Winter_intern
    * [Go on a one week vacation with your hall friends to Bali.] 
    -> SL_Before_Winter_travel
    
    = SL_Before_Winter_intern
    You decide to work part-time at a small cafe near your home, as you were unfortunately not accepted by any internship you applied to.
    
    You brush it off, and mutter: "It is, what it is."
     *[Start Summer.] -> SL_Sem2_Starts
    
    
    = SL_Before_Winter_travel
    You have a blast with them in Bali, and when you return, you spend the rest of your time finally catching up with friends outside university and telling them how school went. 
    *[Start Summer.] -> SL_Sem2_Starts
    
    == SL_Sem2_Starts
    School starts again! You move back into hall, albeit tiring, and complete the frustrating ModReg period easier than last semester.
    
    School does not last for long before the Chinese New Year break comes. 
    
    *[Start Chinese New Year.] -> SL_CNY_Start
    
    =SL_CNY_Start
    You visit your extended family who reside in Malaysia. Your mother is Chinese while your father is Malay, so you end up visiting your mother's relatives in Malaysia. 
    
    They ask you the usual questions, such as if you have found a girlfriend already. "No," you reply, but you share with them about your plans in Business School. 
    * [Hang around and vibe.] -> SL_vibing_CNY
    
    = SL_vibing_CNY
    
    Suddenly, you overhear someone quip: "Usually they're in business school because they aren't sure what they want to do. Look at Jenna, studying Engineering somemore!"
    
    Instantly, a cold chill passes over you, followed by a cold rage. You step out of the house before things can get out of control. You blink back tears of hurt, and make constipated sounds. Haters gonna hate, you say to yourself. 
    
    That dinner, you ensure you look into everyone's eyes with brimming confidence, or was it your tears?
    * [Start Week 4.] -> SL_S2_W4_start
    
    = SL_S2_W4_start
    Before you know it, it is already Week 4, and the amount time given to understand content is drastically less compared to Semester 1. 
    
    You have a difficult time adjusting to your workload and your position as the captain for {CCA_name}. Still, you remain hardy and push on despite the lack of sleep. 
    
    As you work on one of your many projects, one member of a group becomes especially difficult to deal with. He does not show up for tutorials, which your group spends discussing on the final project. Furthermore, whenever work is allocated to him, he does not reply and when he does, the calibre of the content is severely lacking. 
    
    When it comes to the mid-sem peer review, he pleads on the Telegram group for you and your friend to give him a good score. You do not reply the message.
    
    On the feedback form you:
    * [Give him a poor score.] 
    -> SL_S2_W5_Poor_Feedback
    * [Give him a good score.] -> SL_S2_W5_Good_Feedback
    
    = SL_S2_W5_Poor_Feedback
    You write about his shortcomings and his lack of contribution, and give a low score of 3/10. 
    * [Start Week 5.] -> SL_S2_W5_Feedback
    
    = SL_S2_W5_Good_Feedback
    You give him a good score but do not write much detailing his contributions.
    * [Start Week 5.] -> SL_S2_W5_Feedback
    
    = SL_S2_W5_Feedback
    As week five comes around, you notice a girl from your hall, who you have gotten to know over the past semester. You realise that you might be starting to take a deeper liking to her, as you have mutual friends, and during passing conversations she appeared independent, thoughtful and endearing in a warm way. Her name was Chelsea, and also the captain for softball, and also Edward's classmate in high school. 
    
    You however, regret discussing your feelings with Edward and Thaddeus, who constantly tease you whenever you see her around hall. 
    
    On Wednesday, Edward says that he's going for dinner with Chelsea tonight, and asks if you want to come along. 
    
        What do you do?
    * [Agree.] -> SL_S2_W5_Agree
    * [Panic.] -> SL_S2_W5_Panic
     
     =SL_S2_W5_Panic
     You panic. "What? Wait I already have dinner plans!" you exclaim. 
    
     "Cancel them obviously," Edward replied. 
     
     You realise you already made that decision in your head. 
     
     * [Meet for dinner.]
     ->SL_S2_W5_Meeting_Chelsea
     
     =SL_S2_W5_Agree
     You agree, surprised that he invited you. He gives you a knowing wink and says: "I gotchu." 
     
     * [Meet for dinner.]
     ->SL_S2_W5_Meeting_Chelsea
    
    
    = SL_S2_W5_Meeting_Chelsea
    "So what do you do in your free time?" asks Chelsea at Al Amaans, the convenient supper spot near hall.  
    { grades > 2:
    Before you say anything, Edward interrupts: "David is the captain for {CCA_name} plus he's an academic weapon in school as well.
    - else:
    Before you say anything, Edward says: "David is the captain for {CCA_name} and look at his arms!"
    }
    You give him a wry smile and thank him for his compliment. The rest of dinner goes great, and you hope you left a positive impression. You do not think much about it. 
    *[End Week 5.] -> SL_S2_W6_Peer_review
    
    = SL_S2_W6_Peer_review
    You receive an personal email from your tutor for the module with the problematic group project. 
    
    It writes:
    
    "It has come to my attention that everyone has been given a poor review by Jack. As the group leader for your team, I'd like to check if there are major issues with the team, and if you require my assistance."
    
    Some of Jack's feedback for the other members write: "Not useful at all; Does not reply messages; Does not provide suggestions and only turns ideas down".
    
    You are shocked, as Jack was the useless one who asked for everyone to give him a good review. Ironically, he embodies every point of the feedback. What do you do?
    
    * [Reveal the truth.] -> SL_Reveal_truth
    
    = SL_Reveal_truth
    You draft an emotionally charged email back to the tutor. However, you delay sending the email until night, as you wish to phrase it as objectively as possible. 
    * [Start Week 7.]
    -> SL_S2_W7
    
    = SL_S2_W7
    Recess week comes by again.
    
    { LIST_COUNT(CCAs):
    - 1: This time, you have been staying on the ball with the content and you find plenty of time to continue to update your website with the clothes you are planning to sell and set up collections with your friends. 
        * [End Recess Week.]
        -> SL_S2_Post_Midterms
    - 2: This time, you have been staying relatively on the ball with the content and you even find some time to try going clubbing with your friends. 
        * [End Recess Week.]
        -> SL_S2_Post_Midterms
    - else:
        Your CCAs takes up most of the time the past few weeks. With welfare activities and booking of facilities and training, you are grossly unprepared for recess week. You spend it stressing and studying as much as you can. 
        
        Your midterms start the next day.
        * [End Recess Week.]
        -> SL_S2_Post_Midterms
    }
    
    = SL_S2_Post_Midterms
    Time passes quickly and in a flurry. Before you know it, finals are over. Results follow soon after. 
    { LIST_COUNT(all_CCAs):
    - 1: Thankfully, your hard work has paid off and you achieve nearly all As. 
        * [Move on.] You hang out with friends and get yourself a little treat for your hard work.
        -> SL_S2_Get_Girl
    - 2 :
    You achieve mostly A- and a single B+. You are satisfied with your performance!
        * [Move on.] You pick yourself up and dust yourself off. You also get yourself a little treat for your hard work.
        -> SL_S2_Get_Girl
    - else: 
    You achieve mostly Bs and a single B+. You have been overloaded with commitments and lagged behind in content. You are unsurprised, but also disappointed.
        * [Move on.] You pick yourself up and dust yourself off. You get yourself a little treat for your hard work.
        -> SL_S2_Get_Girl
    }
    
    = SL_S2_Get_Girl
    Just then, you receive a text from Chelsea, who asks if you want to grab supper together. You discover Edward arranged for another supper and then mumbled something about "suddenly not being able to make it". 
    
    What do you do?
    
    *[Get cold feet and pass.] -> SL_Double_it_and_give_it_to_no_one
    *[Go anyway.] -> SL_SMASH
    
    = SL_SMASH
    You agree, and it turns out to be a memorable night. The both of you walk to supper stretch, before spontaneously deciding to eat McDonald's and walking to HarbourFront. 
    
    It soon became the start of many many supper "dates", and you start to become deeply invested in the "friendship". 
    
    Before recess week starts, you give a little gift to Chelsea. It's a hug which she accepts.
    ~ rizz ++
    
    * [Start Recess Week.] -> SL_S2_Finals
    
    = SL_Double_it_and_give_it_to_no_one
    You decide to double it and give it to no one, so you decline the offer, saying you have to go home tonight. 
    
    You hope she asks again about it, but she never does. 
    
    You decide to join another case competition that your previous team recently suggested. 
    
    Your team end up winning first place, but you are clearly find distractions to stop yourself from thinking about her. 
    
    * [Start Recess Week.] -> SL_S2_Finals
    
    = SL_S2_Finals
    In the second half of semester two, you promise to stay on the ball more often, so as finals pokes around the corner, you do not feel as stressed as before. 
    
    You manage to achieve excellent grades this time, pulling the score for nearly all your modules to an A. 
    *[Prepare for Summer.] -> SL_Start_Summer
    
    == SL_Start_Summer
    It is time to move out. 
    
    Before you know it, Year 1 comes to an end. You reflect on your successes and failures, and evaluate whether your goals have been met. 
    
    You decide on a few things on your last night in your little room you called home. 
    
    * [Accept the internship you randomly applied for in Semester 1.] -> SL_Accept_internship 
    * [Rest for the Summer.] -> SL_Rest_Summer
    
    = SL_Accept_internship
    You decide to accept the internship you thoughtlessly applied for in Semester 1. 
    
    * [The Last Decision.] -> SL_Ask_Chelsea
     
     
    = SL_Rest_Summer 
    You decide to take a rest for the summer, and take things as they come. 
    
    * [The Last Decision.] -> SL_Ask_Chelsea
    
    = SL_Ask_Chelsea
    Lastly, 
    
    You decide whether you want to take a leap of faith. 
    * [Ask Chelsea out.] You text Chelsea: "Supper next week at Springleaf?" ->  SL_Sleep
    * [Hard Pass.] You decide no one has time for this. -> SL_Sleep
    
    = SL_Sleep
    With that, you drift off to sleep, ending your first academic year in NUS.
    -> END
 
