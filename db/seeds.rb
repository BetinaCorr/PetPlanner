# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


puts 'Cleaning database...'
User.destroy_all
Pet.destroy_all
Allergy.destroy_all
Disease.destroy_all
Food.destroy_all
Medication.destroy_all
Professional.destroy_all
Service.destroy_all
Vaccine.destroy_all

puts 'Creating users...'
anna_user = User.new(email: 'anna@gmail.com', password: '123123')
anna_user.save!

betina_user = User.new(email: 'betina@gmail.com', password: '123123')
betina_user.save!

puts 'Creating Smeagol...'
smeagol = Pet.new(name: 'Smeagol', species: 'dog', age: 8, user: anna_user)
smeagol.save!
puts 'Creating Tequila...'
tequila = Pet.new(name: 'Tequila', species: 'dog', age: 4, user: betina_user)
tequila.save!
puts 'Creating Mojito...'
mojito = Pet.new(name: 'Mojito', species: 'dog', age: 1, user: betina_user)
mojito.save!

puts 'Creating foods...'
puts 'Creating Smeagol Ração...'
purina = Food.new(name: 'Purina', category: 'ração', pet: smeagol)
purina.save!
puts 'Creating Smeagol Petisco...'
pedigree_petisco = Food.new(name: 'Pedigree Menta', category: 'petisco', pet: smeagol)
pedigree_petisco.save!

puts 'Creating Tequila Ração...'
royal_canin1 = Food.new(name: 'Royal Canin', category: 'ração', pet: tequila)
royal_canin1.save!
puts 'Creating Tequila Petisco...'
royal_petisco = Food.new(name: 'Royal Canin', category: 'petisco', pet: tequila)
royal_petisco.save!

puts 'Creating Mojito Ração...'
royal_canin2 = Food.new(name: 'Royal Canin', category: 'ração', pet: mojito)
royal_canin2.save!
puts 'Creating Mojito Petisco...'
royal_petisco2 = Food.new(name: 'Royal Canin', category: 'petisco', pet: mojito)
royal_petisco2.save!

puts 'Creating Professional...'
vet = Professional.new(name: 'Rafael', address: 'Rua dos Bobos, 0', phone_number: '999888666')
vet.save!

puts 'Creating Services for Smeagol, Tequila and Mojito...'
smeagol_service = Service.new(name_service: 'Consulta', starts_at: '2023-10-10 10:00:00', ends_at: '2023-10-10 11:00:00', price:'30', pet: smeagol, professional: vet)
smeagol_service.save!

tequila_service = Service.new(name_service: 'Consulta', starts_at: '2023-10-10 10:00:00', ends_at: '2023-10-10 11:00:00', price:'30', pet: tequila, professional: vet)
tequila_service.save!

mojito_service = Service.new(name_service: 'Consulta', starts_at: '2023-10-10 10:00:00', ends_at: '2023-10-10 11:00:00', price:'30', pet: mojito, professional: vet)
mojito_service.save!

puts 'Creating Vaccines for Smeagol, Tequila and Mojito...'
smeagol_raiva = Vaccine.new(name: 'Raiva', administration_date: '2021-10-10', pet: smeagol)
smeagol_raiva.save!

tequila_raiva = Vaccine.new(name: 'Raiva', administration_date: '2021-10-10', pet: tequila)
tequila_raiva.save!

mojito_raiva = Vaccine.new(name: 'Raiva', administration_date: '2021-10-10', pet: mojito)
mojito_raiva.save!

puts 'Creating Medications for Smeagol...'
smeagol_medication = Medication.new(name: 'Thealoz Duo', expiration_date: '2025-11-01', frequency: 3, purpose_medication: 'Lubrificar olhos', pet: smeagol)
smeagol_medication.save!

puts 'Creating Allergies for Smeagol...'
smeagol_allergy = Allergy.new(name: 'Rinite', pet: smeagol)
smeagol_allergy.save!

puts 'Creating Diseases for Smeagol...'
smeagol_disease = Disease.new(name: 'Conjuntivite Secativa', category: 'crônica', pet: smeagol)
smeagol_disease.save!

puts 'Finished!'
