class EmergencialTask < Task
  attr_accessor :responsible

  def initialize(nome_tarefa, id, responsavel, done = false)
    super(nome_tarefa, id, done)
    @responsible = responsavel
  end

  def to_s
    "TAREFA EMERGENCIAL!! #{super}; Responsavel: #{@responsible}"
  end
end
