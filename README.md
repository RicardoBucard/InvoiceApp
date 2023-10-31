# Invoice App
[Descrição da API Rest](http://localhost:3000/api-docs), gerada usando Swagger baseado na OpenAPI3 (disponível quando sobe o servidor rails).

### Pré-requisitos

Os requisitos para rodar esta API são:

- `ruby versão >=3.0.6`
- `rails versão >=7.0.8`
- `mailhog`

### Instalação

Para instalar o ruby, aconselho o uso de algum ambiente virtual `rbenv` ou `rvm`. [Este tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04) tem um passo a passo muito bom para instalar o `rbenv`, `bundler` (gerenciador de pacotes Ruby), as gemas e também o `rails`.

A instalação do `mailhog` pode ser feita seguindo [este tutorial](https://www.lullabot.com/articles/installing-mailhog-for-ubuntu).

### Como rodar o projeto

Caso seja a primeira vez usando a API:
1. Execute `bundle install` para instalar as dependências do projeto
2. Para subir o servidor, execute `rails s`
3. Abra um novo terminal e execute `mailhog`, para subir o servidor local de envio de emails local. Para ver os emails que são gerados, [acesse](http://localhost:8025).

Nas próximas vezes que for subir o servidor da API:
1. Execute `rails s`
2. Execute `mailhog`.
 
Para rodar testes:
1. Execute `rspec`

Para acessar documentação dos módulos, controllers e models:
1. Execute `yard server`
2. [Acesse](http://localhost:8808).

## Sobre o projeto

Lista de gems adicionadas a este projeto:
- bcrypt
- slim-rails
- simple_form
- i18n
- bootstrap
- sassc-rails
- prawn
- has_scope
- rswag
- kaminari
- rspec-rails
- factory_bot_rails
- faker
- shoulda-matchers

Com o intuito de ter agilidade no desenvolvimento das páginas, converti as *views* para o formato `.slim` usando `slim-rails`. Além disso, usei o `simple-form` para facilitar o desenvolvimento de formulários. Outra gema que eu já tenho familiaridade é o `has_scope`, que facilita a criação de filtros. Usei o `kaminari` para melhorar a performance da página de *invoices* para um grande número de instâncias da classe.

Na parte da aparência da interface de usuário, usei  o `bootstrap`, que necessista do `sassc-rails` para uso do `.sass` ao invés do `.css`. O `i18n` foi usado tanto para organização de mensagens e *labels* no *frontend*, além de possibilitar a tradução e internacionalização desses *labels*.

Para a autenticação, como o requisito era ser feito através de um *token* enviado por email para ser confirmado, não usei a opção mais conhecida, o `devise`. Pesquisando como fazer autenticação do zero, vi que o `bcrypt` poderia ser usada para criptografia e segurança ao esconder tokens enviados como parâmetros.

Outro requisito era o envio de emails com arquivos anexados e, para gerar estes arquivos, escolhi a gema `prawn` pela sua capacidade de criar pdfs estilizados de forma rápida. Esta gema percorre um grid que representa a página de um arquivo pdf e é necessário informar exatamente onde cada texto será inserido e como. Em uma versão futura desta API, faria melhorias visuais e de formatação para os arquivos gerados, mas seria necessário estudar mais a gema.

A gema `rswag` adiciona o Swagger ao Rails e foi usada para gerar uma apresentação visual para a documentação da API, mencionada no início do arquivo.

As últimas gemas são usadas para testes automatizados, sendo o `rspec-rails` a principal biblioteca para a execução de testes do Rails, o `faker` é usado para gerar dados, acelerando a programação de testes. Já o `factory_bot`, gera objetos usando esses atributos mencionados do `faker`, com parâmetros válidos e inválidos esperados. O `factory_bot` segue o *design pattern* *factory*, tirando a responsabilidade da criação do objeto dele mesmo. O `shoulda matchers` oferece diversos *matchers*, métodos para comparar os dados *mock* ("de mentira") com as validações dos modelos. Testes automatizados de *controllers* e *views* são pontos a serem melhorados em uma possível versão futura.

Seguindo padrões de software e também os requisitos do desafio, o código foi pensado em ser o mais modularizado possível, seguindo os princípios SOLID, como o princípio da responsabilidade única, ao tornar cada classe responsável por apenas uma ação, criação de interfaces (os `modules` do Rails) muito específicas para que apenas o que seja necessário para cada classe instancie módulos que vão usar, e o princípio da inversão de dependência, em que as classes são desacopladas e não sabem informações umas das outras.

Com a modularização feita neste código, a manutenção é facilitada, já que precisa alterar o arquivo apenas uma vez para também fazer efeito em outras partes do código que ele se encontra.

## Melhorias futuras
- Corrigir os erros possíveis usando o rubocop, melhorando a qualidade do código
- Utilização do docker, facilitando instalação do projeto e garantindo que ele funcione da mesma forma em todo ambiente. O Docker foi implementado, porém, ao testar em ambientes e sistema operacionais diferentes, tive resultados diferentes. Desta forma, seria melhor trabalhar mais na configuração do Docker e decidi não subir esta versão.
- Melhorar a cobertura de testes do sistema, com testes de integração também
- Melhorar o *template* do pdf da invoice gerada.

### Updates
- Refactor do modelo de usuário removendo método desnecessário
- Instalação da gema Yard, para documentação do aplicativo
- Documentação dos métodos do sistema