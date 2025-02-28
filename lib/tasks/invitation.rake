namespace :invitation do
  desc "Removes test invitations"
  task destroy_test: :environment do
    people = Person.where(first_name: 'Douglas', last_name: 'Berkley').or(Person.where(first_name: 'Hyelim', last_name: 'Kim'))
    people.each do |person|
      person.invitations.destroy_all
    end
  end

  desc "Generates test invitations"
  task create_test: :environment do
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
      'Us' => [
        {
          first_name: 'Douglas',
          last_name: 'Berkley'
        },
        {
          first_name: 'Hyelim',
          last_name: 'Kim',
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
      'Poltas' => [
        {
          first_name: 'John ',
          last_name: 'Polta'
        },
        {
          first_name: 'Sally',
          last_name: 'Polta',
        }
      ],
      'Berkleys' => [
        {
          first_name: 'Michael',
          last_name: 'Berkley'
        },
        {
          first_name: 'Joan',
          last_name: 'Berkley',
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
      'Nathan' => [
        {
          first_name: 'Nathan',
          last_name: 'Polta'
        },
        {
          first_name: 'Bryanna',
          last_name: 'Guy',
        }
      ],
      'Hayes' => [
        {
          first_name: 'Rory',
          last_name: "O'Reilly Hayes"
        },
        {
          first_name: 'Eva',
          last_name: 'Pfoertner'
        },
        {
          first_name: 'Lyra',
          last_name: "O'Reilly Hayes"
        }
      ],
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
      'Pete' => [
        {
          first_name: 'Peter',
          last_name: 'Edwards'
        }
      ],
      'Fox' => [
        {
          first_name: 'Sean',
          last_name: 'Fox'
        }
      ],
      'Smiths' => [
        {
          first_name: 'Amy',
          last_name: 'Smith'
        },
        {
          first_name: 'David',
          last_name: 'Smith'
        }
      ],
      'Beck' => [
        {
          first_name: 'Dave',
          last_name: 'Beck'
        }
      ],
      'Nate' => [
        {
          first_name: 'Nathan',
          last_name: 'Mistler'
        }
      ],
      'Browns' => [
        {
          first_name: 'Justin-Philmore',
          last_name: 'Brown'
        },
        {
          first_name: 'Sungji',
          last_name: 'Brown'
        }
      ],
      'Jeff' => [
        {
          first_name: 'Jeff',
          last_name: 'Spencer'
        }
      ],
      'Dylan' => [
        {
          first_name: 'Dylan',
          last_name: 'Coleman'
        }
      ],
      'Mej' => [
        {
          first_name: 'Michael',
          last_name: 'Johnston'
        }
      ],
      'Miguel' => [
        {
          first_name: 'Michael',
          last_name: 'Zinn'
        },
        {
          first_name: 'Isabel',
          last_name: 'Cayer'
        }
      ],
      'Dan' => [
        {
          first_name: 'Dan',
          last_name: 'Booth'
        }
      ],
      'Suzie' => [
        {
          first_name: 'Suzie',
          last_name: 'Moon'
        }
      ],
      'Eun Young' => [
        {
          first_name: '정은영',
          last_name: ''
        }
      ],
      'Angela' => [
        {
          first_name: 'Angela',
          last_name: 'Lee'
        },
        {
          first_name: 'Steven',
          last_name: 'Thomson'
        }
      ],
      'Momo' => [
        {
          first_name: 'Momo',
          last_name: ''
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
