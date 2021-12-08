# README

## Model
![image](https://user-images.githubusercontent.com/54641137/144972870-57352e3e-8d51-450b-b3f5-c5eea27fb5cb.png)
In our model, we start with a user, who has many students and professors, depending on who logs in. In this class, the name, email, and password entered are validated. Students are users, on a team, and have many evaluations. A professor(our admin) is a user and in a course. Courses have many professors, teams, and projects. Teams belong in a class and have many evaluations, projects, project teams, and students. Projects belong in a course, and has many teams that are doing that project, as well as project teams. Project teams belong to projects and teams. Evaluations belong to teams, assigned by admins. 

## Running program and tests
* There are two ways to run our project, running rails server and connecting locally, or using or heroku deployment by running heroku open -a project6-3901. Alternatively, use the link below in the feature walkthrough
* Rake test will run our test suite.
If there are issues with installing 'pg' gem during bundle install, running this command fixed that issue.
* Main cannot be deployed to heroku but is able to run `rails server`
* Heroku is deployed on the `heroku` branch

sudo apt-get install postgresql-client libpq5 libpq-dev

This arose after switching from sqlite to postgres.
bandi.11@osu.edu and jenkins.1085@osu.edu are added as collaborators on our heroku app.

## Walkthrough of Features
* Project is deployed on [heroku](https://project6-3901.herokuapp.com/) (Database has been seeded. Refer to `Additional Information` for more details)
* Alternatively, run `rails server` and type `localhost:3000` on a browser
* Website is accessible and has been tested for accessibility with [WAVE](https://wave.webaim.org/)
* Website is responsive and can be viewed on different screen sizes, including mobile
#### Login & Signup
* Users can signup as a student or a professor with the links in the login page
  * Users would be asked for a name, email in standard osu format (name.#@osu.edu), and a password that is 6 characters long. 
  * Professor would only be able to add a student after then have signed up
  * A link back to log in screen if users decides not to sign up
  * Names can duplicate, but not emails
#### Professor
* Logging in as a professor will greet you with the professor dashboard
  * Professors can add, edit, and delete courses. On this page specifically, editing will just change the name
  * Deleting course will delete teams, evaluations, etc..
  * They can enter the course here
  * Also on the dashboard, there is a link to projects for each the course, which will take you to the project page
* On the projects page, one can add, edit and delete projects
  * All evaluations for the projects are shown here if you select `Show evaluations` (evaluations would be display when a team is added to a project and there is at least 2 people on the team)
  * Professor would be able to add/remove a team from the project by selecting `Add/Remove Team`, and can edit the team names in that drop down, and view that team as well
    * If no team is added to the project, `Add/Remove Team` would redirect the professor to create a team
  * Team that are added to the project would also be shown
  * Professor would be able to edit average scores of students after all students have filled up their evaluations for each other, if for example he noticed comments were showing that the students average score should be lower
  * If a student has a score of under 5, the row of that evaluation would be highlighted in red
* On the course page
  * Professor can create, view, edit and delete a team, as well as add students to teams
    * `View Team` allows professor to see all students that are in the team, and can remove students from those teams inside the `View Team` button
    * Professor would also be able to add/remove students to/from the team directly by searching their name or email
    * Removing a student on the team page removes the student from the team but not the course
  * Professor can add, remove, and view which team a student is on
    * Professor can search by a student's full email or full name
    * A student needs to be added to a team in order to be added to the course 
    * A list of all teams the student is on would also be shown
    * Removing a student on the course page deletes the student from the course
#### Student
* Logging in as a student will greet you with the student dashboard
    * Here you can see what evaluations are assigned, and what team and class they are from. Clicking on the action for that evaluation will take you to the evaluation page
* Evaluations dashboard
    * On this page, all students on the team for the project you selected will show up, and you can start the evaluation
    * After the student has filled all evaluations for their teammates, they will no longer see the `Start Evaluation`
    * Student will be able to view the score/comment by their teammates after everyone has finished the evaluations
* Evaluations
    * After a student selects start evaluation, they will be greeted with the grading scale, and below it, a slider from 1-10 that they can rate a teammate, and leave them a comment as well.
    * Students can only evaluate other students on their team, and have to evaluate each teammates individually.

## Required Features
* Users can submit score and comments for just their teammates. Multiple evaluations can be assigned over the semester.
* An administrative interface gives professors ways to add students to classes either using names or emails. This can be done in the courses or teams pages.
* The administrative interface also shows the scores of the evaluations for each team. The scores will turn red if they are below an average of 5, and can adjust the scores of the students if they see fit.

## Extensions
* Autentication/login. Only signed in students can fill out applications for their teammates only. Login is validated as mentioned prior.
* Students can belong to multiple groups simultaneously
* Professors can add or drop students from courses and teams.

## Additional Information
#### Seed Information 
* 10 Students (student.1@osu.edu through student.10@osu.edu)
  * the password for their account is their email address
* 2 Professors (professor.1@osu.edu through professor.20@osu.edu)
  * the password for their account is their email address
* 2 Courses (CSE 3901 & CSE 3902) for professor.1@osu.edu
* 1 Team for CSE 3901 with no students added to the team

#### To reset Postgesql Database on Heroku
* Step 1: `heroku restart`
* Step 2: `heroku pg:reset DATABASE` (no need to change the DATABASE)
* Step 3: `heroku run rake db:migrate`
* Step 4: `heroku run rake db:seed` (to seed the database)

#### Ruby Version
2.6.6

## Challenges Overcome
One big challenge we overcame was switching to postgres to deploy to heroku. Sqlite is no longer supported by heroku, so this switch was necessary. The change in syntax and the way migrations were handled took some time to get used to. We were also having issues on the student side of things with evaluations, mainly having projects have many teams and students have many teams, so we added project teams to make that easier. 

## Future Features
If we had more time, we would like to add more features
* With a little more time, we would add more styling to make things even prettier. 
* Also, end dates for the evaluations would be a nice addition.
* A way for students in the class to evaluate us as we present would be a nice touch.
* A way for students to customize themselves, adding profile pictures and ways to contact them so group members can find them easier. 
* Also, notifications for students and professors when evals are turned in. 
* With a lot more time, a tool similar to catme to create balanced groups based on availability and personal preferences.
* Looking very far down the road, after a class is done using a team, a way to rate that team overall, and have the tool learn how you work with the team it gave you, so it can better assign you teams in next projects and classes.

