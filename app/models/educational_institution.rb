class EducationalInstitution < ApplicationRecord
    TYPES = ["universidade","escola","creche"].freeze
    validates :name, presence: true, uniqueness: true
    validates :cnpj, presence: true, uniqueness: true, cnpj: true
    normalizes :tipo, with: -> tipo {tipo.strip.downcase}
    validates :tipo, presence: true, inclusion: {in: TYPES}
end
