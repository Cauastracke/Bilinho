class Student < ApplicationRecord
    GENDERS = ["m","f"]
    PAYMENT_METHODS = ["boleto","cartão"]
    validates :name, format: { with: /\A\D+\z/, message: "não deve conter números" }
    validates :name, uniqueness: true, presence: true
    validates :cpf, uniqueness: true, presence: true, cpf: true
    normalizes :gender, with: -> cpf {cpf.strip.downcase}
    validates :gender, inclusion: {in: GENDERS}
    normalizes :payment_method, with: -> payment_method {payment_method.strip.downcase}
    validates :payment_method, inclusion: {in: PAYMENT_METHODS}
    validates :phone, format: { with: /\A\d+\z/, message: "deve conter apenas números" }
end