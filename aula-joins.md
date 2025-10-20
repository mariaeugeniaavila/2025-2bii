# Plano de Aula — JOINS em Banco de Dados (SQL)


## 1) Objetivos de Aprendizagem

- Diferenciar: `INNER`, `LEFT`, `RIGHT`, `FULL OUTER` e *excludentes* (anti-joins).  
- Ler e escrever consultas com junções entre duas ou mais tabelas.  
- Reconhecer quando usar cada tipo e as implicações no resultado.  

---

## 2) Ambiente e Convenções

- SQL padrão, testável em **PostgreSQL** e **SQL Server**.  
- Observações de compatibilidade:
  - **MySQL** não possui `FULL OUTER JOIN`; é necessário simular com `UNION` de `LEFT JOIN` + `RIGHT JOIN`.  

---

## 3) Base de Dados da Aula

*Esquema de tabelas e inserts já definido antes: Clientes, Pedidos, Categorias, Produtos, ItensPedido)*  

---

## 4) Roteiro da Aula

1. **Introdução:** chaves primárias e estrangeiras. (10 min)  
2. **INNER JOIN** — conceito e 3 exemplos. (15 min)  
3. **LEFT JOIN** — conceito e 3 exemplos. (10 min)  
4. **RIGHT JOIN** — conceito e 3 exemplos. (10 min)  
5. **FULL OUTER JOIN** — conceito e 3 exemplos. (15 min)  
6. **Excluding Joins (LEFT, RIGHT, OUTER)** — conceito e 3 exemplos cada. (30 min)  
7. **Atividades rápidas** e encerramento. (10 min)  

---

## 5) Conteúdo e Exemplos

---

### 🔗 5.1 INNER JOIN
**Definição:**  
- Retorna apenas os registros que possuem correspondência em ambas as tabelas.  
- É o JOIN mais usado.  
- Se não houver correspondência, a linha é descartada.  

**Quando usar?**  
- Quando só interessam os dados que existem nas duas tabelas relacionadas.  

**Exemplo 1 — Clientes que já fizeram pedidos**
```sql
SELECT c.nome, p.id_pedido
FROM Clientes c
INNER JOIN Pedidos p ON p.id_cliente = c.id_cliente;
```

**Exemplo 2 — Produtos vendidos (com quantidade)**
```sql
SELECT pr.nome_produto, i.quantidade, p.data_pedido
FROM Produtos pr
INNER JOIN ItensPedido i ON pr.id_produto = i.id_produto
INNER JOIN Pedidos p ON i.id_pedido = p.id_pedido;
```

**Exemplo 3 — Pedidos com dados do cliente**
```sql
SELECT p.id_pedido, c.nome, c.cidade, p.data_pedido
FROM Pedidos p
INNER JOIN Clientes c ON p.id_cliente = c.id_cliente;
```

---

### 🔗 5.2 LEFT JOIN
**Definição:**  
- Retorna todos os registros da **tabela da esquerda**, mesmo que não tenham correspondência na direita.  
- Se não houver correspondência, os campos da direita ficam `NULL`.  

**Quando usar?**  
- Para garantir que todos os registros da tabela principal apareçam, mesmo sem vínculos.  

**Exemplo 1 — Clientes e seus pedidos (inclui clientes sem pedidos)**
```sql
SELECT c.nome, p.id_pedido
FROM Clientes c
LEFT JOIN Pedidos p ON p.id_cliente = c.id_cliente;
```

**Exemplo 2 — Produtos e seus itens vendidos (inclui nunca vendidos)**
```sql
SELECT pr.nome_produto, i.id_pedido, i.quantidade
FROM Produtos pr
LEFT JOIN ItensPedido i ON pr.id_produto = i.id_produto;
```

**Exemplo 3 — Categorias e seus produtos (inclui categorias sem produtos)**
```sql
SELECT cat.nome_categoria, pr.nome_produto
FROM Categorias cat
LEFT JOIN Produtos pr ON pr.id_categoria = cat.id_categoria;
```

---

### 🔗 5.3 RIGHT JOIN
**Definição:**  
- Retorna todos os registros da **tabela da direita**, mesmo que não tenham correspondência na esquerda.  
- Se não houver correspondência, os campos da esquerda ficam `NULL`.  

**Quando usar?**  
- Quando a tabela da direita é a principal e não se quer perder seus registros.  

**Exemplo 1 — Pedidos com informações do cliente**
```sql
SELECT p.id_pedido, c.nome
FROM Clientes c
RIGHT JOIN Pedidos p ON p.id_cliente = c.id_cliente;
```

**Exemplo 2 — Itens vendidos com nome do produto**
```sql
SELECT i.id_pedido, pr.nome_produto, i.quantidade
FROM Produtos pr
RIGHT JOIN ItensPedido i ON pr.id_produto = i.id_produto;
```

**Exemplo 3 — Produtos por categoria (garante todos os produtos)**
```sql
SELECT cat.nome_categoria, pr.nome_produto
FROM Categorias cat
RIGHT JOIN Produtos pr ON pr.id_categoria = cat.id_categoria;
```

---

### 🔗 5.4 FULL OUTER JOIN
**Definição:**  
- Retorna todos os registros de **ambas as tabelas**: com correspondência ou não.  
- Se não houver correspondência, preenche com `NULL`.  
- ⚠️ MySQL não tem suporte direto, deve-se simular.  

**Quando usar?**  
- Quando é importante visualizar todos os dados de ambos os lados.  

**Exemplo 1 — Clientes × Pedidos**
```sql
SELECT c.nome, p.id_pedido
FROM Clientes c
FULL OUTER JOIN Pedidos p ON c.id_cliente = p.id_cliente;
```

**Exemplo 2 — Categorias × Produtos**
```sql
SELECT cat.nome_categoria, pr.nome_produto
FROM Categorias cat
FULL OUTER JOIN Produtos pr ON cat.id_categoria = pr.id_categoria;
```

**Exemplo 3 — Alternativa MySQL (simulação com UNION)**
```sql
SELECT c.nome, p.id_pedido
FROM Clientes c
LEFT JOIN Pedidos p ON c.id_cliente = p.id_cliente
UNION
SELECT c.nome, p.id_pedido
FROM Clientes c
RIGHT JOIN Pedidos p ON c.id_cliente = p.id_cliente;
```

---

### 🔗 5.5 LEFT EXCLUDING JOIN
**Definição:**  
- Retorna apenas registros da esquerda **sem correspondência** na direita.  

**Quando usar?**  
- Para encontrar registros órfãos (ex.: clientes sem pedidos).  

**Exemplo 1 — Clientes sem pedidos**
```sql
SELECT c.*
FROM Clientes c
LEFT JOIN Pedidos p ON p.id_cliente = c.id_cliente
WHERE p.id_pedido IS NULL;
```

**Exemplo 2 — Categorias sem produtos**
```sql
SELECT cat.*
FROM Categorias cat
LEFT JOIN Produtos pr ON pr.id_categoria = cat.id_categoria
WHERE pr.id_produto IS NULL;
```

**Exemplo 3 — Produtos nunca vendidos**
```sql
SELECT pr.*
FROM Produtos pr
LEFT JOIN ItensPedido i ON pr.id_produto = i.id_produto
WHERE i.id_pedido IS NULL;
```

---

### 🔗 5.6 RIGHT EXCLUDING JOIN
**Definição:**  
- Retorna apenas registros da direita **sem correspondência** na esquerda.  

**Quando usar?**  
- Para identificar inconsistências ou registros soltos do lado direito.  

**Exemplo 1 — Pedidos sem cliente**
```sql
SELECT p.*
FROM Clientes c
RIGHT JOIN Pedidos p ON p.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL;
```

**Exemplo 2 — Itens sem produto**
```sql
SELECT i.*
FROM Produtos pr
RIGHT JOIN ItensPedido i ON pr.id_produto = i.id_produto
WHERE pr.id_produto IS NULL;
```

**Exemplo 3 — Produtos sem categoria**
```sql
SELECT pr.*
FROM Categorias cat
RIGHT JOIN Produtos pr ON pr.id_categoria = cat.id_categoria
WHERE cat.id_categoria IS NULL;
```

---

### 🔗 5.7 OUTER EXCLUDING JOIN
**Definição:**  
- Retorna registros **sem correspondência em nenhum dos lados**.  
- É a “diferença simétrica” entre as tabelas.  

**Quando usar?**  
- Para encontrar dados isolados ou verificar integridade entre tabelas.  

**Exemplo 1 — Clientes ↔ Pedidos**
```sql
SELECT c.nome, p.id_pedido
FROM Clientes c
FULL OUTER JOIN Pedidos p ON c.id_cliente = p.id_cliente
WHERE c.id_cliente IS NULL OR p.id_pedido IS NULL;
```

**Exemplo 2 — Categorias ↔ Produtos**
```sql
SELECT cat.nome_categoria, pr.nome_produto
FROM Categorias cat
FULL OUTER JOIN Produtos pr ON cat.id_categoria = pr.id_categoria
WHERE cat.id_categoria IS NULL OR pr.id_produto IS NULL;
```

**Exemplo 3 — Produtos ↔ ItensPedido**
```sql
SELECT pr.nome_produto, i.id_pedido
FROM Produtos pr
FULL OUTER JOIN ItensPedido i ON pr.id_produto = i.id_produto
WHERE pr.id_produto IS NULL OR i.id_pedido IS NULL;
```

---

## 6) Atividade em Sala
1. Liste todas as categorias e conte quantos produtos há em cada (incluindo as sem produtos).  
2. Mostre os clientes que compraram “Caderno 96f”.  
3. Liste clientes sem pedidos e produtos nunca vendidos em uma única lista.  

---

## 7) Encerramento
- Cada JOIN responde a um objetivo: interseção, preservação ou exclusão.  
- Anti-joins são muito úteis para auditoria e verificação de dados.  
- Regra prática: escolha o JOIN pensando em **qual lado você não pode perder**.  
