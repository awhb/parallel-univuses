// Business school kid

VAR grades = 0
VAR consistency = 0
VAR leadership_roles = 0
VAR CCAs = 0
VAR interest_to_try = 0
VAR rizz = 0
VAR CCA_name = ""
VAR side_hustle = "side hustle"
VAR business_name = ""
VAR friends = 0
VAR sleep_amount = 0
VAR specialisation_choice = ""

-> Start_Business_School
== Start_Business_School
You take a deep think about what you want out of NUS Business School. 

You were always a natural leader and a community-driven person. School to you naturally looked like the perfect place for you to find your crowd and lead your CCAs and EXCOs to greater heights. On the flip side, you've always wanted to try running your own business, and being a fashionable person yourself, you often toyed with the idea of your own thrift shop.

You know that doing both makes a poor decision. Neither of the goals would meaningfully recieve your fullest attention. 

How do you envision your univeristy life?

 + [Make make the most out of your hall life and join CCAs.] -> Daryl_campus_life
 + [Focus on nurturing your entrepreneurial goal, a thrift shop.]  -> Daryl_side_hustle
 
 == Daryl_side_hustle
 So you have decided to try something different. This journey will be tough and arduous, and not as glamourous as it sounds. You will not be able to look back after this, but you can surely at the end of it have said you tried. It's not too late to go back.
 + [Rethink your choice.] You decide to rethink your choice. 
 -> Start_Business_School
 * [Stick to your decision.] -> Daryl_side_hustle_confirm
 
 == Daryl_side_hustle_confirm
 This is it. The path of no return. With that decision in mind, you are reminded that you will have to compromise on your participation in CCAs, meetings with loved ones, and more that you do not know enough about yet. 
 * [Start school] -> School_side_hustle_W1
 
    = School_side_hustle_W1
     Week Zero and One seems to pass by quickly. Your nights in hall are spent talking with friends, having supper at the annoyingly convenient Supper Stretch, and trying out new sports with your newfound friends.
     
     At the end of the week, you decide to take a closer inspection of your entrepreneurial plans. If anything, you have two interests- animals and fashion. Naturally, you leaning towards thrift store, or something animal related. 
     
     You do a little bit of research and make a tentative decision. 
     * [Plan with the end goal of a thrift shop.] 
     ~ side_hustle = "thrift shop"
     -> Start_of_tutorials
     // * [Plan with the end goal of engraving pet name tags.]
     //~ side_hustle = "pet collar tags"
     // ->Start_of_tutorials
     
    = Start_of_tutorials
    Week Two peeks around the corner, and the first of many decisions comes your way. 
     
     After your first tutorial (DAO1704) on Monday morning, your coincidental deskmates ask you if you want to have lunch together. Their names are Zachary and Alan, who have been friends for a long time. They were planning to have lunch together anyway. 
     
     * [Agree to get lunch together.] You decide why not? They seem like a cool bunch to be around with. 
     
        After the meal, you decide that you had a good time with them, and you head back home for the day.
          ~ friends += 1
          -> SSH_W2_CCAdecisions
     
     * [Pass on the lunch and have lunch alone instead.] You figure that class was tiring, and you weren't quite in the mood to make friends. 
     
         You find a seat at the Deck and order a promising bowl of fish noodle soup. 
     
        After a delicious and quiet meal at the Deck, you head back home for the day. 
        -> SSH_W2_CCAdecisions
     
     = SSH_W2_CCAdecisions
     Outside of tutorials, you have always wanted to try Ultimate Frisbee and you consider joining their weekly trainings. You also used to play floorball in secondary school.
     What do you plan to do?
     * [Apply to join Frisbee.]
     ~ CCAs ++
     ~ CCA_name = "Frisbee"
     -> SSH_W2_end
     * [Apply to join Floorball.]
     ~ CCAs ++
     ~ CCA_name = "Floorball"
     -> SSH_W2_end
     * [Apply for both.] 
     ~ CCAs += 2
     ~ CCA_name = "Floorball and Frisbee"
     -> SSH_W2_end
     * [Choose not to apply for anything. ]
     ~ CCA_name = "none"
     -> SSH_W2_end
     
     = SSH_W2_end
     You decide on {CCA_name}.
     
     The week of your very first tutorials goes by uneventfully.  You meet many individuals that leaves you excited but also drained at times. Throughout the week, you had to make many decisions, such as deciding if you want to meet new friends, deciding on your CCA commitments and keeping up with the relentless information being dispensed. 
     
     To end every week off, you head out for a dinner with your usual supper buddies from hall, Edward and Thaddeus and have a laugh. 
    * [End week 3] -> SSH_W3_start
    
    = SSH_W3_start
    As week three begins, you realise you may have underestimated university. The workload for your modules starts to get heavy and you haven't been been able to focus on your larger plans outside of school. You attend some project meetings and presentation rehearsals during week 3-4. 
    
    { CCAs:
    - 0: You have plenty of time, and spend time exploring your side hustle. You identify a suitable business model and logistics plan for your {side_hustle}.
    ~ consistency ++
        -> SSH_Recess_Week
    - 1: Given you also have {CCAs} CCAs, you have to commit to their weekly trainings, which leaves you tired nearly every day. 
    -> SSH_Recess_Week
    - else:
        Given you also have {CCAs} CCAs, you have to commit to their weekly trainings, which leaves you incredibly tired every day. You decide that you have to focus on one thing at a time now and work on your side hustle when you have more time. 
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
        { CCAs:
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
    * Find Drips then Dips
    ~ business_name = "Find Drips then Dips"
    -> SSH_Registered_Business
    * Ugly Thrifts 
    ~ business_name = "Find Drips then Dips"
    -> SSH_Registered_Business
    * Onion Rings and Other Funny Things
    ~ business_name = "Onion Rings and Other Funny Things"
    -> SSH_Registered_Business
    * I don't know
    ~ business_name = "I don't know"
    -> SSH_Registered_Business
    
    = SSH_Registered_Business
    ! What a great name! You think to yourself. With that, you submit your application to ACRA and pay the $315. "This is it", you think to yourself. Things are finally getting off the ground. With a satisfied sigh, you take a rest, and post a cryptic story on Instagram to flex your creation. 
    -> SSH_W9_start
    
    
    
    = SSH_Join_CaseComp
    You decide to join the case competition with your friends, which takes up around three days of your time. You end up pitching a sustainable logistics solution for restocking supermarkets using dropshipping. 
    
    Having some prior experience in art, you design the pitch deck, which gets good reviews and constructive feedback. However, the business proposal fails to convince the judges. Your team achieves 4th place, and a pat on the back for your hard work. 
    
    Regardless, you view this as a great and positive learning experience. Your team members are also impressed with each others' performance and you agree to work as a team again in the future. Before you know it, tutorials start again in full swing and you are swarmed with assignments again. 
    * [Start Week 9.] -> SSH_W9_start
    
    = SSH_W9_start
    Week 9 rolls around the corner. 
    { CCAs:
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
    * [Give him a poor score.] You write about his shortcomings and his lack of contribution, and give a low score of 3/10. 
    -> SSH_S2_W5_Feedback
    * [Give him a good score.] You give him a good score but do not write much detailing his contributions. -> SSH_S2_W5_Feedback
    
    = SSH_S2_W5_Feedback
    As week five comes around, you notice a girl from your hall, who you have gotten to know over the past semester. You realise that you might be starting to take a deeper liking to her, as you have mutual friends, and during passing conversations she appeared independent, thoughtful and endearing in a warm way. Her name was Chelsea, and also the captain for softball, and also Edward's classmate in high school. 
    
    You however, regret discussing your feelings with Edward and Thaddeus, who constantly tease you whenever you see her around hall. 
    
    On Wednesday, Edward says that he's going for dinner with Chelsea tonight, and asks if you want to come along. 
    
    What do you do?
    * [Agree.] You agree, surprised that he invited you. He gives you a knowing wink and says: "I gotchu." ->SSH_S2_W5_Meeting_Chelsea
    * [Panic.] You panic. "What? Wait I already have dinner plans!" you exclaim. 
    
     "Cancel them obviously," Edward replied. You realise you already made that decision in your head. 
     -> SSH_S2_W5_Meeting_Chelsea
   
    
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
    
    You are shocked, as Jack was the one who asked for everyone to give him a good review. Ironically, he embodies every point of the feedback. What do you do?
    
    * [Reveal the truth] You draft an emotionally charged email back to the tutor. However, you delay sending the email until night, as you wish to phrase it as objectively as possible. -> SSH_S2_W7
    
    = SSH_S2_W7
    Recess week comes by again.
    
    { CCAs:
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
    
    -> SSH_S2_Chase_Girl_Decision
    
    = SSH_S2_Chase_Girl_Decision
    { rizz > 0:
    By now, both you and Chelsea are dating. 
    * [Go travel together.] Both of you want to go to Vietnam together, so the both of you plan to travel together, in early June. -> SSH_S2_Summer_Choices
    - else: 
    You decide you want to take a leap of faith. 
    * [Ask Chelsea out] You text Chelsea: "Supper next week at Springleaf?" -> SSH_S2_Summer_Choices
    }
    
    = SSH_S2_Summer_Choices
    You think about other things that you want to occupy your Summer with. 
    { consistency > 2:
    * [Decide to launch {side_hustle}.] You decide that you want to kick off {business_name} after a year's of hard work. With that, you drift off to sleep, ending your first academic year in NUS. -> END
    - else: 
    * [Accept the internship you randomly applied for in Semester 1.] You decide to accept the internship you thoughtlessly applied for in Semester 1. With that, you drift off to sleep, ending your first academic year in NUS.-> END
     * [Rest for the Summer.] You decide to take a rest for the summer, and take things as they come. With that, you drift off to sleep, ending your first academic year in NUS. -> END
    }
    
 == Daryl_campus_life
 So you have decided you want to live a rich and fulfilling student life on campus. Naturally, you've heard so much from your seniors, siblings, and friends. That university will be the best years of your life, and you should cherish them well. 
 
 Gently, you let down the entrepreneurial idea, but something tugs at you. Nevertheless, you remain excited about the prospect of being free, independent and to chance to try things you've never done before. 
 
 It's not too late to go back. 
  + [Rethink your choice.] You decide to rethink your choice. 
  -> Start_Business_School
  * [Stick to your decision.] -> Daryl_campus_life_confirm

== Daryl_campus_life_confirm
    = Campus_Life_W1
     Week Zero and One seems to pass by quickly. Your nights in hall are spent talking with friends, having supper at the annoyingly convenient Supper Stretch, and trying out new sports with your newfound friends.
     
     At the end of the week, you decide to take a closer inspection of your plans for university. You are inspired by the words of advice from your orientation seniors, and the seemingly at ease appearance of your seniors in the CCAs that you have attended try outs for.
     
     You plan to do a little bit of research and narrow down the clubs in NUS/hall that you are most interested in. You also decide the number of CCAs you plan to join. 
     * [Floorball] 
        ~ interest_to_try = "Floorball"
        -> SL_Number_of_interests
         * [Ultimate Frisbee] 
         ~ interest_to_try = "Ultimate Frisbee"
         -> SL_Number_of_interests
     * [Squash]
         ~ interest_to_try = "Squash"
         -> SL_Number_of_interests
     * [NUS Climbing]
        ~ interest_to_try = "Rock Climbing"
        -> SL_Number_of_interests
     * [NUS FinTech]
        ~ interest_to_try = "NUS FinTech"
        -> SL_Number_of_interests
     * [Hall Committee] 
        ~ interest_to_try = "Hall Committee"
        -> SL_Number_of_interests
        
     
     = SL_Number_of_interests
     * [1] 
     ~ interest_to_try = 1
     -> SL_Specialisation_choice
     * [2] 
     ~ interest_to_try = 2
     -> SL_Specialisation_choice
     * [3] 
     ~ interest_to_try = 3
     -> SL_Specialisation_choice
     * [4] 
     ~ interest_to_try = 4
     -> SL_Specialisation_choice
     
    = SL_Specialisation_choice
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
    Week Two peeks around the corner, and the first of many decisions comes your way. 
     
     After your first tutorial (DAO1704) on Monday morning, your coincidental deskmates ask you if you want to have lunch together. Their names are Zachary and Alan, who have been friends for a long time. They were planning to have lunch together anyway. 
     
     * [Agree to get lunch together.] You decide why not? They seem like a cool bunch to be around with. 
     
        After the meal, you decide that you had a good time with them, and you head back home for the day.
          ~ friends += 1
          -> SL_W2_CCAdecisions
     
     * [Pass on the lunch and have lunch alone instead.] You figure that class was tiring, and you weren't quite in the mood to make friends. 
     
         You find a seat at the Deck and order a promising bowl of fish noodle soup. 
     
        After a delicious and quiet meal at the Deck, you head back home for the day. 
        -> SL_W2_CCAdecisions
     
     = SL_W2_CCAdecisions
     Outside of tutorials, you have always wanted to try {interest_to_try} and you consider joining their weekly trainings. You also used to play floorball in secondary school. You remember you wanted to join {interest_to_try} CCAs. 
     
     What do you plan to do?
     
    //  -> Loop_num_interests(interests_to_try, 0)
     
    //  === Loop_num_interests(num_interest, counter) ===
    //  { num_interests > counter:
    //         -> Loop_num_interests(num_interest, counter + 1)
    //     - else:
    //     -> break
    //     }
     
     * [Apply to join {interest_to_try}]
     ~ CCAs ++
     ~ CCA_name = interest_to_try
     -> SL_W2_end
     * [Apply to join Floorball.]
     ~ CCAs ++
     ~ CCA_name = "Floorball"
     -> SL_W2_end
     * [Apply for both.] 
     ~ CCAs += 2
     ~ CCA_name = "Floorball and Frisbee"
     -> SL_W2_end
     * [Choose not to apply for anything. ]
     ~ CCA_name = "none"
     -> SL_W2_end
     
     = SL_W2_end
     You decide on {CCA_name}.
     
     The week of your very first tutorials goes by uneventfully.  You meet many individuals that leaves you excited but also drained at times. Throughout the week, you had to make many decisions, such as deciding if you want to meet new friends, deciding on your CCA commitments and keeping up with the relentless information being dispensed. 
     
     To end every week off, you head out for a dinner with your usual supper buddies from hall, Edward and Thaddeus and have a laugh. 
    * [End week 3] -> SL_W3_start
    
    = SL_W3_start
    As week three begins, you realise you may have underestimated university. The workload for your modules starts to get heavy. You attend some project meetings and presentation rehearsals during week 3-4. 
    
    { CCAs < 2:
    With {CCAs} CCAs, you are able to commit to their weekly trainings, which leaves you tired nearly every day. 
    -> SL_Recess_Week
    - else:
        Given you have {CCAs} CCAs, you have to commit to their weekly trainings, which leaves you incredibly tired every day. You are behind on content and struggle to keep up. 
        * [End week 4] Recess week pulls around the corner. 
    -> SL_Recess_Week
    }
    
    = SL_Recess_Week
    Recess week begins. You are buried in work, and stressed for your first mid-terms, which are worth 30% of the module's grade. It is difficult to remain focussed, but you do your best anyway.
    
    You sit for the exams the week after. 
    *[Finish your last paper.]
    -> SL_Post_Exams
    
    = SL_Post_Exams
    You heave a sigh of relief as you finish your last paper. It didn't go especially bad, but neither did it go exceedingly well. You take a good long break, and treat yourself to a mala with friends at UTown, with some GongCha. 
    
    It is not long later that you receive an email for your results.
    * [View results.] 
        { CCAs: 
        - 4: 
        You choose to view your results, and you perform on average. You achieved a mix of of B+s and a B. You feel frustrated, but you remember that you missed a few lectures due to the CCA volume and did not keep up consistently with the workload. Regardless, you pick yourself up, and you say to yourself: "It is what it is".
            ~ grades = grades + 1
            * [Start Week 8.] -> SL_W8_start
        - 3: You choose to view your results, and your perform not too poorly. You achieved a mix of of A-s and B+s. You were able to keep up with most of the workload, and attempted revise after class the concepts again. "Just one CCA" might work for me", you think to yourself. 
            ~ grades = grades + 3
        * [Start Week 8.]-> SL_W8_start
        - else:
            You choose to view your results, and your perform decently well. You achieved a mix of of As and A-s. You were able to keep up with the workload, and had time after class to revise the concepts again. A plus for not having any CCAs, you wonder to yourself. 
            ~ grades = grades + 3
        * [Start Week 8.] -> SL_W8_start
            }
    
    = SL_W8_start
    You hear about your friends talk about their plans for specialisations in business. Just after mid-terms might be the only pocket of time you have to research on it, prepare for applications for internships and set your goals before lessons go into full swing again. 
    
    * [Apply for internships.] -> SL_Apply_internships
    
    = SL_Apply_internships
    ~ consistency ++
    You do even more research into {specialisation_choice}
    
    {specialisation_choice == "finance": 
    You narrow down your search to UOB, HP and IRAS, amongst other financial institutions. 
    * [Apply] You apply to them and do not think much about it.
    -> SL_Join_CaseComp
    - else:
    You narrow down your search to IMDA, CirclesLife, Shoppee and EY, amongst others. 
    -> SL_Join_CaseComp
    }
    
    = SL_Join_CaseComp
    At the same time, your friend asks if you want to join a case competition organised by JLL Singapore. 
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
    { CCAs:
        - 1: Your {CCA_name} CCA is opening applications for EXCO positions for the next semester. Do you want to try out for it?
        * [Try out for EXCO position.] You try to run for the Captain for {CCA_name}. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change. 
        ~ leadership_roles++
        
            Week 10 begins. -> SL_W10_start
        - else:
            Both {CCA_name} are opening applications for EXCO positions for the next semester. Do you want to join?
            * [Try out for EXCO position.] You try to run for the Captain for {CCA_name}. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change. -> SL_W10_start
            ~ leadership_roles += 2
            * [Choose not to.] -> SL_W10_start
            }
    
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
    * [Intern somewhere.] You decide to work part-time at a small cafe near your home. It was eye-opening, although you notice that word of mouth and digital presence was what secured many of the customers.
    ~ consistency++
    -> SL_Sem2_Starts
    * [Go on a one week vacation with your hall friends to Bali.] You have a blast with them in Bali, and when you return, you spend the rest of your time finally catching up with friends outside university and telling them how school went. 
    -> SL_Sem2_Starts
    
    == SL_Sem2_Starts
    School starts again! You move back into hall, albeit tiring, and complete the frustrating ModReg period easier than last semester.
    
    School does not last for long before the Chinese New Year break comes. 
    
    *[Start Chinese New Year] -> SL_CNY_Start
    
    =SL_CNY_Start
    You visit your extended family who reside in Malaysia. Your mother is Chinese while your father is Malay, so you end up visiting your mother's relatives in Malaysia. 
    
    They ask you the usual questions, such as if you have found a girlfriend already. "No," you reply, but you share with them about your plans in Business School. 
    
    Later on, you overhear someone quip in passing, "Usually they're in business school because they aren't sure what they want to do. Look at Jenna, studying Engineering somemore!"
    
    Instantly, a cold chill passes over you, followed by a cold rage. You step out of the house before things can get out of control. You blink back tears of hurt, and steel yourself once more. Haters gonna hate, you say to yourself. 
    That dinner, you ensure you look into everyone's eyes with brimming confidence. 
    * [Start Week 4.] -> SL_S2_W4_start
    
    = SL_S2_W4_start
    Before you know it, it is already Week 4, and the amount time given to understand content is drastically less compared to Semester 1. 
    
    You have a difficult time adjusting to your workload and your position as the captain for {CCA_name}. Still, you remain hardy and push on despite the lack of sleep. 
    
    As you work on one of your many projects, one member of a group becomes especially difficult to deal with. He does not show up for tutorials, which your group spends discussing on the final project. Furthermore, whenever work is allocated to him, he does not reply and when he does, the calibre of the content is severely lacking. 
    
    When it comes to the mid-sem peer review, he pleads on the Telegram group for you and your friend to give him a good score. You do not reply the message.
    
    On the feedback form you:
    * [Give him a poor score.] You write about his shortcomings and his lack of contribution, and give a low score of 3/10. 
    -> SL_S2_W5_Feedback
    * [Give him a good score.] You give him a good score but do not write much detailing his contributions. -> SL_S2_W5_Feedback
    
    = SL_S2_W5_Feedback
    As week five comes around, you notice a girl from your hall, who you have gotten to know over the past semester. You realise that you might be starting to take a deeper liking to her, as you have mutual friends, and during passing conversations she appeared independent, thoughtful and endearing in a warm way. Her name was Chelsea, and also the captain for softball, and also Edward's classmate in high school. 
    
    You however, regret discussing your feelings with Edward and Thaddeus, who constantly tease you whenever you see her around hall. 
    
    On Wednesday, Edward says that he's going for dinner with Chelsea tonight, and asks if you want to come along. 
    
    What do you do?
    * [Agree.] You agree, surprised that he invited you. He gives you a knowing wink and says: "I gotchu." ->SL_S2_W5_Meeting_Chelsea
    * [Panic.] You panic. "What? Wait I already have dinner plans!" you exclaim. 
    
     "Cancel them obviously," Edward replied. You realise you already made that decision in your head. 
     -> SL_S2_W5_Meeting_Chelsea
   
    
    = SL_S2_W5_Meeting_Chelsea
    "So what do you do in your free time?" asks Chelsea at Al Amaans, the convenient supper spot near hall.  
    { grades > 2:
    Before you say anything, Edward interrupts: "David is the captain for {CCA_name} plus he's an academic weapon in school as well.
    - else:
    Before you say anything, Edward says: "David is the captain for {CCA_name} and look at his arms!"
    }
    You give him a wry smile and thank him for his compliment. The rest of dinner goes great, and you hope you left a positive impression. You do not think much about it. 
    *[End Week 5] -> SL_S2_W6_Peer_review
    
    = SL_S2_W6_Peer_review
    You receive an personal email from your tutor for the module with the problematic group project. It writes:
    
    "It has come to my attention that everyone has been given a poor review by Jack. As the group leader for your team, I'd like to check if there are major issues with the team, and if you require my assistance."
    
    Some of Jack's feedback for the other members write: "Not useful at all; Does not reply messages; Does not provide suggestions and only turns ideas down".
    
    You are shocked, as Jack was the one who asked for everyone to give him a good review. Ironically, he embodies every point of the feedback. What do you do?
    
    * [Reveal the truth] You draft an emotionally charged email back to the tutor. However, you delay sending the email until night, as you wish to phrase it as objectively as possible. -> SL_S2_W7
    
    = SL_S2_W7
    Recess week comes by again.
    
    { CCAs:
    - 1: This time, you have been staying on the ball with the content and you find plenty of time to continue to update your website with the clothes you are planning to sell and set up collections with your friends. 
        * [End Recess Week.]
        -> SL_S2_Post_Midterms
    - 2: This time, you have been staying relatively on the ball with the content and you even find some time to try going clubbing with your friends. 
        * [End Recess Week.]
        -> SL_S2_Post_Midterms
    - else:
        Your CCA takes up most of the time the past few weeks, and welfare activities and booking of facilities together with training leaves you grossly unprepared for recess week. You spend it stressing and studying as much as you can. 
        * [End Recess Week.]
        -> SL_S2_Post_Midterms
    }
    
    = SL_S2_Post_Midterms
    Midterms are over. Results follow soon after. 
    { leadership_roles:
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
    
    Your team end up winning first place, but you constantly find distractions to stop yourself from thinking about her. 
    
    * [Start Recess Week.] -> SL_S2_Finals
    
    = SL_S2_Finals
    In the second half of semester two, you promise to stay on the ball more often, so as finals pokes around the corner, you do not feel as stressed as before. 
    
    You manage to achieve excellent grades this time, pulling the score for nearly all your modules to an A. 
    *[Prepare for Summer.] -> SL_Start_Summer
    
    == SL_Start_Summer
    It is time to move out. 
    
    Before you know it, Year 1 comes to an end. You reflect on your successes and failures, and evaluate whether your goals have been met. 
    
    You decide on a few things on your last night in your little room you called home. 
    
    -> SL_S2_Chase_Girl_Decision
    
    = SL_S2_Chase_Girl_Decision
    { rizz > 0:
    By now, both you and Chelsea are dating. 
    * [Go travel together.] Both of you want to go to Vietnam together, so the both of you plan to travel together, in early June. -> SL_S2_Summer_Choices
    - else: 
    You decide you want to take a leap of faith. 
    * [Ask Chelsea out] You text Chelsea: "Supper next week at Springleaf?" -> SL_S2_Summer_Choices
    }
    
    = SL_S2_Summer_Choices
    You think about other things that you want to occupy your Summer with. 
    { consistency > 2:
    * [Decide to launch {side_hustle}.] You decide that you want to kick off {business_name} after a year's of hard work. With that, you drift off to sleep, ending your first academic year in NUS. -> END
    - else: 
    * [Accept the internship you randomly applied for in Semester 1.] You decide to accept the internship you thoughtlessly applied for in Semester 1. With that, you drift off to sleep, ending your first academic year in NUS.-> END
     * [Rest for the Summer.] You decide to take a rest for the summer, and take things as they come. With that, you drift off to sleep, ending your first academic year in NUS. -> END
    }
    -> END
