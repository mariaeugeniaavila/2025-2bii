# 📘 Plano de Aula: Manipulação de Dados em SQL (DML Básico) — Clínica

## 🎯 Objetivo da Aula
Introduzir os comandos fundamentais de manipulação de dados em SQL: `SELECT`, `INSERT`, `UPDATE`, `DELETE`, com foco no uso prático em um banco de dados de clínica médica. A aula enfatiza os fundamentos, sem abordar cláusulas como `BETWEEN`, `LIKE`, `ORDER BY`, `IN`, `NOT` ou funções agregadas.

---

## 🏗️ Script de Criação do Banco de Dados `ClinicaFinal`

```sql
CREATE DATABASE IF NOT EXISTS ClinicaFinal;
USE ClinicaFinal;

CREATE TABLE IF NOT EXISTS Pacientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE,
    data_nascimento DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Medicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Consultas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    medico_id INT,
    data DATE,
    horario TIME CHECK (horario >= '07:00' AND horario <= '19:00'),
    status VARCHAR(20) DEFAULT 'agendada',
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(id)
);

CREATE TABLE IF NOT EXISTS Receitas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    consulta_id INT,
    descricao TEXT,
    FOREIGN KEY (consulta_id) REFERENCES Consultas(id)
);
```

---

## 📌 Comando: `INSERT INTO`

### ✅ Exemplos

1. **Inserir um paciente**
   ```sql
   INSERT INTO Pacientes (nome, cpf, data_nascimento)
   VALUES ('Carla Souza', '12345678901', '1990-05-10');
   ```

2. **Inserir um médico**
   ```sql
   INSERT INTO Medicos (nome, especialidade)
   VALUES ('Dr. João Lima', 'Cardiologia');
   ```

3. **Inserir uma consulta**
   ```sql
   INSERT INTO Consultas (paciente_id, medico_id, data, horario)
   VALUES (1, 1, '2025-08-01', '08:00');
   ```

4. **Inserir uma receita**
   ```sql
   INSERT INTO Receitas (consulta_id, descricao)
   VALUES (1, 'Tomar 1 comprimido de paracetamol a cada 8h');
   ```

5. **Inserir paciente e médico adicionais**
   ```sql
   INSERT INTO Pacientes (nome, cpf, data_nascimento)
   VALUES ('Lucas Martins', '98765432100', '1985-11-22');
   ```

### 📝 Exercícios e Resoluções

**Exercício 1:** Cadastre a paciente "Mariana Dias", CPF "55566677788", nascida em "1987-02-20".
```sql
INSERT INTO Pacientes (nome, cpf, data_nascimento)
VALUES ('Mariana Dias', '55566677788', '1987-02-20');
```

**Exercício 2:** Insira o médico "Dra. Paula Moura", especialidade "Dermatologia".
```sql
INSERT INTO Medicos (nome, especialidade)
VALUES ('Dra. Paula Moura', 'Dermatologia');
```

**Exercício 3:** Marque uma consulta entre o paciente 2 e médico 2 no dia 05/08/2025 às 10:00.
```sql
INSERT INTO Consultas (paciente_id, medico_id, data, horario)
VALUES (2, 2, '2025-08-05', '10:00');
```

**Exercício 4:** Registre a receita da consulta 2 com descrição “Hidratante duas vezes ao dia”.
```sql
INSERT INTO Receitas (consulta_id, descricao)
VALUES (2, 'Hidratante duas vezes ao dia');
```

**Exercício 5:** Insira novo paciente “Renato Braga”, CPF “11122233344”, nascido em “1970-06-15”.
```sql
INSERT INTO Pacientes (nome, cpf, data_nascimento)
VALUES ('Renato Braga', '11122233344', '1970-06-15');
```

---

## 📌 Comando: `UPDATE`

### ✅ Exemplos

1. **Atualizar o nome de um paciente**
   ```sql
   UPDATE Pacientes SET nome = 'Carla M. Souza' WHERE id = 1;
   ```

2. **Atualizar especialidade de médico**
   ```sql
   UPDATE Medicos SET especialidade = 'Neurologia' WHERE id = 2;
   ```

3. **Atualizar status da consulta**
   ```sql
   UPDATE Consultas SET status = 'realizada' WHERE id = 1;
   ```

4. **Atualizar horário da consulta**
   ```sql
   UPDATE Consultas SET horario = '09:30' WHERE id = 1;
   ```

5. **Atualizar múltiplos campos da receita**
   ```sql
   UPDATE Receitas SET descricao = 'Tomar após refeições' WHERE id = 1;
   ```

### 📝 Exercícios e Resoluções

**Exercício 1:** Atualize o nome da paciente com id 2 para "Mariana S. Dias".
```sql
UPDATE Pacientes SET nome = 'Mariana S. Dias' WHERE id = 2;
```

**Exercício 2:** Altere a especialidade do médico com id 1 para "Clínico Geral".
```sql
UPDATE Medicos SET especialidade = 'Clínico Geral' WHERE id = 1;
```

**Exercício 3:** Mude o status da consulta 2 para "cancelada".
```sql
UPDATE Consultas SET status = 'cancelada' WHERE id = 2;
```

**Exercício 4:** Corrija o horário da consulta 2 para "11:00".
```sql
UPDATE Consultas SET horario = '11:00' WHERE id = 2;
```

**Exercício 5:** Atualize a descrição da receita 2 para “Usar apenas à noite”.
```sql
UPDATE Receitas SET descricao = 'Usar apenas à noite' WHERE id = 2;
```

---

## 📌 Comando: `DELETE FROM`

### ✅ Exemplos

1. **Excluir paciente**
   ```sql
   DELETE FROM Pacientes WHERE id = 5;
   ```

2. **Excluir médico**
   ```sql
   DELETE FROM Medicos WHERE id = 3;
   ```

3. **Excluir consulta**
   ```sql
   DELETE FROM Consultas WHERE id = 2;
   ```

4. **Excluir receita**
   ```sql
   DELETE FROM Receitas WHERE id = 1;
   ```

5. **Excluir pacientes por CPF**
   ```sql
   DELETE FROM Pacientes WHERE cpf = '98765432100';
   ```

## 📌 Comando: `SELECT`

### ✅ Exemplos

1. **Selecionar todos os pacientes**
   ```sql
   SELECT * FROM Pacientes;
   ```

2. **Selecionar nome e CPF dos médicos**
   ```sql
   SELECT nome, especialidade FROM Medicos;
   ```

3. **Selecionar nome do paciente com id 1**
   ```sql
   SELECT nome FROM Pacientes WHERE id = 1;
   ```

4. **Selecionar status das consultas**
   ```sql
   SELECT status FROM Consultas;
   ```

5. **Selecionar data e horário das consultas com o médico id 2**
   ```sql
   SELECT data, horario FROM Consultas WHERE medico_id = 2;
   ```

### 📝 Exercícios e Resoluções

**Exercício 1:** Liste todos os médicos.
```sql
SELECT * FROM Medicos;
```

**Exercício 2:** Mostre apenas o nome e CPF dos pacientes.
```sql
SELECT nome, cpf FROM Pacientes;
```

**Exercício 3:** Exiba o nome do paciente com id = 2.
```sql
SELECT nome FROM Pacientes WHERE id = 2;
```

**Exercício 4:** Liste os horários das consultas.
```sql
SELECT horario FROM Consultas;
```

**Exercício 5:** Mostre a descrição das receitas da consulta 1.
```sql
SELECT descricao FROM Receitas WHERE consulta_id = 1;
```

---


### 📝 Exercícios e Resoluções

**Exercício 1:** Delete o paciente com id 2.
```sql
DELETE FROM Pacientes WHERE id = 2;
```

**Exercício 2:** Remova o médico com id 1.
```sql
DELETE FROM Medicos WHERE id = 1;
```

**Exercício 3:** Apague a consulta com id 1.
```sql
DELETE FROM Consultas WHERE id = 1;
```

**Exercício 4:** Exclua a receita com id 2.
```sql
DELETE FROM Receitas WHERE id = 2;
```

**Exercício 5:** Delete o paciente com CPF '11122233344'.
```sql
DELETE FROM Pacientes WHERE cpf = '11122233344';
```

---

## 🧩 Exercício Final

**Situação:**

1. Cadastrar paciente "Fernanda Torres", CPF "99988877766", nascida em "1993-07-25"
2. Cadastrar médico "Dr. Hugo Sales", especialidade "Pediatria"
3. Marcar consulta entre os dois para 08/08/2025 às 08:30
4. Registrar a receita "Antibiótico por 7 dias"
5. Atualizar status da consulta para "realizada"
6. Atualizar nome da paciente para "Fernanda T. Torres"
7. Excluir os dados criados

**Resolução:**
```sql
-- Inserir paciente
INSERT INTO Pacientes (nome, cpf, data_nascimento)
VALUES ('Fernanda Torres', '99988877766', '1993-07-25');

-- Inserir médico
INSERT INTO Medicos (nome, especialidade)
VALUES ('Dr. Hugo Sales', 'Pediatria');

-- Inserir consulta (supondo paciente_id = 6, medico_id = 4)
INSERT INTO Consultas (paciente_id, medico_id, data, horario)
VALUES (6, 4, '2025-08-08', '08:30');

-- Inserir receita
INSERT INTO Receitas (consulta_id, descricao)
VALUES (3, 'Antibiótico por 7 dias');

-- Atualizar status
UPDATE Consultas SET status = 'realizada' WHERE id = 3;

-- Atualizar nome paciente
UPDATE Pacientes SET nome = 'Fernanda T. Torres' WHERE id = 6;

-- Excluir todos
DELETE FROM Receitas WHERE consulta_id = 3;
DELETE FROM Consultas WHERE id = 3;
DELETE FROM Pacientes WHERE id = 6;
DELETE FROM Medicos WHERE id = 4;
```

---

