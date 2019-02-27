DATA = {
  :user_keys =>
    ["username", "email", "password"],
  :users => [
    ["John Stoakes", "john@gmail.com", "password"],
    ["Max a Million", "max@gmail.com" "password"],
    ["Mallory Burke", "killin@gmail.com", "password"],
    ["Jimmy Neutron", "jimmy@gmail.com", "password"],
    ["Emily Pan", "Dave@gmail.com", "password"],
    ["James Span", "James@gmail.com", "password"],
    ["Hulk Jr. III", "April@gmail.com", "password"],
  ],
  :club_keys =>
   ["name", "members"],
  :clubs => [
    ["Maceys with Wine", 30],
    ["CatsNBeer", 5000],
    ["MalloryCelebration Wine Night", 500],
  ]
  # ,
  # :admins => [
  #   "Mary Elitch Long",
  #   "John Elitch"
  # ]
}

def main
  make_users
  make_clubs
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_clubs
  DATA[:clubs].each do |club|
    new_club = Club.new
    club.each_with_index do |attribute, i|
      new_club.send(DATA[:club_keys][i] + "=", attribute)
    end
    new_club.users.each {|c| c.save}
    new_club.save
  end
end

main
