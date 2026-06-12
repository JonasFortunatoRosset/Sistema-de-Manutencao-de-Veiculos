# 🔧 Sistema de Manutenção de Veículos

> ⚠️ **Projeto em desenvolvimento**

Sistema desenvolvido para gerenciar as operações de uma oficina mecânica, incluindo clientes, veículos, ordens de serviço, colaboradores, peças e fornecedores.

---

## 👥 Integrantes

- Nathan Rocha Gomes
- Jonas Fortunato Rosset
- Gabriel

---

## 🛠️ Tecnologias Utilizadas

- **SQL Server** — banco de dados relacional
- **SSMS** — SQL Server Management Studio para administração do banco

---

## 📁 Estrutura do Repositório

```
📦 Sistema-de-Manutencao-de-Veiculos
├── 📂 scripts/
│   └── 📂 ddl/
│       └── sistema_de_manutencao_de_veiculos.ddl.sql
└── 📄 README.md
```

---

## 🗄️ Banco de Dados

### ▶️ Como executar o script DDL

1. Abra o **SQL Server Management Studio (SSMS)**
2. Conecte-se à sua instância do SQL Server
3. Abra o arquivo `scripts/ddl/sistema_de_manutencao_de_veiculos.ddl.sql`
4. Execute o script com **F5**

### 📋 Tabelas

| Tabela | Descrição |
|---|---|
| `clientes` | Dados dos clientes da oficina |
| `veiculos` | Veículos cadastrados e seus proprietários |
| `colaboradores` | Funcionários da oficina |
| `colaboradores_os` | Relação entre colaboradores e ordens de serviço |
| `ordem_de_servico` | Ordens de serviço abertas para os veículos |
| `servicos` | Catálogo de tipos de serviço oferecidos |
| `servicos_os` | Serviços executados em cada OS |
| `servicos_os_pecas` | Peças utilizadas em cada serviço da OS |
| `pecas` | Estoque de peças disponíveis |
| `fornecedores` | Empresas fornecedoras de peças |
| `itens_inventario` | Equipamentos e ferramentas da oficina |

---

## 📌 Roadmap

- [x] Modelagem do banco de dados
- [x] Script DDL
- [x] Dicionário de dados
- [ ] Back-end
- [ ] Front-end

---

## 🔗 Issues

As tarefas e melhorias do projeto são acompanhadas pelas [Issues do repositório](../../issues).
