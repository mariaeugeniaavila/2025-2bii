
# 📘 Plano de Aula: Comandos DDL em SQL – Sistema de Clínica Médica

---

## 🎯 Objetivos

- Aplicar os comandos DDL para modelar um sistema de clínica médica.
- Criar bancos, tabelas e constraints com progressão didática.
- Consolidar o aprendizado com exercício prático integrador.

---

## Comandos

### 🔹 1. CREATE DATABASE + USE

**Explicação:**  
Cria um banco de dados. O comando `USE` seleciona o banco para uso imediato.

**Exemplos:**
```sql
CREATE DATABASE ClinicaDB;
USE ClinicaDB;

CREATE DATABASE SistemaClinico;
USE SistemaClinico;

CREATE DATABASE AtendimentoMedico;
USE AtendimentoMedico;
```
---

### 🔹 2. CREATE TABLE (sem constraints)

**Explicação:**  
Cria estruturas básicas para armazenar dados. Não contém ainda restrições.

**Exemplos:**
```sql
CREATE TABLE Pacientes (
    id INT,
    nome VARCHAR(100),
    idade INT
);

CREATE TABLE Medicos (
    id INT,
    nome VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE Exames (
    id INT,
    tipo VARCHAR(100),
    descricao TEXT
);
```

---

### 🔹 3. DROP TABLE e DROP DATABASE

**Explicação:**  
Apaga tabelas ou bancos de dados. Use com cautela, pois os dados são perdidos permanentemente.

**Exemplos:**
```sql
DROP TABLE Exames;
DROP TABLE Funcionarios;
DROP DATABASE ClinicaDB;
```

---

### 🔹 4. ALTER TABLE (Adicionar, Modificar, Remover, Renomear)

**Explicação:**  
Altera a estrutura de tabelas existentes.

**Exemplos:**
```sql
ALTER TABLE Pacientes ADD email VARCHAR(100);
ALTER TABLE Medicos MODIFY especialidade VARCHAR(150);
ALTER TABLE Pacientes DROP COLUMN idade;
ALTER TABLE Funcionarios RENAME TO Colaboradores;
ALTER TABLE Medicos RENAME COLUMN nome TO nome_completo;
```

---

### 🔹 5. IF NOT EXISTS / IF EXISTS

**Explicação:**  
Evita erros na criação/exclusão de objetos.  
`IF NOT EXISTS`: cria apenas se não existir.  
`IF EXISTS`: remove apenas se existir.

**Exemplos:**
```sql
CREATE DATABASE IF NOT EXISTS ClinicaFinal;
DROP TABLE IF EXISTS Recepcionistas;
DROP DATABASE IF EXISTS ClinicaAntiga;
```

---

## 🔐 Parte 2: Restrições (Constraints)

### 🔸 NOT NULL

**Explicação:**  
Garante que um campo não seja deixado em branco (valor obrigatório).

**Exemplos:**
```sql
CREATE TABLE Pacientes (
    id INT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE Medicos (
    id INT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
);
```

---

### 🔸 UNIQUE

**Explicação:**  
Evita duplicidade de valores em uma coluna.

**Exemplos:**
```sql
CREATE TABLE Pacientes (
    id INT,
    cpf VARCHAR(11) UNIQUE,
    nome VARCHAR(100)
);

CREATE TABLE Medicos (
    id INT,
    crm VARCHAR(10),
    UNIQUE (crm)
);
```

---

### 🔸 DEFAULT

**Explicação:**  
Define um valor padrão para uma coluna, caso não seja fornecido.

**Exemplos:**
```sql
CREATE TABLE Consultas (
    id INT,
    status VARCHAR(20) DEFAULT 'agendada'
);

CREATE TABLE Funcionarios (
    id INT,
    ativo BOOLEAN DEFAULT TRUE
);
```

---

### 🔸 CHECK

**Explicação:**  
Impõe uma condição para o valor inserido.

**Exemplos:**
```sql
CREATE TABLE Consultas (
    id INT,
    horario TIME,
    CHECK (horario BETWEEN '07:00:00' AND '19:00:00')
);

CREATE TABLE Pacientes (
    id INT,
    idade INT,
    CHECK (idade >= 0)
);
```

---

### ✳️ Nomeação de Constraints

**Exemplos:**
```sql
ALTER TABLE Pacientes ADD CONSTRAINT uq_cpf UNIQUE (cpf);
ALTER TABLE Consultas ADD CONSTRAINT chk_horario CHECK (horario BETWEEN '07:00:00' AND '19:00:00');
ALTER TABLE Medicos ADD CONSTRAINT pk_medicos PRIMARY KEY (id);
```


## 🧠 Exercício

Crie o banco `ClinicaFinal` com `IF NOT EXISTS` e as tabelas abaixo com atributos, restrições e relacionamentos adequados.

Pacientes: id (PK, AUTO_INCREMENT), nome (NOT NULL), cpf (UNIQUE), data_nascimento (NOT NULL)  
Medicos: id (PK, AUTO_INCREMENT), nome (NOT NULL), especialidade  
Consultas: id (PK, AUTO_INCREMENT), paciente_id (FK), medico_id (FK), data, horario (CHECK entre '07:00' e '19:00'), status (DEFAULT 'agendada')  
Receitas: id (PK, AUTO_INCREMENT), consulta_id (FK), descricao (TEXT)

```sql
CREATE DATABASE ClinicaFinal;
USE ClinicaFinal;

CREATE TABLE Pacientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE,
    data_nascimento DATE NOT NULL
);

CREATE TABLE Medicos (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100)
);

CREATE TABLE Consultas (
    id INT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    data DATE,
    horario TIME,
    status VARCHAR(20) DEFAULT 'agendada',
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(id),
    CHECK (horario BETWEEN '07:00:00' AND '19:00:00')
);

CREATE TABLE Receitas (
    id INT PRIMARY KEY,
    consulta_id INT,
    descricao TEXT,
    FOREIGN KEY (consulta_id) REFERENCES Consultas(id)
);
```
