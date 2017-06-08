mty_aquarium_map = {
  first_floor: {
    oceans_edge: {
      name: 'The ocean\'s edge',
      indoor_sections: [
        'Kelp Forest',
        'Sea Otters',
        'Touch Pools',
        'Aviary',
        'Octopus',
        'Gift Store'
        ],
      outdoor_sections: [
        'Great Tide Pool',
        'Wildlife Viewing Station'
        ],
      cafeteria: {
        seats: 20,
        cashiers: 3,
        food_stations: 3
      },
      bathrooms: 2,
      elevators: 2
    },
    special_exhibit: {
      name: 'The Open Sea (Special Exhibition)',
      indoor_sections: [
        'Tentacles',
        'Vanishing Wildlife',
        'Viva Baja!'
        ],
      outdoor_sections: [],
      bathrooms: 1,
      elevators: 1
    }
  },
  second_floor: {
    open_sea: {
      name: 'The Open Sea',
      indoor_sections: [
        'Jellies',
        'The Open Sea',
        'Seabirds',
        'Ocean Travelers'
        ],
      outdoor_sections: [
        'Viewing Area'
        ],
      bathrooms: 1,
      elevators: 1
    },
    splash_zone: {
      name: 'Splash Zone',
      indoor_sections: [
        'Penguins',
        'Touch Pools',
        'Play Area',
        'Splash Zone'
        ],
      outdoor_sections: [
        'Viewing Area'
        ],
      bathrooms: 2,
      elevators: 1
    }
  }
}

puts 'Return the full name of the first floor special exhibition'
p mty_aquarium_map[:first_floor][:special_exhibit][:name]

puts 'What are the sections on the first floor Ocean\'s Edge room?'
p mty_aquarium_map[:first_floor][:oceans_edge][:indoor_sections] + mty_aquarium_map[:first_floor][:oceans_edge][:outdoor_sections]

puts 'How many seats are in the cafeteria?'
p mty_aquarium_map[:first_floor][:oceans_edge][:cafeteria][:seats]

puts 'Mention two sections of the Splash Zone'
p mty_aquarium_map[:second_floor][:splash_zone][:indoor_sections][0..1]

puts 'Add a bathroom to The Open Sea exhibition'
p mty_aquarium_map[:second_floor][:open_sea][:bathrooms] = mty_aquarium_map[:second_floor][:open_sea][:bathrooms] + 1

puts 'Add a gift store to the Splash Zone sections'
p mty_aquarium_map[:second_floor][:splash_zone][:indoor_sections].push('Gift Store')
