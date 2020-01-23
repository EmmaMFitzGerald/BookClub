# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

Book.destroy_all

Comment.destroy_all

user_1 = User.create!(username: "Emma", email: "emma@gmail.com", password:"123456")
user_2 = User.create!(username: "Erica",email: "erica@gmail.com", password:"123456")
user_3 = User.create!(username: "Zoe", email: "zoe@gmail.com", password:"123456")
user_4 = User.create!(username: "Kristin", email: "kristin@gmail.com", password:"123456")

book_1  = Book.create!(user_id: user_1.id, title: "Tightrope: Americans Reaching for Hope" , author: "Nicholas D. Kristof", genre: "Fiction", blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." )
book_2 = Book.create!(user_id: user_2.id, title: "A Long Petal of the Sea" , author: "Isabel Allende", genre: "Novel", blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
book_3 = Book.create!(user_id: user_1.id, title: "Dear Edward", author: "Ann Napolitano", genre: "Novel", blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
book_4 = Book.create!(user_id: user_4.id, title: "When You See Me" , author: "Lisa Gardner", genre: "Thriller", blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

comment_1  = Comment.create!(user_id: user_1.id , book_id: book_4.id, chapter: 1, content: "At the start of this gritty, character-driven standalone from bestseller Gardner (Never Tell), a hiker stumbles across a human femur in the mountains of Niche, Ga. As soon as the remains are identified as those of 17-year-old Lilah Abenito, kidnapped 15 years before and long suspected to have been one of the earliest victims of now-deceased serial predator Jacob Ness, a special task force forms in hope of solving other cold cases linked to him. ")
comment_2  = Comment.create!(user_id: user_2.id, book_id: book_2.id , chapter: 1, content: "In the late 1930s, civil war grips Spain. When General Franco and his Fascists succeed in overthrowing the government, hundreds of thousands are forced to flee in a treacherous journey over the mountains to the French border. Among them is Roser, a pregnant young widow, who finds her life intertwined with that of Victor Dalmau, an army doctor and the brother of her deceased love. In order to survive, the two must unite in a marriage neither of them desires.")
comment_3 = Comment.create!(user_id: user_3.id, book_id: book_1.id, chapter: 1, content: "With stark poignancy and political dispassion, Tightrope draws us deep into an other America. The authors tell this story, in part, through the lives of some of the children with whom Kristof grew up, in rural Yamhill, Oregon, an area that prospered for much of the twentieth century but has been devastated in the last few decades as blue-collar jobs disappeared. ")
comment_4 = Comment.create!(user_id: user_4.id, book_id: book_3.id, chapter: 1, content: "One summer morning, twelve-year-old Edward Adler, his beloved older brother, his parents, and 183 other passengers board a flight in Newark headed for Los Angeles. Among them are a Wall Street wunderkind, a young woman coming to terms with an unexpected pregnancy, an injured vet returning from Afghanistan, a business tycoon, and a free-spirited woman running away from her controlling husband. Halfway across the country, the plane crashes. Edward is the sole survivor." )