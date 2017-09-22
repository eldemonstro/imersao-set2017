class Task
  attr_accessor :nome
  attr_writer :done

  def initialize(nome_tarefa, done = false)
    @nome = nome_tarefa
    @done = done
  end

  def to_s
    "A tarefa #{@nome} #{done? ? 'está finalizada' : 'não está finalizada'}\n"
  end

  def done?
    @done
  end

  def include?(nome_busca)
    @nome.downcase.include? nome_busca.downcase
  end
end
