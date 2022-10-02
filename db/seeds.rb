# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# initial active_admin records | must be commented after running rails db:seed with this record
# User.create!(name: "Initial user" ,email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

def rand_date_old
  Time.now - rand(30..45).day
end

def rand_date_recent
  Time.now - rand(15..20).day
end

def most_recent_date
  Time.now - rand(10..15).day
end

User.create([
  {email: "admin1@gmail.com", name: "Юрий", is_admin: true, password: "admin123", password_confirmation: "admin123", jti: SecureRandom.uuid},
  {email: "admin2@gmail.com", name: "Анастасия", is_admin: true, password: "admin123", password_confirmation: "admin123", jti: SecureRandom.uuid},
  {email: "admin3@gmail.com", name: "Валентин", is_admin: true, password: "admin123", password_confirmation: "admin123", jti: SecureRandom.uuid},
  {email: "user1@gmail.com", name: "Петр", is_admin: false, password: "admin123", password_confirmation: "admin123", jti: SecureRandom.uuid},
  {email: "user2@gmail.com", name: "Каролина", is_admin: false, password: "admin123", password_confirmation: "admin123", jti: SecureRandom.uuid},
  {email: "user3@gmail.com", name: "Влентина", is_admin: false, password: "admin123", password_confirmation: "admin123", jti: SecureRandom.uuid}
  ])

Criterium.create([
  {name: "Личные качества"},
  {name: "Коммуникабельность" },
  {name: "Образованность" },
  {name: "Знания специфики производства"},
  ])

Criterium.update_all(created_at: rand_date_old)

Position.create([
  {name: "Начальник отдела продаж"},
  {name: "Менеджер отдела продаж"},
  {name: "Первый заместитель директора"},
  {name: "Заместитель дирекора по сбыту"},
  {name:"Начальник погрузочного отдела"}
  ])

Position.update_all(created_at: rand_date_old-5.day)

PositionCriteriumScore.create([
  {position: Position.first , criterium: Criterium.first, score: 3},
  {position: Position.first , criterium: Criterium.second, score: 2},
  {position: Position.first , criterium: Criterium.third, score: 5},
  {position: Position.first , criterium: Criterium.fourth, score: 3},

  {position: Position.second , criterium: Criterium.first, score: 4},
  {position: Position.second , criterium: Criterium.second, score: 5},
  {position: Position.second , criterium: Criterium.third, score: 3},
  {position: Position.second , criterium: Criterium.fourth, score: 3},

  {position: Position.third , criterium: Criterium.first, score: 5},
  {position: Position.third , criterium: Criterium.second, score: 4},
  {position: Position.third , criterium: Criterium.third, score: 5},
  {position: Position.third , criterium: Criterium.fourth, score: 5},

  {position: Position.fourth , criterium: Criterium.first, score: 4},
  {position: Position.fourth , criterium: Criterium.second, score: 4},
  {position: Position.fourth , criterium: Criterium.third, score: 5},
  {position: Position.fourth , criterium: Criterium.fourth, score: 5},

  {position: Position.fifth , criterium: Criterium.first, score: 4},
  {position: Position.fifth , criterium: Criterium.second, score: 4},
  {position: Position.fifth , criterium: Criterium.third, score: 3},
  {position: Position.fifth , criterium: Criterium.fourth, score: 4},
  ])

PositionCriteriumScore.update_all(created_at: rand_date_recent)

Vacancy.create([
  {position: Position.first, opening_date: Date.today},
  {position: Position.second, opening_date: Date.today},
  {position: Position.third, opening_date: Date.today},
  {position: Position.fourth, opening_date: Date.today},
  {position: Position.fifth, opening_date: Date.today},
  ])

Vacancy.update_all(created_at: rand_date_recent)

# candidates
  bigraphys = [
    "Имеет высшее образование по юридическому направлению. Закончил N-университет в 2016 году. Нехолост, 2 детей. На собеседовании проявил себя как заинтересованный в работе человек, умный и мыслящий. Имеет опыт работы в смежных сферах. Из хобби стоит упомянуть покер, книги и индивидуальные виды спорта.",
    "Обладает высшим образованием по экономическому направлению и среднее образование по инжерному направлению. Холост, детей нет. На собеседовании проявил себя как ответственный человек, однако немного завышает свои требования по оплате. Хобби - гитара, вокал, путешествия.",
    "Сдержан в проявляении любых эмоций. Закончил 2 университета, 2 высших образования по экономическому и техническому направлениям. Очень заинтересован в получении опыта работы именно на нашем предприятии. Нехолост, 1 ребёнок. Очень требователен к з\п. Мотивирован, занимаеся спортом, в основном командные виды спорта."
  ]

  Candidate.create([
    {first_name: "Иван", second_name: "Петров", email: "ivanpetrov@gmail.com", number: "+375295445659", user: User.limit(6)[rand(0..5)],
    expirience_years: 1.2, biography: bigraphys[rand(1..3)], vacancy: Vacancy.first, status: 0, gender: true},
    {first_name: "Пётр", second_name: "Молицкий", email: "petr_mol@gmail.com", number: "+375295441212",user: User.limit(6)[rand(0..5)],
    expirience_years: 1.6, biography: bigraphys[rand(1..3)], vacancy: Vacancy.first, status: 1, gender: true},
    {first_name: "Алина", second_name: "Милая", email: "alinka@gmail.com", number: "+375295477865",user: User.limit(6)[rand(0..5)],
    expirience_years: 1.9, biography: bigraphys[rand(1..3)], vacancy: Vacancy.first, status: 1, gender: false},

    {first_name: "Евгений", second_name: "Момицкий", email: "jenya_momo@gmail.com", number: "+375335441213",user: User.limit(6)[rand(0..5)],
    expirience_years: 2, biography: bigraphys[rand(1..3)], vacancy: Vacancy.second, status: 1, gender: true},
    {first_name: "Виктор", second_name: "Новенький", email: "victor_nova@gmail.com", number: "+375332699536",user: User.limit(6)[rand(0..5)],
    expirience_years: 1.2, biography: bigraphys[rand(1..3)], vacancy: Vacancy.second, status: 0, gender: true},

    {first_name: "Юлия", second_name: "Селивонец", email: "julia_bomba@gmail.com", number: "+375335441288",user: User.limit(6)[rand(0..5)],
    expirience_years: 4, biography: bigraphys[rand(1..3)], vacancy: Vacancy.third, status: 1, gender: false},

    {first_name: "Герман", second_name: "Школяр", email: "german_kola@gmail.com", number: "+375335568688",user: User.limit(6)[rand(0..5)],
    expirience_years: 4, biography: bigraphys[rand(1..3)], vacancy: Vacancy.fifth, status: 0, gender: true},
    {first_name: "Сергей", second_name: "Момыкин", email: "sergei_momkin@gmail.com", number: "+375295441289",user: User.limit(6)[rand(0..5)],
    expirience_years: 2, biography: bigraphys[rand(1..3)], vacancy: Vacancy.fifth, status: 1, gender: true},
    {first_name: "Валентина", second_name: "Селивонец", email: "valiantsina_mola@gmail.com", number: "+375275441233",user: User.limit(6)[rand(0..5)],
    expirience_years: 2.3, biography: bigraphys[rand(1..3)], vacancy: Vacancy.fifth, status: 0, gender: false},
    {first_name: "Елена", second_name: "Пырко", email: "elena_pirko@gmail.com", number: "+375335121387",user: User.limit(6)[rand(0..5)],
    expirience_years: 5.1, biography: bigraphys[rand(1..3)], vacancy: Vacancy.fifth, status: 1, gender: false}
    ])

Candidate.update_all(created_at: most_recent_date)

# candidates scores
    generate_score = lambda { 2 + rand(1..3) }
    candidates = Candidate.all
    criteria = Criterium.all

    Candidate.count.times do |idx|
      Criterium.count.times do |c_idx|
        CandidateCriteriumScore.create!({candidate: candidates[idx] , criterium: criteria[c_idx], score: generate_score.() })
      end
    end

# jokes

Joke.create!([
  {body: "- Планирую через месяц скинуть 30 кг.
          - Ого! А как?
          - Отдам сына в школу!"},
  {body: "Армянский атлет занял на Олимпиаде в Токио миллион иен."},
  {body: "Все, что нас не убивает... то мутирует и снова попытается нас убить."},
  {body: "Как вообще понять, что волынщик играет хорошо?"},
  {body: "Боксеры лучше других знают, что в жизни больше всех достается людям, которые опускают руки."},
  {body: "Основополагающая суть туризма - взять с собой побольше,
          уйти подальше и там всё это быстро сожрать!"},
  {body: "Никогда и не у кого ни проси орфографический словарь. Сами предложут и сами все додут."},
  {body: "Оказывается, первым таблица Менделеева приснилась Гоголю, но он в ней ни хрена не понял и сжег..."},
  {body: "Мир изменился: заказанная пицца приезжает быстрее вызванной скорой помощи."},
  {body: "Глобальное потепление заключается в том, что все тепленькие места уже заняты."},
  {body: "Летом все люди делятся на две категории - те, кто любит море и те, кто ненавидит тех, кто любит море."},
  ])
