namespace :invitation do
  desc "Generates invitations"
  task create_all: :environment do
    wedding = Event.create(name: 'Korea Wedding', date: Date.new(2025, 07, 05))

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
      party = Party.create(event: wedding, group: group_name)
      people.each do |person|
        Invitation.create(party: party, person: person)
      end
    end
  end

end
