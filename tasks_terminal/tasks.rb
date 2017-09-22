require_relative 'task'
require_relative 'emergencial_task'

INSERIR_TAREFA = 1
MOSTRAR_TAREFA = 2
BUSCAR_TAREFA = 3
FINALIZAR_TAREFA = 4
SAIR = 5

def menu
  puts "\nEscolha uma opção:"
  puts "##{INSERIR_TAREFA} - Inserir uma tarefa"
  puts "##{MOSTRAR_TAREFA} - Mostrar todas as tarefas"
  puts "##{BUSCAR_TAREFA} - Busca uma tarefa"
  puts "##{FINALIZAR_TAREFA} - Marcar tarefa como finalizada"
  puts "##{SAIR} - Sair"
  gets.to_i
end

def print_tarefas(tarefas)
  if tarefas.empty?
    puts "N\xC3\xA3o h\xC3\xA1 tarefas"
  elsif
    tarefas.each_with_index { |t, index| puts "#{index}: #{t.to_s}" }
  end
end

def criar_tarefa
  puts "Informe o nome da tarefa"
  nome = gets.chomp
  puts "Ela est\xC3\xA1 finalizada? (1 - Sim | 2 - Nao)"
  finalizada = gets.to_i
  if finalizada == 1
    Task.new(nome, true)
  else
    puts "Ela é urgente? (1 - Sim | 2 - Nao)"
    urgente = gets.to_i
    if urgente == 1
      puts 'Quem é o responsavel?'
      responsavel = gets.chomp
      puts 'Em quantos dias ela deve ser encerrada?'
      dias_para_finalizar = gets.to_i
      EmergencialTask.new(nome, responsavel, dias_para_finalizar)
    else
      Task.new(nome)
    end
  end
end

puts 'Bem-vindo ao Task List'
opcao = 0
tarefas = []

while opcao != SAIR
  if opcao == INSERIR_TAREFA
    puts "\nInserindo uma nova tarefa"
    tarefas << criar_tarefa
  elsif opcao == MOSTRAR_TAREFA
    puts "\nSuas tarefas sao:"
    print_tarefas tarefas
  elsif opcao == BUSCAR_TAREFA
    puts "\nBuscando tarefas\nDigite o nome da tarefa a buscar"
    texto_busca = gets.chomp.downcase
    tarefas_encontradas = tarefas.select { |tarefa| tarefa.include? texto_busca }
    print_tarefas tarefas_encontradas
  elsif opcao == FINALIZAR_TAREFA
    puts "\nLista de tarefas"
    print_tarefas tarefas
    puts "\nInforme o id da tarefa a marcar como finalizada"
    id = gets.to_i
    tarefas[id].done = true
    puts tarefas[id].to_s
  end
  opcao = menu
end
