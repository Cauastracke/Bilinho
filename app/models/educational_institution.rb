class EducationalInstitution < ApplicationRecord
    TYPES = ["university","school","daycare"].freeze
    validates :name, presence: true, uniqueness: true
    validates :cnpj, presence: true, uniqueness: true, cnpj: true
    normalizes :tipo, with: -> tipo {tipo.strip.downcase}
    validates :tipo, presence: true, inclusion: {in: TYPES}
end
