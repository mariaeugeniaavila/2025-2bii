# 📘 Plano de Aula: Funções em SQL (String, Numéricas e de Data/Hora)

## 🎯 Objetivo da Aula
Aprender a utilizar funções de **manipulação de strings**, **operações numéricas** e **tratamento de datas/horas** em consultas SQL aplicadas ao banco de dados da biblioteca.

---

## 🔤 Funções de String

### 1. **UPPER()**  
Converte todo o texto para maiúsculas.  
```sql
-- 1. Nome dos usuários em maiúsculas
SELECT UPPER(nome) AS nome_maiusculo FROM usuario;

-- 2. Cidade das editoras em maiúsculas
SELECT UPPER(cidade) FROM editora;

-- 3. Títulos dos livros em maiúsculas
SELECT UPPER(titulo) FROM livro;
```

---

### 2. **LOWER()**  
Converte todo o texto para minúsculas.  
```sql
-- 1. Nome dos usuários em minúsculas
SELECT LOWER(nome) AS nome_minusculo FROM usuario;

-- 2. Emails em minúsculas
SELECT LOWER(email) FROM usuario;

-- 3. Nomes dos autores em minúsculas
SELECT LOWER(nome) FROM autor;
```

---

### 3. **LENGTH()**  
Retorna o número de caracteres de uma string.  
```sql
-- 1. Quantidade de caracteres no nome do usuário
SELECT nome, LENGTH(nome) AS qtd_caracteres FROM usuario;

-- 2. Quantidade de caracteres nos títulos dos livros
SELECT titulo, LENGTH(titulo) FROM livro;

-- 3. Quantidade de dígitos no CPF
SELECT cpf, LENGTH(cpf) FROM usuario;
```

---

### 4. **CONCAT()**  
Combina duas ou mais strings.  
```sql
-- 1. Nome completo e CPF juntos
SELECT CONCAT(nome, ' - ', cpf) AS usuario_cpf FROM usuario;

-- 2. Nome e cidade da editora
SELECT CONCAT(nome, ' (', cidade, ')') AS editora_local FROM editora;

-- 3. Título do livro + edição
SELECT CONCAT(titulo, ' - Edição ', edicao) AS livro_edicao FROM livro;
```

---

## 🔢 Funções Numéricas

### 5. **ROUND()**  
Arredonda um número para determinado número de casas decimais.  
```sql
-- 1. Média dos prazos de empréstimos com 2 casas decimais
SELECT ROUND(AVG(prazo), 2) AS media_prazo FROM emprestimo;

-- 2. Arredondar para inteiro a média do limite de livros por perfil
SELECT ROUND(AVG(limite), 0) AS media_limite FROM perfil;

-- 3. Arredondar valores de edições
SELECT ROUND(edicao, 0) FROM livro;
```

---

### 6. **ABS()**  
Retorna o valor absoluto de um número.  
```sql
-- 1. Diferença absoluta entre prazo e 30 dias
SELECT ABS(prazo - 30) AS diferenca FROM emprestimo;

-- 2. Diferença entre limite e 10
SELECT nome, ABS(limite - 10) AS dif FROM perfil;

-- 3. Valor absoluto de um cálculo hipotético
SELECT ABS(-15) AS valor_absoluto;
```

---

### 7. **CEIL()**  
Retorna o menor inteiro maior ou igual ao número.  
```sql
-- 1. Arredondar para cima a média de prazo dos empréstimos
SELECT CEIL(AVG(prazo)) AS prazo_arredondado FROM emprestimo;

-- 2. Arredondar para cima a média de limite dos perfis
SELECT CEIL(AVG(limite)) FROM perfil;

-- 3. Exemplo simples
SELECT CEIL(9.3) AS resultado;
```

---

## ⏰ Funções de Data e Hora

### 8. **NOW() / GETDATE()**  
Retorna a data e hora atuais.  
```sql
-- 1. Mostrar a data e hora atuais
SELECT NOW() AS data_atual;

-- 2. Calcular diferença entre hoje e data de empréstimo
SELECT id, DATEDIFF(NOW(), data_emprestimo) AS dias_passados FROM emprestimo;

-- 3. Mostrar data de hoje junto ao nome do usuário
SELECT nome, NOW() AS hoje FROM usuario;
```

---

### 9. **DATEDIFF()**  
Calcula a diferença entre duas datas.  
```sql
-- 1. Dias entre data de empréstimo e devolução
SELECT id, DATEDIFF(data_entrega, data_emprestimo) AS duracao
FROM emprestimo;

-- 2. Diferença em dias entre hoje e entrega prevista
SELECT id, DATEDIFF(data_entrega, NOW()) AS dias_para_entrega FROM emprestimo;

-- 3. Quantos dias cada usuário ficou com um livro
SELECT id_usuario, DATEDIFF(data_entrega, data_emprestimo) AS dias_emprestado
FROM emprestimo;
```

---

### 10. **YEAR(), MONTH(), DAY()**  
Extraem partes de uma data.  
```sql
-- 1. Ano do empréstimo
SELECT id, YEAR(data_emprestimo) AS ano FROM emprestimo;

-- 2. Mês da entrega
SELECT id, MONTH(data_entrega) AS mes FROM emprestimo;

-- 3. Dia do empréstimo
SELECT id, DAY(data_emprestimo) AS dia FROM emprestimo;
```

---

✅ **Encerramento da Aula:**  
Os alunos devem praticar criando consultas que combinem **funções de string, numéricas e de data** em cenários reais do banco de dados da biblioteca.
