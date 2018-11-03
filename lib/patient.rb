require 'pry'

class Patient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
    Appointment.new(self, doctor, date)
  end

  def appointments
    Appointment.all.select do |instance|
      instance.patient == self
    end
  end

  def doctors
    doctors = []
    Appointment.all.each do |instance|
      if instance.patient == self
        doctors << instance.doctor
      end
    end
    doctors
  end

end
