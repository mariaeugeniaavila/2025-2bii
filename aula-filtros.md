
# 📘 Plano de Aula: Consultas SQL – Filtros, Ordenação e Seleção

## 🎯 Objetivo da Aula
Ensinar o uso de cláusulas e operadores SQL para realizar consultas avançadas, filtrando, ordenando e retornando dados de forma precisa no MySQL, utilizando o banco de dados da **biblioteca**.

---

## 🗂 Conteúdo Programático

### 1. **AS** – Renomeando Colunas ou Tabelas
**Explicação:**  
O `AS` é usado para dar nomes temporários a colunas ou tabelas no resultado da consulta.

**Exemplos:**
```sql
-- Renomeia a coluna "nome" para "NomeEditora"
SELECT nome AS NomeEditora FROM editora;

-- Renomeia duas colunas para nomes mais claros
SELECT nome AS NomeEditora, cidade AS CidadeLocal FROM editora;

-- Usa apelido para a tabela "editora"
SELECT e.nome, e.cidade 
FROM editora AS e;
```

---

### 2. **LIMIT e OFFSET** – Controle de Registros
**Explicação:**  
`LIMIT` limita a quantidade de registros. `OFFSET` define a partir de qual posição começar.

**Exemplos:**
```sql
-- Retorna os 5 primeiros livros
SELECT titulo FROM livro LIMIT 5;

-- Retorna 5 livros a partir do 6º registro
SELECT titulo FROM livro LIMIT 5 OFFSET 5;

-- Retorna 10 editoras a partir da 11ª
SELECT nome FROM editora LIMIT 10 OFFSET 10;
```

---

### 3. **DISTINCT** – Elimina Duplicatas
**Explicação:**  
Remove valores repetidos, exibindo apenas resultados únicos.

**Exemplos:**
```sql
-- Lista cidades únicas
SELECT DISTINCT cidade FROM editora;

-- Lista prazos únicos dos perfis
SELECT DISTINCT prazo FROM perfil;

-- Lista códigos únicos de gêneros
SELECT DISTINCT id_genero FROM livro;
```

---

### 4. **ORDER BY** – Ordenando Resultados
**Explicação:**  
Ordena registros em ordem crescente (`ASC`) ou decrescente (`DESC`).

**Exemplos:**
```sql
-- Ordena títulos em ordem alfabética
SELECT titulo FROM livro ORDER BY titulo ASC;

-- Ordena editoras por cidade em ordem decrescente
SELECT nome, cidade FROM editora ORDER BY cidade DESC;

-- Ordena primeiro pelo nome e depois pelo email
SELECT nome, email FROM usuario ORDER BY nome ASC, email ASC;
```

---

### 5. **WHERE – Filtrando Colunas de Números**
**Explicação:**  
Filtra resultados com base em valores numéricos.

**Exemplos:**
```sql
-- Perfis com prazo maior que 60 dias
SELECT nome, prazo FROM perfil WHERE prazo > 60;

-- Livros da edição 1
SELECT titulo FROM livro WHERE edicao = 1;

-- Perfis com limite de até 5 livros
SELECT nome, limite FROM perfil WHERE limite <= 5;
```

---

### 6. **WHERE – Filtrando Colunas de Texto**
**Explicação:**  
Filtra resultados com base em textos.

**Exemplos:**
```sql
-- Livro com título exatamente igual a '1984'
SELECT titulo FROM livro WHERE titulo = '1984';

-- Editoras localizadas em São Paulo
SELECT nome FROM editora WHERE cidade = 'São Paulo';

-- Busca usuário específico pelo nome
SELECT * FROM usuario WHERE nome = 'Alice Souza';
```

---

### 7. **WHERE – Filtrando Colunas de Data**
**Explicação:**  
Filtra resultados com base em datas.

**Exemplos:**
```sql
-- Empréstimos feitos em 01/10/2024
SELECT * FROM emprestimo WHERE data_emprestimo = '2024-10-01';

-- Empréstimos entregues após 01/11/2024
SELECT * FROM emprestimo WHERE data_entrega > '2024-11-01';

-- Empréstimos entregues antes de 01/12/2024
SELECT * FROM emprestimo WHERE data_entrega < '2024-12-01';
```

---

### 8. **Operadores Lógicos no SQL**
**Explicação:**  
Permitem combinar condições (`AND`, `OR`, `NOT`).

**Exemplos:**
```sql
-- Livros com gênero 1 E edição 1
SELECT * FROM livro WHERE id_genero = 1 AND edicao = 1;

-- Perfis com prazo > 60 OU limite < 5
SELECT * FROM perfil WHERE prazo > 60 OR limite < 5;

-- Livros que não são do gênero 3
SELECT * FROM livro WHERE NOT id_genero = 3;
```

---

### 9. **WHERE + AND – Mais de Uma Condição**
**Explicação:**  
Aplica múltiplos filtros que devem ser verdadeiros ao mesmo tempo.

**Exemplos:**
```sql
-- Usuários de SP com perfil 1
SELECT * FROM usuario 
WHERE endereco LIKE '%São Paulo%' AND id_perfil = 1;

-- Perfis com limite > 5 e prazo >= 60
SELECT * FROM perfil 
WHERE limite > 5 AND prazo >= 60;

-- Livros do gênero 1 e edição 1
SELECT * FROM livro 
WHERE id_genero = 1 AND edicao = 1;
```

---

### 10. **WHERE + OR – Mais de Uma Condição**
**Explicação:**  
Seleciona registros que atendam a pelo menos uma condição.

**Exemplos:**
```sql
-- Editoras de SP ou RJ
SELECT * FROM editora 
WHERE cidade = 'São Paulo' OR cidade = 'Rio de Janeiro';

-- Usuários com perfil 1 ou 2
SELECT * FROM usuario 
WHERE id_perfil = 1 OR id_perfil = 2;

-- Perfis com limite 5 ou prazo 30
SELECT * FROM perfil 
WHERE limite = 5 OR prazo = 30;
```

---

### 11. **WHERE + NOT – Negando o Filtro**
**Explicação:**  
Exclui registros que atendam à condição.

**Exemplos:**
```sql
-- Perfis que não têm prazo igual a 30
SELECT * FROM perfil WHERE NOT prazo = 30;

-- Livros que não pertencem ao gênero 1
SELECT * FROM livro WHERE NOT id_genero = 1;

-- Editoras que não estão em SP
SELECT * FROM editora WHERE NOT cidade = 'São Paulo';
```

---

### 12. **WHERE + IN – Alternativa ao OR**
**Explicação:**  
Seleciona registros que estão em uma lista de valores.

**Exemplos:**
```sql
-- Usuários com perfil 1, 2 ou 3
SELECT * FROM usuario WHERE id_perfil IN (1, 2, 3);

-- Editoras em SP ou RJ
SELECT * FROM editora WHERE cidade IN ('São Paulo', 'Rio de Janeiro');

-- Livros dos gêneros 1, 3 ou 4
SELECT * FROM livro WHERE id_genero IN (1, 3, 4);
```

---

### 13. **WHERE + LIKE – Filtro para Textos**
**Explicação:**  
Filtra textos por padrões usando curingas `%` (qualquer quantidade de caracteres) e `_` (um único caractere).

**Exemplos:**
```sql
-- Títulos que começam com "O"
SELECT * FROM livro WHERE titulo LIKE 'O%';

-- Nomes que terminam com "Souza"
SELECT * FROM usuario WHERE nome LIKE '%Souza';

-- Editoras que contêm "Editora" no nome
SELECT * FROM editora WHERE nome LIKE '%Editora%';
```

---

### 14. **WHERE + BETWEEN – Intervalos**
**Explicação:**  
Seleciona registros dentro de um intervalo (inclusive limites).

**Exemplos:**
```sql
-- Perfis com prazo entre 30 e 90
SELECT * FROM perfil WHERE prazo BETWEEN 30 AND 90;

-- Livros com gêneros entre 1 e 5
SELECT * FROM livro WHERE id_genero BETWEEN 1 AND 5;

-- Empréstimos feitos entre outubro e dezembro de 2024
SELECT * FROM emprestimo 
WHERE data_emprestimo BETWEEN '2024-10-01' AND '2024-12-31';
```

---

### 15. **WHERE + IS NULL / IS NOT NULL**
**Explicação:**  
Verifica se um valor é nulo ou não nulo.

**Exemplos:**
```sql
-- Usuários sem email cadastrado
SELECT * FROM usuario WHERE email IS NULL;

-- Usuários com telefone cadastrado
SELECT * FROM usuario WHERE telefone IS NOT NULL;

-- Empréstimos que possuem data de entrega
SELECT * FROM emprestimo WHERE data_entrega IS NOT NULL;
```
