puts 'Bem-vindo ao Task List'
opcao = 0
tarefas = []

while opcao != 4 do
  if opcao == 1
    puts "\nInforme o nome da tarefa"
    nome_tarefa = gets.chomp
    tarefas << {nome: nome_tarefa, finalizada: false, id: tarefas.length}
    puts 'Nova tarefa cadastrada: ' + nome_tarefa
  elsif opcao == 2
    puts "\nSuas tarefas sao:"
    tarefas.each {|tarefa| puts "A tarefa: #{tarefa[:nome]} de id #{tarefa[:id]} #{tarefa[:finalizada] ? "está finalizada" : "não está finalizada"}", puts}
  elsif opcao == 3
    puts "\nInforme o id da tarefa a marcar como finalizada"
    tarefas[tarefas.index {|tarefa| tarefa[:id] == gets.to_i}][:finalizada] = true
  end

  puts
  puts 'Escolha uma opção:'
  puts '#1 - Inserir uma tarefa'
  puts '#2 - Mostrar todas as tarefas'
  puts '#3 - Marcar tarefa como finalizada'
  puts '#4 - Sair'

  opcao = gets.to_i
end
