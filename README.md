# 🚀 Sistema de Autenticação Delphi (Clean Architecture)

![Delphi](https://img.shields.io/badge/Delphi-12.0-red.svg)
![Firebird](https://img.shields.io/badge/Database-Firebird-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

Sistema de login robusto desenvolvido em Delphi, focado na aplicação de **Padrões de Projeto (Design Patterns)** e nos princípios do **Clean Code**.

---

## 🛠️ Tecnologias e Padrões Utilizados

Este projeto foi construído para demonstrar maturidade técnica, utilizando:

* **Padrões de Projeto (Design Patterns):**
    * **Singleton:** Gerenciamento de conexão única com o banco de dados.
    * **Repository Pattern:** Isolamento total da lógica de persistência (SQL).
    * **Factory Method:** Centralização da criação de instâncias de repositórios.
    * **Encapsulamento:** Entidades com Getters/Setters e validações internas.
* **Arquitetura:** Camadas bem definidas (View, Service, Model, Repository, Provider).
* **Banco de Dados:** Firebird 2.5+ com FireDAC.

---

## 📂 Estrutura de Pastas

```text
Source/
 ├── Model/        # Entidades (POCO) e classes de dados
 ├── Service/      # Regras de negócio e autenticação
 ├── Repository/   # Interfaces e implementações de persistência
 ├── Providers/    # Infraestrutura e conexão com banco
 └── View/         # Formulários e interface do usuário