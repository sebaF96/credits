# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# PRIMERO

Subject.create(code: "0001", name: "Tecnologia Ciencia y Sociedad", credits: 3, year: 1, passed: false, qualification: nil)
Subject.create(code: "0002", name: "Quimica General", credits: 4, year: 1, passed: false, qualification: nil)
Subject.create(code: "0003", name: "Calculo I", credits: 3, year: 1, passed: false, qualification: nil)
Subject.create(code: "0004", name: "Calculo II", credits: 3, year: 1, passed: false, qualification: nil)
Subject.create(code: "0005", name: "Sistemas de Representacion", credits: 3, year: 1, passed: false, qualification: nil)
Subject.create(code: "0006", name: "Fisica I", credits: 7, year: 1, passed: false, qualification: nil)
Subject.create(code: "0007", name: "Algebra y Geom. Analitica", credits: 5, year: 1, passed: false, qualification: nil)
Subject.create(code: "0008", name: "Ingles Tecnico", credits: 3, year: 1, passed: false, qualification: nil)
Subject.create(code: "0009", name: "Informatica", credits: 7, year: 1, passed: false, qualification: nil)

User.create(name: "Seba", email: "sebaf@mm.com")