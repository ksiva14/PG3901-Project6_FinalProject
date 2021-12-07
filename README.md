# README

## Model
![image](https://user-images.githubusercontent.com/54641137/144972870-57352e3e-8d51-450b-b3f5-c5eea27fb5cb.png)
In our model, we start with a user, who has many students and professors, depending on who logs in. In this class, the name, email, and password entered are validated. Students are users, on a team, and in a course. A professor(our admin) is a user and in a course. Courses have many students, professors, teams, and projects. Teams belong in a class and have many evaluations, projects, and students. Projects belong in a course, and has many teams that are doing that project. Evaluations belong to teams, assigned by admins. 

## Running program and tests
There are two ways to run our project, running rails server and connecting locally, or using or heroku deployment by running heroku open -a project6-3901.
Rake test will run our test suite.
If there are issues with installing 'pg' gem during bundle install, running this command fixed that issue.

sudo apt-get install postgresql-client libpq5 libpq-dev

This arose after switching from sqlite to postgres.
bandi.11@osu.edu and jenkins.1085@osu.edu are added as collaborators on our heroku app.

## Walkthrough of Features
* Project is deployed on [heroku](https://project6-3901.herokuapp.com/) (Database has been seeded. Refer to `Additional Information` for more details)
* Alternatively, run `rails server` and type `localhost:3000` on a browser
* Tested for accessibility with [WAVE](https://wave.webaim.org/)
#### Login & Signup
* Users can signup as a student or a professor with the links in the login page
  * Users would be asked for a name, email in standard osu format (name.#@osu.edu), and a password that is 6 characters long. 
  * Professor would only be able to add a student after then have signed up
  * A link back to log in screen if users decides not to sign up
#### Professor
* Logging in as a professor will greet you with the professor dashboard
  * Professors can add, edit, and delete courses.
  * On the dashboard, there is also a link to projects for the course
* On the projects page, one can add, edit and delete projects
  * All evaluations for the projects are shown here (evaluations would be display when a team is added to a project and there is at least 2 people on the team)
  * Professor would be able to add/remove a team from the project
    * If no team is added to the project, `Add/Remove Team` would redirect the professor to create a team
  * Team that are added to the project would also be shown
  * Professor would be able to edit average scores of students after all students have filled up their evaluations for each other
  * If a student has a score of under 5, the row of that evaluation would be highlighted in red
* On the course page
  * Professor can create, view, edit and delete a team
    * `View Team` allows professor to see all students that are in the team
    * Professor would also be able to add/remove students to/from the team directly
    * Removing a student on the team page removes the student from the team but not the course
  * Professor can add, remove, and view which team a student is on
    * Professor can search by a student's full email or full name
    * A student needs to be added to a team in order to be added to the course 
    * A list of all teams the student is on would also be shown
    * Removing a student on the course page deletes the student from the course
#### Student
* Logging in as a student will greet you with the student dashboard

Here you can see what evaluations are assigned, and what team and class they are from. Clicking on the action for that evaluation will take you to the evaluation page where the student can select each other student on their team and evaluate them.



// TODO: add and check over this walkthrough once all changes are final
// TODO: add a student and professor for grader to use.

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


## Future Features
If we had more time, we would like to add more features
* A way for students in the class to evaluate us as we present would be a nice touch.
* A way for students to customize themselves, adding profile pictures and ways to contact them so group members can find them easier. 
* With a lot more time, a tool similar to catme to create balanced groups based on availability and personal preferences.
* Looking very far down the road, after a class is done using a team, a way to rate that team overall, and have the tool learn how you work with the team it gave you, so it can better assign you teams in next projects and classes.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
