# README

## Model
In our model, we start with auser, who has many students and professors, depending on who logs in. In this class, the name, email, and password entered are validated. Students are users, on a team, and in a course. A professor(our admin) is a user and in a course. Courses have many students, professors, teams, and projects. Teams belong in a class and have many evaluations, projects, and students. Projects belong in a course, and has many teams that are doing that project. Evaluations belong to teams, assigned by admins. 

## Walkthrough of Features
After running rails server and typing localhost:3000 into a browser, you are greeted with a log in page. student.1@osu.edu and professor.1@osu.edu with password  ***add password here*** are given to navigate our website. You can also create a new student or professor with the links under the log in section, and you will be asked for a name, email in standard osu format (name.#@osu.edu), and a password that is 6 characters long. There is link back to log in screen if you don't want to create a user. 

Logging in as a professor will greet you with the courses page, where a professor can add, edit, and delete courses. There is also a link to projects, where you can add, delete, and show what evaluations for that project are active. If you press enter course on the courses page, the professor can then create teams, and add students by searching for them on the add students link. 

Logging in as a student will take you to the sutdent dashboard. Here you can see what evaluations are assigned, and what team and class they are from. Clicking on the action for that evaluation will take you to the evaluation page where the student can select each other student on their team and evaluate them.

// TODO: add and check over this walkthrough once all changes are final
// TODO: add a student and professor for grader to use.

## Ruby Version
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
