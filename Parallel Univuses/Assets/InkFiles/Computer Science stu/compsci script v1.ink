// Computer Science girl

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

-> Start_CompScience
== Start_CompScience
You attend orientation. You don't know what to expect from this choice you made a few months ago. Your decision often raised eyebrows when you discussed university plans with your friends. "You're doing Computer Science?" were frequent questions that you didn't think need more than one clarification with that much incredulity. 
Still, you decide to stick to it. You take a deep think about why you picked the major.
* [You were always fascinated by computers, programming, and how things worked behind the screen.] -> Bess_passion_path
* [You simply heard from family that it was a lucrative degree with a bright future.] -> Bess_money_path


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
    ~ CCAs ++
    ~ CCA_name = "Floorball"
    -> PP_W3_end
     * [Apply to join Frisbee.]
     ~ CCAs ++
     ~ CCA_name = "Frisbee"
     -> PP_W3_end
     * [Apply for both.] 
     ~ CCAs += 2
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
    * [Consider giving up.] You consider giving up, so you text one of your friends and share your predictament. She gently tells you that giving up and letting the workload snowball will not add to your relief. She tells you to just do what you can and then decide after Semester 1. -> PP_W6_start
    
    = PP_W6_start
    Recess Week peeks around the corner. You keep your head down and push your way through deadline after deadline.
    
    You also manage to complete the assignments with much difficulty, did your best for the practical exam and the quizzes.
    
    You find yourself saving your meetups with friends you genuinely appreciate and slowly acclimatise to the constant state of rigour. You are more comfortable with saying no to CCA trainings. 
    * [Start Recess Week] -> PP_Recess_week_start

    = PP_Recess_week_start
    Recess week is spent practicising past year papers. It is difficult to remain focussed, but you do your best anyway. 
    
    You sit for the examinations the week after. 
    *[Finish your last paper.]
    -> SSH_Post_Exams
    
    = SSH_Post_Exams
    You heave a sigh of relief as you finish your last paper. It didn't go especially bad, but neither did it go exceedingly well. You take a good long break, and treat yourself to a mala with friends at UTown, with some GongCha. 
    
    It is not long later that you receive an email for your results.
    * [View results.] 
        { CCAs:
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
    
    { CCAs:
        - 0: -> PP_W10_start
        - 1: Your {CCA_name} CCA is opening applications for EXCO positions for the next semester. Do you want to try out for it?
        * [Try out for EXCO position.] You try to run for the Captain for {CCA_name}. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change. 
        ~ leadership_roles++
        
            Week 10 begins. -> PP_W10_start
        - else:
            Both {CCA_name} are opening applications for EXCO positions for the next semester. Do you want to join?
            * [Try out for Floorball EXCO.] You try to run for the Captain for Floorball. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change.
            ~ leadership_roles ++
             -> PP_W10_start
            * [Try out for Frisbee EXCO.] You try to run for the Captain for Frisbee. The very same week, you have a small speech on how you envision the club to look like, and the things you want to change.
            ~ leadership_roles ++
             -> PP_W10_start
            * [Choose not to.] -> PP_W10_start
            }
    = PP_W10_start
    The days flash by quickly and you operate by weeks now. Another wave of "practical exam", written assignments and essays come your way. 
    
    You stay afloat. 
    
    * [Submit essay for ULR module] You submit your essay that you have made countless revisions to. Alongside, your written assignments for discrete math and linear algebra. 
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
    
        You continue working through the other exams and winter begins shortly. 
    - 2:
    The examination goes reasonably well. With lesser sleep, you start to feel lethargic towards the end. Thankfully however, the last question came out in the past year paper that you attempted the night before.
    
    You continue working through the other exams and soon winter begins shortly. 
    }

    { leadership_roles> 0:
    However, before summer starts, you are informed that you were voted in as the captain for {CCA_name}. You are surprised but also nervous. Next semester will definitely be busy and you have to stay on the ball.  
    - else: 
    Winter comes round the corner. 
    }
    * [Start Winter.] -> PP_Start_Winter
    
    = PP_Start_Winter
    You move out of campus residence back home. 
    
    Here is how your Winter plans currently look like: 
    - Go overseas with your family for a week in Vietnam
    
    You have a few options on how to fill the rest of your 3 weeks.
    * [Rest, you are exhausted.] You take a long rest, and let out the deepest sigh you have ever known. -> PP_post_S1_think
    * [Self-learn next semester's topics.] You try to do so, but you feel hopelessly burnt out. You cannot bring yourself to continue consistently. -> PP_post_S1_think
    
    = PP_post_S1_think
    You sit down and take a deep think. You remind yourself you took this major out of interest, but you were always interested in the application. How websites work, how traffic systems work and how Google finds the best routes to places. Not ternary operations, Relations, and Gaussian Elimination. 
    
    You mull over it a little longer, until you slowly come to terms with the present. "It is, what it is," you tell yourself. 
    -> PP_Sem2_Starts
    
== PP_Sem2_Starts
    School starts again! You move back into hall, albeit tiring, and complete the frustrating ModReg period easier than last semester.

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
    - 1 :
    You achieve some B+s and a B. You are satisfied with your performance!
        * [Move on.] You pick yourself up and dust yourself off. You also get yourself a little treat for your hard work.
        -> PP_S2_Commitments
    - else: 
    You achieve mostly Bs and a single B+. You have been overloaded with commitments and lagged behind in content. You are unsurprised, but also disappointed.
        * [Move on.] You pick yourself up and dust yourself off. You get yourself a little treat for your hard work.
        -> PP_S2_Commitments
    }
    
    
    = PP_S2_Commitments
    Things continue to be difficult. You discover your code does not compile for the practical exam, resulting in a straight zero. All you can say is, "It is what it is". 
    
    Planning for CCA also proves to be difficult, but thankfully you enjoy the sport and love the community that your seniors have helped to build. Furthermore, your vice-captain has also been very supportive and takes up the slack when needed. It is during this time you become painfully grateful for your support system of friends during such a difficult period. 
    
    It is also during this time where a familiar male friend starts to talk to you more often. You do not think much about it, and continue maintaining your flow of things.
    * [Start Reading Week]
    -> PP_S2_Reading_Week
    
    = PP_S2_Reading_Week
    "It is funny how time makes you forget how painful things were in the past," you think to yourself. Reading Week does not get any easier, as you do paper after paper. Slowly, you gain a little more confience each time. 
    
    You sit for the exams the week after. 
    *[Finish your last paper.]
    -> PP_S2_Post_Exams
    
    = PP_S2_Post_Exams
    You manage to achieve satisfactory grades this time, pulling the CAP to a 4.0. 
    *[Prepare for Summer.] -> SSH_Start_Summer
    
    == SSH_Start_Summer
    It is time to move out. 
    
    Before you know it, Year 1 comes to an end. You reflect on your successes and failures, and evaluate whether your goals have been met. 
    
    You decide on a few things on your last night in your little room you called home. 
    
    * [Apply for internship.] You decide to accept the internship you thoughtlessly applied for in Semester 1. With that, you drift off to sleep, ending your first academic year in NUS.-> END
    * [Pursue Orbital, a summer module where you code a project in pairs.] You decide you might as well clear 4MCs, and also try out coding something totally new. You think about a text-based adventure, where NUS students can choose their path. -> END
    * [Backpack and travel.] You decide you need a rest for the summer, and things as they come. With that, you plan potential destinations, and drift off to sleep, ending your first academic year in NUS. -> END
    
    
    
    
    
    
== Bess_money_path
-> END

// Questions asked:
// Why did you pick compsci
// What were some of the problems you faced in general regarding your course?
// What were some fulfilling bits?
// what were some of the problems you faced, specifically as a girl?
// are there any points you wish for us bring out in this story?
// we are aiming to have two broad paths- one more distinct on loneliness (we assumed that it would be slightly loneliner and harder to make friends?), and one more on poor life choices (eg. universal temptation of copying code to bring out the struggles of cs). 