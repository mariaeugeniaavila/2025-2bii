# 📘 Plano de Aula: Funções de Agregação em SQL

## 🎯 Objetivo da Aula
Compreender e aplicar funções de agregação em SQL (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`) e o uso do `GROUP BY` em consultas sobre bancos de dados relacionais.

---

## 1. **COUNT()**  
Conta o número de linhas em uma tabela ou o número de valores não nulos em uma coluna.

### Exemplos
```sql
-- 1. Quantos usuários estão cadastrados no sistema
SELECT COUNT(*) AS total_usuarios FROM usuario;

-- 2. Quantos livros estão cadastrados
SELECT COUNT(*) AS total_livros FROM livro;

-- 3. Quantos empréstimos foram realizados em 2024
SELECT COUNT(*) AS emprestimos_2024
FROM emprestimo
WHERE YEAR(data_emprestimo) = 2024;
```

---

## 2. **SUM()**  
Soma todos os valores de uma coluna numérica.

### Exemplos
```sql
-- 1. Soma de todos os limites de livros dos perfis
SELECT SUM(limite) AS soma_limites FROM perfil;

-- 2. Quantidade total de volumes de livros cadastrados
SELECT SUM(volume) AS total_volumes FROM livro;

-- 3. Soma dos prazos de todos os empréstimos
SELECT SUM(prazo) AS soma_prazos FROM emprestimo;
```

---

## 3. **AVG()**  
Calcula a média dos valores de uma coluna numérica.

### Exemplos
```sql
-- 1. Média do limite de livros dos perfis
SELECT AVG(limite) AS media_limite FROM perfil;

-- 2. Média dos prazos de empréstimos
SELECT AVG(prazo) AS media_prazo FROM emprestimo;

-- 3. Média da edição dos livros cadastrados
SELECT AVG(edicao) AS media_edicao FROM livro;
```

---

## 4. **MAX()**  
Retorna o maior valor encontrado em uma coluna.

### Exemplos
```sql
-- 1. Maior limite de livros permitido entre os perfis
SELECT MAX(limite) AS maior_limite FROM perfil;

-- 2. Maior prazo de empréstimo já registrado
SELECT MAX(prazo) AS maior_prazo FROM emprestimo;

-- 3. Maior edição cadastrada entre os livros
SELECT MAX(edicao) AS maior_edicao FROM livro;
```

---

## 5. **MIN()**  
Retorna o menor valor encontrado em uma coluna.

### Exemplos
```sql
-- 1. Menor limite de livros entre os perfis
SELECT MIN(limite) AS menor_limite FROM perfil;

-- 2. Menor prazo de empréstimo registrado
SELECT MIN(prazo) AS menor_prazo FROM emprestimo;

-- 3. Menor edição cadastrada entre os livros
SELECT MIN(edicao) AS menor_edicao FROM livro;
```

---

## 6. **GROUP BY**  
Agrupa registros que possuem valores iguais em uma ou mais colunas, permitindo aplicar funções de agregação em cada grupo.

### Exemplos
```sql
-- 1. Quantos usuários existem em cada perfil
SELECT id_perfil, COUNT(*) AS total_usuarios
FROM usuario
GROUP BY id_perfil;

-- 2. Quantos livros cada editora possui
SELECT id_editora, COUNT(*) AS total_livros
FROM livro
GROUP BY id_editora;

-- 3. Média do prazo de empréstimo por perfil de usuário
SELECT u.id_perfil, AVG(e.prazo) AS media_prazo
FROM emprestimo e
JOIN usuario u ON e.id_usuario = u.id
GROUP BY u.id_perfil;
```
