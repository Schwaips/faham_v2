# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



puts "Destroying DB..."


User.destroy_all
TrustedCustomer.destroy_all
Testimony.destroy_all

puts "Done!"

puts "Seeding the database..."


puts "creating trusted customers"
# puts "--creating trusted customer"
trust1 = TrustedCustomer.create!(title: "AFDI")
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/logo-afdi-1.jpg')
trust1.photo.attach(io: file, filename: 'afdi.png', content_type: 'image/png')

trust2 = TrustedCustomer.create!(title: "UCO")
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558149/faham/confiance/Logo_uco.png')
trust2.photo.attach(io: file, filename: 'UCO.png', content_type: 'image/png')

trust3 = TrustedCustomer.create!(title: "Université de la Réunion")
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558149/faham/confiance/logo-Univ_Reunion.png')
trust3.photo.attach(io: file, filename: 'univ-reunion.png', content_type: 'image/png')

trust4 = TrustedCustomer.create!(title: "IRTS")
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/Logo-IRTS_lareunion.png')
trust4.photo.attach(io: file, filename: 'irts.png', content_type: 'image/png')

trust5 = TrustedCustomer.create!(title: "Region Reunion")
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/logo-region-reunion.png')
trust5.photo.attach(io: file, filename: 'Region-Reunion.png', content_type: 'image/png')

trust6 = TrustedCustomer.create!(title: "Atelier")
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/logo-latelier-blanc.jpg')
trust6.photo.attach(io: file, filename: 'atelier.png', content_type: 'image/png')

trust7 = TrustedCustomer.create!(title: "UCO Reunion")
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/logo_UCO_Reunion.png')
trust7.photo.attach(io: file, filename: 'uco-reunion.png', content_type: 'image/png')

trust8 = TrustedCustomer.create!(title: "Espace dev", display: true)
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/Logo-Espace-Dev.png')
trust8.photo.attach(io: file, filename: 'espace-dev.png', content_type: 'image/png')

trust11 = TrustedCustomer.create!(title: "IRISSE", display: false)
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/csm_logo_irisse.png')
trust11.photo.attach(io: file, filename: 'irisse.png', content_type: 'image/png')

trust9 = TrustedCustomer.create!(title: "ATD Quart du monde", display: false)
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/Logo-ATD-QuartMonde.png')
trust9.photo.attach(io: file, filename: 'atd-quart-du-monde.png', content_type: 'image/png')

trust10 = TrustedCustomer.create!(title: "URD", display: false)
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/Logo_IRD.png')
trust10.photo.attach(io: file, filename: 'URD.png', content_type: 'image/png')

trust12 = TrustedCustomer.create!(title: "IRESA", display: false)
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/IRESA.jpg')
trust12.photo.attach(io: file, filename: 'iresa.jpg', content_type: 'image/jpg')

trust13 = TrustedCustomer.create!(title: "Centre hospitalier universitaire de la Réunion", display: false)
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/Centre_hospitalier_universitaire_de_La_Re%CC%81union.png')
trust13.photo.attach(io: file, filename: 'chu-reunion.png', content_type: 'image/png')

trust14 = TrustedCustomer.create!(title: "CIRAD", display: false)
file = URI.open('https://res.cloudinary.com/cb-dev/image/upload/v1629558148/faham/confiance/Cirad_b88jpk.png')
trust14.photo.attach(io: file, filename: 'cirad.png', content_type: 'image/png')

puts "Done!"

puts "Creating users"
  unless Rails.env.production? 
    User.create!(
      email: "charlie@example.com",
      admin: true,
      password: "password",
      first_name: "Charlie",
      last_name: "Bertrand"
    )

    User.create!(
      email: "notadmin@example.com",
      password: "password",
      first_name: "Not",
      last_name: "Admin"
    )
  end
puts "done "

puts "creating fake temoignage"
puts "---"
Testimony.create(title:"Témoignage Mathieu Herald", author: "Mathieu Herald", description:"Merci a Estelle pour son accompagnement. Elle a su être a notre écoute et nous apporter des plans d'actions concrets pour améliorer la relation avec nos patients", company: "CHU de la Réunion")
puts "--temoignage created"
Testimony.create(title:"Testimony from Enigma", author: "Dr Corinne D.", description:"Un vrai bonheur de travailler avec Estelle. J'ai pu adapter mes méthodes de travails pour mieux répondre aux besoin des patients", company: "CHU de la Réunion")
puts "--temoignage created"
Testimony.create(title:"Testimony from Enigma", author: "Sabine B.", description:"Un travail de fond avec Estelle m'a permis de découvrir une méthode de travail efficace et axé sur la découverte des autres et de soi, merci!!", company: "AFDI")
puts "--temoignage created"
puts "ok"

puts "Databased seeded!"User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?