class StaticPagesController < ApplicationController
  def evaluation
    grading_scale = [
      {
        grade: '0-3',
        title: 'Poor team-mate',
        description: ['Did not contribute to the final product', 'Put forth little or insufficient effort',
                      'Was rarely present at team meetings and was difficult to get a hold of',
                      'You would **avoid partnering** with this person in a future course']
      }, {
        grade: '3-4',
        title: 'Fair team-mate',
        description: ['Worked hard at contributing to the project', 'Struggled to carry out assigned responsibilities',
                      'Made minor contributions to the final product', 'You would **prefer not to partner** with this person in a future course']
      }, {
        grade: '5-6',
        title: 'Good team-mate',
        description: ['Carried out their assigned responsibilities', 'Contributed to the final product',
                      'Room for improvement in communication, initiative, effort, or skills',
                      "You would be **willing to partner** with them in a future course, though you wouldn't seek them out"]
      }, {
        grade: '7-8',
        title: 'Very good team-mate',
        description: ['Contributed significantly', 'Communicated effectively',
                      'Took initiative in the design and implementation',
                      'You would **seek out** this person to be a team-mate in a future course']
      }, {
        grade: '9-10',
        title: 'Amazing team-mate',
        description: ['You will be in contact with them for years',
                      'One of the **best** team-mates you have ever had for any project']
      }
    ]

    # TODO: change Student.find(1) to the current student that logged in
    team = Student.find(1).team
    teammates = team.students

    respond_to do |format|
      format.html { render :evaluation, locals: { grading_scale: grading_scale, team: team, teammates: teammates } }
    end
  end
end
