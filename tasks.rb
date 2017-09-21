require './task'

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
    tarefas.each(&:print_tarefa)
  end
end

puts 'Bem-vindo ao Task List'
opcao = 0
tarefas = []

while opcao != SAIR
  if opcao == INSERIR_TAREFA
    puts "\nInforme o nome da tarefa"
    nome_tarefa = gets.chomp
    tarefas << Task.new(nome_tarefa, tarefas.length)
    puts 'Nova tarefa cadastrada: ' + nome_tarefa
  elsif opcao == MOSTRAR_TAREFA
    puts "\nSuas tarefas sao:"
    print_tarefas tarefas
  elsif opcao == BUSCAR_TAREFA
    puts "\nBuscando tarefas\nDigite o nome da tarefa a buscar"
    texto_busca = gets.chomp.downcase
    tarefas_encontradas = tarefas.select { |tarefa| tarefa.nome.downcase.include? texto_busca.downcase }
    print_tarefas(tarefas_encontradas)
  elsif opcao == FINALIZAR_TAREFA
    puts "\nInforme o id da tarefa a marcar como finalizada"
    tarefas[tarefas.index { |tarefa| tarefa.id == gets.to_i }].done = true
  end
  opcao = menu
end
