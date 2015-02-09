# Background

Um novo cliente contratou o Sigvia e enviou em arquivos .csv os dados que devem ser importados. Para facilitar esse processo é preciso criar uma aplicação web em que o usuário faça o upload de um desses arquivos e forneça uma interface para filtragem dos dados importados.

## O que a aplicação tem que fazer:

1. O usuário faz upload de um arquivo .csv no formato fornecido através de um formulário.
2. Os dados contidos no arquivo são normalizados e salvos em um banco de dados relacional. 
3. O usuário recebe um feedback sobre a importação e é redirecionado para uma interface de lista com os dados que foram gravados.
4. O usuário pode buscar os dados importados por valores de: conservação, rodovia ou sentido.

### Observações:

- A aplicação deve ser feita em Rails ou Sinatra.
- Não é necessário autenticação.
- A qualidade do frontend não vai ser levada em consideração.
- A aplicação deve ter testes.

### Procedimento para entrega do teste:

1. Faça o fork desse projeto no github.
2. Codifique a aplicação nesse fork.
3. Abra um pull request quando estiver pronto.

### Instruções:

- O aplicativo foi desenvolvido com ruby 2.2.0
- O testes com rspec e capybara
- Apos entrar no diretorio do projeto executar os seguintes comandos:
  1. bundle install
  2. rake db:create:all
  3. rake db:migrate && rake db:migrate RAILS_ENV=test
- O teste aumotatizado deve ser realizado com o comando "bundle exec rspec"