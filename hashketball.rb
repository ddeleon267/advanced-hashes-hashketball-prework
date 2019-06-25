require "pry"

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name, stats|
        return player[name][:points] if name == player_name
      end
    end
  end
end

## old code - from when players pointed to a hash
# def num_points_scored(player_name)
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |current_player, player_data|
#       binding.pry
#       return player_data[:points] if player_name == current_player
#     end
#   end
# end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name, stats|
        return player[name][:shoe] if name == player_name
      end
    end
  end
end

## old code - from when players pointed to a hash
# def shoe_size(player_name)
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |current_player, player_data|
#       return player_data[:shoe] if player_name == current_player
#     end
#   end
# end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    return team_data[:colors] if team_data[:team_name] == team_name
  end
end

def team_names
  game_hash.collect { |location, team_data| team_data[:team_name] }
end


# old code - when players pointed to a hash:
# def player_numbers(team_name)
#   game_hash.collect do |location, team_data|
#     if team_data[:team_name] == team_name
#       team_data[:players].collect do |player_name, player_data|
#         player_data[:number]
#       end
#     end
#   end.flatten.compact
# end

def player_numbers(team_name)
  game_hash.collect do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].collect do |player|
        player.collect do |name, data|
          player[name][:number]
        end
      end
    end
  end.flatten.compact
end

# or, could do this way
# def player_numbers(team_name)
#   player_nums = []
#   game_hash.each do |location, team_data|
#     if team_data[:team_name] == team_name
#       team_data[:players].each do |player|
#         player.each do |name, data|
#           player_nums << player[name][:number]
#         end
#       end
#     end
#   end
#   player_nums
# end

# old one - when player pointed to hash
# def player_stats(player_name)
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |current_player, player_data|
#       return player_data if player_name == current_player
#     end
#   end
# end
def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |player, data|
        return data if player == player_name
      end
    end
  end
end

# old one - when players pointed to hash
# def big_shoe_rebounds
#   shoe_size = 0
#   rebounds = 0
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |current_player, player_data|
#       current_shoe = player_data[:shoe]
#       if current_shoe > shoe_size
#         shoe_size = current_shoe
#         rebounds = player_data[:rebounds]
#       end
#     end
#   end
#   rebounds
# end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name, data|
        current_shoe = player[name][:shoe]
        if current_shoe > shoe_size
          shoe_size = current_shoe
          rebounds = player[name][:rebounds]
        end
      end
    end
  end
  rebounds
end

# old one - when players pointed to hash
# def most_points_scored
#   points_scored = 0
#   player = "banana"
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |current_player, player_data|
#       current_points = player_data[:points]
#       if current_points > points_scored
#         points_scored = current_points
#         player = current_player
#       end
#     end
#   end
#   player
# end

def most_points_scored
  points_scored = 0
  player_match = "banana"
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name, data|
        current_points = player[name][:points]
        if current_points > points_scored
          points_scored = current_points
          player_match = name
        end
      end
    end
  end
  player_match
end

# old one - when players pointed to hash
# def winning_team
#   my_hash = Hash.new(0)
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |current_player, player_data|
#       my_hash[team_data[:team_name]] += player_data[:points]
#     end
#   end
#   my_hash.key(my_hash.values.max)
# end

def winning_team
  my_hash = Hash.new(0)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name, data|
        my_hash[team_data[:team_name]] += player[name][:points]
      end
    end
  end
  my_hash.key(my_hash.values.max)
end

# old one - when players pointed to a hash
# def player_with_longest_name
#   player = "banana"
#   length = 0
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |current_player, player_data|
#       current_length = current_player.length
#       if current_length > length
#         length = current_length
#         player = current_player
#       end
#     end
#   end
#   player
# end
def player_with_longest_name
  long_name = "banana"
  length = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name, data|
        current_length = name.length
        if current_length > length
          length = current_length
          long_name = name
        end
      end
    end
  end
  long_name
end

# old one - when players pointed to a hash
# def long_name_steals_a_ton?
#   stealz = 0
#   player = "banana"
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |current_player, player_data|
#       if player_data[:steals] > stealz
#         stealz = player_data[:steals]
#         player = current_player
#       end
#     end
#   end
#   player == player_with_longest_name
# end

def long_name_steals_a_ton?
  stealz = 0
  player_with_most_steals = "banana"
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name, data|
        if player[name][:steals] > stealz
          stealz = player[name][:steals]
          player_with_most_steals = name
        end
      end
    end
  end
  player_with_most_steals == player_with_longest_name
end

# le hash - I just copy/pasted from the last time I did this lab; I am not building this hash again lol
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },

    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Kemba Walker" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end
