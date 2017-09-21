class Task
  attr_accessor :nome, :done, :id
  def initialize(nome_tarefa, id)
    @nome = nome_tarefa
    @id = id
    @done = false
  end

  def print_tarefa
    puts "A tarefa #{@nome} de id #{@id} #{@done ? 'está finalizada' : 'não está finalizada'}\n"
  end

  def done?
    @done
  end
end
