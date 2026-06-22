## Projeto Sistema de Manutenção de Veículos

Este projeto consiste na criação de um modelo físico de um banco de dados para um sistema de gerenciamento de oficina mecânica.
O projeto foi desenvolvido em Node.js com Express, criando uma API REST para cadastro e gerenciamento de clientes, veículos, ordens de serviço, colaboradores, peças e fornecedores, onde a aplicação faz conexão com o banco de dados através da biblioteca `mssql` com ODBC Driver 17 e realiza operações de adição, atualização e deleção dos dados, usando todos os conceitos e dinâmicas práticas de SQL desenvolvidas em aula.

### Integrantes
Nathan Rocha Gomes - [NathanRochaGomes](https://github.com/NathanRochaGomes)<br>
Jonas Fortunato Rosset - [JonasFortunatoRosset](https://github.com/JonasFortunatoRosset)<br>
Emanuel Reus - [EmanuelReus6](https://github.com/EmanuelReus6)<br>
Gabriel Vaz Lima - [gabriel-vazz](https://github.com/gabriel-vazz)<br>

### Modelo Físico
Utilizamos a ferramenta de modelagem de dados [dbdiagram.io](https://dbdiagram.io/) para criação do modelo físico do banco de dados, para posterior exportação dos scripts DDL das tabelas e relacionamentos.<br>

![Modelo Físico](modelo-fisico/modelo-fisico.png)

### Dicionário de Dados
As informações sobre as tabelas e índices foram documentadas na planilha [DDL_Sistema_Manutencao_Veiculos_v3.xlsx](dicionario-dados/DDL_Sistema_Manutencao_Veiculos_v3.xlsx).

### Scripts SQL
Para este projeto foi utilizado o banco de dados **Microsoft SQL Server**.<br>

Abaixo, seguem os scripts SQL separados por tipo:
+ [Tabelas](scripts/ddl/tabelas)
+ [Funções](scripts/ddl/functions)
+ [Gatilhos](scripts/ddl/triggers)
+ [Procedimentos armazenados](scripts/ddl/stored_procedures)
+ [DML](scripts/dml/perguntas-negocio)

### Código Fonte do CRUD
Ferramentas e tecnologias utilizadas no desenvolvimento do projeto:
- Linguagem de Programação JavaScript (Node.js)<br>
- Runtime Node.js com framework Express<br>
- Biblioteca `mssql/msnodesqlv8` para conexão com SQL Server via ODBC Driver 17<br>
- Autenticação Windows (`Trusted_Connection`) para acesso ao banco de dados<br>
- Frontend em HTML5, CSS3, Bootstrap 5.3.3 e AngularJS 1.8.3 (carregados via CDN)<br>

### Passos para execução do CRUD

#### Pré-requisitos
- [Node.js](https://nodejs.org/) instalado
- Microsoft SQL Server (LocalDB) instalado
- SSMS instalado
- ODBC Driver 17 for SQL Server instalado
- VS Code com extensão Live Server

#### 1. Configuração do Banco de Dados
1. Abra o SSMS e crie um banco de dados chamado `crud_clientes` no LocalDB.
2. Execute os scripts da pasta `scripts/` nesta ordem: Tabelas (DDL) → DML → Funções, Procedures e Gatilhos.

#### 2. Execução da API (Backend)
1. Navegue até a pasta `api/` e instale as dependências:
```
npm install
```
2. Inicie o servidor:
```
node index.js
```
> A API ficará disponível em `http://localhost:3000`

#### 3. Execução do Frontend
1. Mantenha o terminal da API rodando.
2. Abra o arquivo `front/index.html` com a extensão **Live Server** do VS Code.
> O Live Server deve rodar na porta `8000`, que é a origem liberada no CORS da API.

[Código Fonte](api/)

### Relatório Final
O relatório final está disponível nos arquivos:<br>
[relatorio-final.docx](relatorio-final/relatorio-final.docx)<br>
[relatorio-final.pdf](relatorio-final/relatorio-final.pdf)

### Referências Bibliográficas
- MICROSOFT. **SQL Server Documentation**. Disponível em: https://learn.microsoft.com/pt-br/sql/sql-server/. Acesso em: jun. 2026.
- NODE.JS. **Node.js Documentation**. Disponível em: https://nodejs.org/en/docs/. Acesso em: jun. 2026.
- NPM MSSQL. **Microsoft SQL Server client for Node.js**. Disponível em: https://www.npmjs.com/package/mssql. Acesso em: jun. 2026.
- ANGULARJS. **AngularJS Documentation**. Disponível em: https://angularjs.org/. Acesso em: jun. 2026.
- BOOTSTRAP. **Bootstrap 5.3 Documentation**. Disponível em: https://getbootstrap.com/docs/5.3/. Acesso em: jun. 2026.
