namespace :invitation do
  desc "Generates invitations"
  task create_all: :environment do
    wedding = Event.create(
      name: 'Korea Wedding',
      date: DateTime.new(2025, 07, 05, 11, 30, 0),
      location: 'Smith Hanok'
    )
    baseball = Event.create(
      name: 'Baseball Game',
      date: DateTime.new(2025, 07, 03, 18, 30, 0),
      location: 'Jamsil Stadium'
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
      people = Person.create(attendees)
      [wedding, baseball].each do |event|
        party = Party.create(event: event, group: group_name)
        people.each do |person|
          Invitation.create(party: party, person: person)
        end
      end
    end
  end

end
