class Task
  attr_accessor :nome
  attr_writer :done
  attr_reader :id
  def initialize(nome_tarefa, id, done = false)
    @nome = nome_tarefa
    @id = id
    @done = done
  end

  def to_s
    "A tarefa #{@nome} de id #{@id} #{done? ? 'está finalizada' : 'não está finalizada'}\n"
  end

  def done?
    @done
  end

  def include?(nome_busca)
    @nome.downcase.include? nome_busca.downcase
  end
end
