namespace :invitation do
  desc "Generates invitations"
  task create_all: :environment do
    celebration = Celebration.find_or_create_by(name: 'Korea Wedding')

    Event.find_or_create_by(
      name: 'Wedding Cermony',
      date: DateTime.new(2025, 07, 05, 11, 30, 0),
      location: 'Smith Hanok',
      celebration: celebration
    )

    Event.find_or_create_by(
      name: 'Baseball Game',
      date: DateTime.new(2025, 07, 03, 18, 30, 0),
      location: 'Jamsil Stadium',
      celebration: celebration
    )

    full_list = {
      'Madigans' => [
        {
          first_name: 'Casey',
          last_name: 'Madigan'
        },
        {
          first_name: 'Edward',
          last_name: 'Madigan',
        }
      ],
      'Boughers' => [
        {
          first_name: 'Tricia',
          last_name: 'Bougher'
        },
        {
          first_name: 'Tom',
          last_name: 'Bougher',
        },
        {
          first_name: 'Lainey',
          last_name: 'Bougher',
        },
        {
          first_name: 'Kara',
          last_name: 'Bougher',
        }
      ],
      'Pete' => [
        {
          first_name: 'Peter',
          last_name: 'Edwards'
        }
      ],
    }

    full_list.each do |group_name, attendees|
      group = Group.find_or_create_by(name: group_name)
      attendees.each do |attendee|
        person = Person.find_or_create_by(attendee.merge(group: group))
        celebration.events.each do |event|
          Invitation.find_or_create_by(event: event, person: person)
        end
      end
    end
  end

end



# [wedding, baseball].each do |event|
#   party = Party.create(event: event, group: group_name)
#   people.each do |person|
#     Invitation.create(party: party, person: person)
#   end
# end
