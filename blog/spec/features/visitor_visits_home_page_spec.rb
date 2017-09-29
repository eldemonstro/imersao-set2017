require 'rails_helper'

feature 'Visitor visits home page' do
  scenario 'success' do
    #criar dados

    #executar uma ação
    visit root_path

    #expectativas
    expect(page).to have_content('Meu blog')
  end

  scenario 'and view all posts' do
    #criar dados
    post = Post.new(title: 'Primeira postagem',
                    content: 'Coisas...',
                    author: 'Fabricio')
    post.save
    #executar uma ação
    visit root_path
    #expectativas
    expect(page).to have_content post.title
    expect(page).to have_content post.author
    expect(page).to_not have_content post.content
  end
end
