require_relative 'task'
require 'date'

class EmergencialTask < Task
  attr_accessor :responsible
  attr_reader :due_date

  def initialize(nome_tarefa, responsavel, remaining_days = 3, done = false)
    super(nome_tarefa, done)
    @responsible = responsavel
    @due_date = Date.today + remaining_days
  end

  def to_s
    "TAREFA EMERGENCIAL!! #{super}Responsavel: #{@responsible}; Para ser entrege em #{@due_date.to_s}"
  end
end
