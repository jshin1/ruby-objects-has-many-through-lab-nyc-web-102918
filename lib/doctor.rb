class Doctor

  attr_accessor :name, :appointments

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(patient, date)
    Appointment.new(patient, self, date)
  end

  def appointments
    Appointment.all.select do |instance|
      instance.doctor == self
    end
  end

  def patients
    patients = []
    Appointment.all.each do |instance|
      if instance.doctor == self
        patients << instance.patient
      end
    end
    patients
  end
end
