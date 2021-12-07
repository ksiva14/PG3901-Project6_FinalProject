# README

## Model
In our model, we start with a user, who has many students and professors, depending on who logs in. In this class, the name, email, and password entered are validated. Students are users, on a team, and have many evaluations. A professor(our admin) is a user and in a course. Courses have many professors, teams, and projects. Teams belong in a class and have many evaluations, projects, project teams, and students. Projects belong in a course, and has many teams that are doing that project, as well as project teams. Project teams belong to projects and teams. Evaluations belong to teams, assigned by admins. 

## Running program and tests
There are two ways to run our project, running rails server and connecting locally, or using or heroku deployment by runnning heroku open -a project6-3901.
Rake test will run our test suite.
If there are issues with installing 'pg' gem during bundle install, running this command fixed that issue.

sudo apt-get install postgresql-client libpq5 libpq-dev

This arose after switching from sqlite to postgres.
bandi.11@osu.edu and jenkins.1085@osu.edu are added as collaborators on our heroku app.

## Walkthrough of Features
Opening our app greets you with a log in page. Here you can create a new student or professor with the links under the log in section, and you will be asked for a name, email in standard osu format (name.#@osu.edu), and a password that is 6 characters long. There is link back to log in screen if you don't want to create a user. 

Logging in as a professor will greet you with the courses page, where a professor can add, edit, and delete courses. There is also a link to projects, where you can add, delete, and show what evaluations for that project are active, and once they are filled out, the professor can seethe comments and scores from the students. Here you can assign these evaluations by adding a team to the project. If you press enter course on the courses page, the professor can then create teams, and add students by searching for them on the add students link, either by name or email.  

Logging in as a student will take you to the student dashboard. Here you can see what projects you have as a student to work on, what team and project that class is for, and the ability to start that evaluation. Clicking on that link will take you to a page where you can start your evaulations for your teammates. You can rate your teammate from 1-10, and leave them a comment. After submitting your evaluation, it will take you back to the evaluation page, and you can see the score and comment you left for them. 

## Ruby Version
2.6.6

## Challenges Overcome
One big challenge we overcame was switching to postgres to deploy to heroku. Sqlite is no longer supported by heroku, so this switch was necesary. The change in syntax and the way migrations were handled took some time to get used to. We were also having issues on the student side of things with evaluations, mainly having projects have many teams and students have many teams, so we added project teams to make that easier. 

## Future Features
If we had more time, we would like to add more features
* A way for students in the class to evaluate us as we present would be a nice touch.
* A way for students to customize themselves, adding profile pictures and ways to contact them so group members can find them easier. 
* With a lot more time, a tool similar to catme to create balanced groups based on availability and personal preferences.
* Looking very far down the road, after a class is done using a team, a way to rate that team overall, and have the tool learn how you work with the team it gave you, so it can better assign you teams in next projects and classes.


