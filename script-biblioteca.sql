#########################################################################################
########################## DDL - CRIAÇÃO DAS TABELAS  ###################################
#########################################################################################
create table editora (
	id int not null auto_increment primary key,
    nome varchar (255),
    cidade varchar (255)
);

create table genero (
	id int not null auto_increment primary key,
    nome varchar (255)
);

create table perfil (
	id int not null auto_increment primary key,
    nome varchar (255), 
    limite int,
    prazo int
);

create table autor (
	id int not null auto_increment primary key,
    nome varchar (255)
);

create table usuario (
	id int not null auto_increment primary key,
    nome varchar (255),
    cpf char (11) unique,
    endereco varchar (255),
    telefone varchar (255),
    email varchar (255),
    id_perfil int,
    foreign key (id_perfil) references perfil(id)
);

create table livro (
	id int not null auto_increment primary key,
    titulo varchar (255),
    isbn char (8) unique,
    edicao int,
    volume int,
    id_genero int,
    id_editora int,
    foreign key (id_genero) references genero(id),
    foreign key (id_editora) references editora(id)
);

create table exemplar (
	id int not null auto_increment primary key,
    status enum('0', '1', '2'),
    id_livro int,
    foreign key (id_livro) references livro(id)
);

create table autoria (
	id int not null auto_increment primary key,
    id_livro int,
    id_autor int,
    foreign key (id_livro) references livro(id),
    foreign key (id_autor) references autor(id)
);

create table emprestimo (
	id int not null auto_increment primary key,
    data_entrega date,
    data_emprestimo date,
    prazo int,
    id_usuario int,
    id_exemplar int,
    foreign key (id_usuario) references usuario(id),
    foreign key (id_exemplar) references exemplar(id)
);

#########################################################################################
########################## DML - INSERÇÃO DE REGISTROS  #################################
#########################################################################################
INSERT INTO editora (nome, cidade) VALUES
('Companhia das Letras', 'São Paulo'),
('Editora Record', 'Rio de Janeiro'),
('Rocco', 'Rio de Janeiro'),
('Nova Fronteira', 'Rio de Janeiro'),
('Objetiva', 'Rio de Janeiro'),
('Planeta', 'São Paulo'),
('Alfaguara', 'São Paulo'),
('Seguinte', 'São Paulo'),
('Intrínseca', 'Rio de Janeiro'),
('Nova Terceira Margem', 'São Paulo'),
('Ateliê', 'São Paulo'),
('Malê', 'São Paulo'),
('Caras', 'São Paulo'),
('Girassol', 'São Paulo'),
('FTD', 'São Paulo'),
('Moderna', 'São Paulo'),
('Sesi', 'São Paulo'),
('Senac', 'São Paulo'),
('Presença', 'Porto Alegre'),
('Leya', 'São Paulo'),
('Antestreia', 'São Paulo'),
('Martins Fontes', 'São Paulo'),
('Melhoramentos', 'São Paulo'),
('Leya Brasil', 'São Paulo'),
('Versalete', 'São Paulo'),
('Cia das Letras', 'São Paulo'),
('Contexto', 'São Paulo'),
('Lúmen', 'São Paulo'),
('Boitempo', 'São Paulo'),
('Patois', 'São Paulo'),
('34', 'São Paulo'),
('Perspectiva', 'São Paulo'),
('Ideia & Ação', 'São Paulo'),
('Culturama', 'São Paulo'),
('O Livro', 'São Paulo'),
('Fábrica 231', 'São Paulo'),
('Parábola', 'São Paulo'),
('DCL', 'São Paulo'),
('Jandaíra', 'São Paulo'),
('Phaidon', 'São Paulo'),
('Pioneira', 'São Paulo'),
('Paulinas', 'São Paulo'),
('Vozes', 'Petrópolis'),
('Sesc', 'São Paulo'),
('Fantástica', 'São Paulo'),
('Scriptum', 'São Paulo'),
('Editora Unesp', 'São Paulo'),
('Editora Patuá', 'São Paulo'),
('Editora Martins Fontes', 'São Paulo'),
('Editora Rocco Jovens Leitores', 'Rio de Janeiro');


INSERT INTO genero (nome) VALUES
('Ficção'),
('Não-ficção'),
('Fantasia'),
('Romance'),
('Terror'),
('Mistério'),
('Aventura'),
('Biografia'),
('Autoajuda'),
('História'),
('Ficção Científica'),
('Drama'),
('Poesia'),
('Literatura Infantil'),
('Literatura Young Adult'),
('Clássicos'),
('Distopia'),
('Suspense'),
('Romance Histórico'),
('Erótico'),
('Comédia'),
('Romance Policial'),
('Fábula'),
('Contos'),
('Ensaios'),
('Tragédia'),
('Gótico'),
('Literatura LGBTQIA+'),
('Western'),
('Steampunk'),
('Cyberpunk'),
('Ação'),
('Graphic Novel'),
('Manga'),
('Novela'),
('Antologia'),
('Ficção Interativa'),
('Chick Lit'),
('Literatura de Viagem'),
('História em Quadrinhos'),
('Terror Psicológico'),
('Romance de Época'),
('Literatura de Fantasia Urbana'),
('Romance de Formação'),
('Conto de Fadas'),
('Narrativa Experimental'),
('Não-ficção Científica'),
('Literatura de Horror'),
('Literatura de Memórias'),
('Sátira');


INSERT INTO perfil (nome, limite, prazo) VALUES
('Usuário Comum', 5, 30),
('Usuário Premium', 10, 60),
('Bibliotecário', 20, 90),
('Estudante', 3, 30),
('Professor', 15, 60),
('Pesquisador', 25, 120),
('Autor', 10, 90),
('Colaborador', 8, 45),
('Leitor Crítico', 4, 20),
('Leitor Recreativo', 6, 30),
('Membro do Clube do Livro', 7, 30),
('Editor', 12, 90),
('Gestor de Conteúdo', 18, 120),
('Revisor', 5, 60),
('Tradutor', 10, 90),
('Apreciador de Poesia', 5, 30),
('Entusiasta de Ficção Científica', 6, 30),
('Cineasta', 4, 30),
('Crítico Literário', 10, 60),
('Blogueiro Literário', 8, 30),
('Jornalista Cultural', 7, 60),
('Estudante de Letras', 3, 30),
('Pesquisador Acadêmico', 20, 120),
('Leitor de Clássicos', 5, 45),
('Amante de Fantasia', 6, 30),
('Colecionador de Livros', 10, 90),
('Participante de Feiras Literárias', 8, 60),
('Influenciador Literário', 10, 90),
('Mestre em Literatura', 12, 180),
('Estudante de Biblioteconomia', 5, 30),
('Mentor Literário', 15, 120),
('Participante de Workshops', 4, 30),
('Dramaturgo', 10, 90),
('Roteirista', 8, 60),
('Artista Gráfico', 5, 30),
('Criador de Quadrinhos', 6, 30),
('Editor Assistente', 7, 60),
('Analista de Conteúdo', 12, 90),
('Estudante de História', 3, 30),
('Apreciador de Não-ficção', 5, 30),
('Participante de Grupos de Leitura', 6, 30),
('Professor Universitário', 15, 120),
('Mestre em Artes', 20, 180),
('Consultor Literário', 10, 90),
('Escritor de Contos', 7, 60),
('Conferencista Literário', 12, 90),
('Artista de Performance', 5, 30),
('Moderador de Clubes de Leitura', 8, 60),
('Promotor de Eventos Literários', 10, 90),
('Estudante de Comunicação', 3, 30);


INSERT INTO autor (nome) VALUES
('Mark Twain'),
('Leo Tolstoy'),
('Fyodor Dostoevsky'),
('Jane Austen'),
('Emily Dickinson'),
('Charlotte Brontë'),
('Virginia Woolf'),
('Gabriel García Márquez'),
('Chimamanda Ngozi Adichie'),
('Margaret Atwood'),
('Kurt Vonnegut'),
('F. Scott Fitzgerald'),
('T.S. Eliot'),
('John Updike'),
('Raymond Carver'),
('David Mitchell'),
('Kazuo Ishiguro'),
('Daphne du Maurier'),
('Cormac McCarthy'),
('Toni Morrison'),
('Philip Roth'),
('Alice Munro'),
('Joan Didion'),
('Michael Ondaatje'),
('Chinua Achebe'),
('Haruki Murakami'),
('J.D. Salinger'),
('Roald Dahl'),
('Oscar Wilde'),
('Stephen Hawking'),
('Neil Gaiman'),
('Ben Okri'),
('Mario Vargas Llosa'),
('Henry James'),
('Isaac Asimov'),
('Patricia Highsmith'),
('Sylvia Plath'),
('Ralph Waldo Emerson'),
('Henry David Thoreau'),
('Zora Neale Hurston'),
('Richard Wright'),
('Alice Walker'),
('William S. Burroughs'),
('Herman Melville'),
('John Steinbeck'),
('Arthur Miller'),
('James Baldwin'),
('Flannery O Connor'),
('Gabriel García Márquez'),
('Marcel Proust');



INSERT INTO usuario (nome, cpf, endereco, telefone, email, id_perfil) VALUES
('Alice Souza', '11122233344', 'Rua 1, 123', '(11) 91234-5678', 'alice.souza@hotmail.com', 1),
('Bruno Lima', '22233344455', 'Avenida 2, 456', '(21) 99876-5432', 'bruno.lima@hotmail.com', 2),
('Carla Pereira', '33344455566', 'Rua 3, 789', '(31) 98765-4321', 'carla.pereira@hotmail.com', 3),
('Daniel Silva', '44455566677', 'Rua 4, 101', '(41) 97654-3210', 'daniel.silva@hotmail.com', 1),
('Eduarda Costa', '55566677788', 'Rua 5, 102', '(51) 96543-2109', 'eduarda.costa@hotmail.com', 2),
('Felipe Santos', '66677788899', 'Avenida 6, 103', '(61) 95432-1098', 'felipe.santos@hotmail.com', 3),
('Gabriela Almeida', '77788899900', 'Rua 7, 104', '(71) 94321-0987', 'gabriela.almeida@hotmail.com', 1),
('Henrique Rocha', '88899900011', 'Avenida 8, 105', '(81) 93210-9876', 'henrique.rocha@hotmail.com', 2),
('Isabela Martins', '99900011122', 'Rua 9, 106', '(91) 92109-8765', 'isabela.martins@hotmail.com', 3),
('Joaquim Mendes', '00011122233', 'Rua 10, 107', '(02) 91098-7654', 'joaquim.mendes@hotmail.com', 1),
('Karina Ferreira', '11122233345', 'Rua 11, 108', '(12) 90987-6543', 'karina.ferreira@hotmail.com', 2),
('Lucas Ribeiro', '22233344456', 'Avenida 12, 109', '(22) 89876-5432', 'lucas.ribeiro@hotmail.com', 3),
('Mariana Martins', '33344455567', 'Rua 13, 110', '(32) 88765-4321', 'mariana.martins@hotmail.com', 1),
('Nicolas Santos', '44455566678', 'Avenida 14, 111', '(42) 87654-3210', 'nicolas.santos@hotmail.com', 2),
('Olivia Lima', '55566677789', 'Rua 15, 112', '(52) 86543-2109', 'olivia.lima@hotmail.com', 3),
('Paulo Silva', '66677788890', 'Avenida 16, 113', '(62) 85432-1098', 'paulo.silva@hotmail.com', 1),
('Quiteria Gomes', '77788899901', 'Rua 17, 114', '(72) 84321-0987', 'quiteria.gomes@hotmail.com', 2),
('Rafael Costa', '88899900012', 'Avenida 18, 115', '(82) 83210-9876', 'rafael.costa@hotmail.com', 3),
('Sofia Almeida', '99900011123', 'Rua 19, 116', '(92) 82109-8765', 'sofia.almeida@hotmail.com', 1),
('Thiago Pires', '00011122234', 'Rua 20, 117', '(03) 81098-7654', 'thiago.pires@hotmail.com', 2),
('Ursula Carvalho', '11122233346', 'Rua 21, 118', '(13) 80987-6543', 'ursula.carvalho@hotmail.com', 3),
('Vinícius Dias', '22233344457', 'Avenida 22, 119', '(23) 79876-5432', 'vinicius.dias@hotmail.com', 1),
('Wesley Nunes', '33344455568', 'Rua 23, 120', '(33) 78765-4321', 'wesley.nunes@hotmail.com', 2),
('Xuxa Martins', '44455566679', 'Avenida 24, 121', '(43) 77654-3210', 'xuxa.martins@hotmail.com', 3),
('Yasmin Ribeiro', '55566677780', 'Rua 25, 122', '(53) 76543-2109', 'yasmin.ribeiro@hotmail.com', 1),
('Zé Carlos', '66677788891', 'Avenida 26, 123', '(63) 75432-1098', 'ze.carlos@hotmail.com', 2),
('Amanda Lemos', '77788899902', 'Rua 27, 124', '(73) 74321-0987', 'amanda.lemos@hotmail.com', 3),
('Bruno Ferreira', '88899900013', 'Avenida 28, 125', '(83) 73210-9876', 'bruno.ferreira@hotmail.com', 1),
('Clara Lima', '99900011124', 'Rua 29, 126', '(93) 72109-8765', 'clara.lima@hotmail.com', 2),
('Diego Santos', '00011122235', 'Rua 30, 127', '(04) 71098-7654', 'diego.santos@hotmail.com', 3),
('Eva Nascimento', '11122233347', 'Rua 31, 128', '(14) 70987-6543', 'eva.nascimento@hotmail.com', 1),
('Felipe Alves', '22233344458', 'Avenida 32, 129', '(24) 69876-5432', 'felipe.alves@hotmail.com', 2),
('Gabriel Rocha', '33344455569', 'Rua 33, 130', '(34) 68765-4321', 'gabriel.rocha@hotmail.com', 3),
('Helena Costa', '44455566670', 'Avenida 34, 131', '(44) 67654-3210', 'helena.costa@hotmail.com', 1),
('Igor Martins', '55566677781', 'Rua 35, 132', '(54) 66543-2109', 'igor.martins@hotmail.com', 2),
('Juliana Pires', '66677788892', 'Avenida 36, 133', '(64) 65432-1098', 'juliana.pires@hotmail.com', 3),
('João da Silva', '12345678901', 'Rua A, 123', '(11) 91234-5678', 'joao.silva@gmail.com', 1), 
('Maria Souza', '23456789012', 'Rua B, 456', '(21) 92345-6789', 'maria.souza@gmail.com', 2), 
('Pedro Oliveira', '34567890123', 'Rua C, 789', '(31) 93456-7890', 'pedro.oliveira@gmail.com', 3), 
('Ana Lima', '45678901234', 'Rua D, 101', '(41) 94567-8901', 'ana.lima@hotmail.com', 4), 
('Lucas Mendes', '56789012345', 'Rua E, 202', '(51) 95678-9012', 'lucas.mendes@hotmail.com', 5), 
('Carla Santos', '67890123456', 'Rua F, 303', '(61) 96789-0123', 'carla.santos@yahoo.com', 6), 
('Bruno Costa', '78901234567', 'Rua G, 404', '(71) 97890-1234', 'bruno.costa@gmail.com', 7), 
('Juliana Ribeiro', '89012345678', 'Rua H, 505', '(81) 98901-2345', 'juliana.ribeiro@hotmail.com', 8),
('Fernanda Martins', '90123456789', 'Rua I, 606', '(91) 99012-3456', 'fernanda.martins@gmail.com', 9), 
('Thiago Ferreira', '01234567890', 'Rua J, 707', '(31) 91234-5678', 'thiago.ferreira@gmail.com', 10),
('Paula Cardoso', '11234567891', 'Rua K, 808', '(41) 92345-6789', 'paula.cardoso@yahoo.com', 11), 
('Roberto Almeida', '12234567892', 'Rua L, 909', '(21) 93456-7890', 'roberto.almeida@hotmail.com', 12),
('Renata Nunes', '13234567893', 'Rua M, 1010', '(11) 94567-8901', 'renata.nunes@gmail.com', 13), 
('Carlos Moreira', '14234567894', 'Rua N, 1111', '(31) 95678-9012', 'carlos.moreira@hotmail.com', 14),
('Isabela Lopes', '15234567895', 'Rua O, 1212', '(51) 96789-0123', 'isabela.lopes@gmail.com', 15), 
('Ricardo Barbosa', '16234567896', 'Rua P, 1313', '(71) 97890-1234', 'ricardo.barbosa@yahoo.com', 16), 
('Marcela Duarte', '17234567897', 'Rua Q, 1414', '(61) 98901-2345', 'marcela.duarte@hotmail.com', 17),
('Rafael Gomes', '18234567898', 'Rua R, 1515', '(81) 99012-3456', 'rafael.gomes@gmail.com', 18),
('Tatiana Souza', '19234567899', 'Rua S, 1616', '(91) 91234-5678', 'tatiana.souza@yahoo.com', 19), 
('Eduardo Lima', '20234567890', 'Rua T, 1717', '(41) 92345-6789', 'eduardo.lima@hotmail.com', 20), 
('Flávia Teixeira', '21234567891', 'Rua U, 1818', '(21) 93456-7890', 'flavia.teixeira@gmail.com', 21), 
('Diego Azevedo', '22234567892', 'Rua V, 1919', '(11) 94567-8901', 'diego.azevedo@hotmail.com', 22), 
('Beatriz Pereira', '23234567893', 'Rua W, 2020', '(31) 95678-9012', 'beatriz.pereira@yahoo.com', 23), 
('Marcelo Lima', '24234567894', 'Rua X, 2121', '(51) 96789-0123', 'marcelo.lima@gmail.com', 24);




INSERT INTO livro (titulo, isbn, edicao, volume, id_genero, id_editora) VALUES
('As Aventuras de Tom Sawyer', '12345678', 1, 1, 1, 1),
('Guerra e Paz', '12345679', 1, 1, 1, 2),
('Crime e Castigo', '12345680', 1, 1, 1, 3),
('Orgulho e Preconceito', '12345681', 1, 1, 4, 1),
('A Poesia de Emily Dickinson', '12345682', 1, 1, 12, 4),
('Jane Eyre', '12345683', 1, 1, 1, 3),
('Mrs. Dalloway', '12345684', 1, 1, 1, 2),
('Cem Anos de Solidão', '12345685', 1, 1, 4, 1),
('Meio Sol Amarelo', '12345686', 1, 1, 4, 2),
('O Conto da Aia', '12345687', 1, 1, 1, 3),
('Matadouro Cinco', '12345688', 1, 1, 1, 2),
('O Grande Gatsby', '12345689', 1, 1, 1, 2),
('A Terra das Sombras', '12345690', 1, 1, 1, 3),
('A Paixão Segundo G.H.', '12345691', 1, 1, 1, 1),
('O Apanhador no Campo de Centeio', '12345692', 1, 1, 1, 2),
('A Origem das Espécies', '12345693', 1, 1, 11, 3),
('O Nome da Rosa', '12345694', 1, 1, 1, 2),
('A Casa dos Espíritos', '12345695', 1, 1, 1, 1),
('O Sol é para Todos', '12345696', 1, 1, 1, 3),
('A Cor Púrpura', '12345697', 1, 1, 1, 3),
('O Sol Também se Levanta', '12345698', 1, 1, 1, 2),
('O Silêncio dos Inocentes', '12345699', 1, 1, 1, 1),
('1984', '12345700', 1, 1, 16, 2),
('A Insustentável Leveza do Ser', '12345701', 1, 1, 1, 3),
('O Morro dos Ventos Uivantes', '12345702', 1, 1, 1, 4),
('As Meninas', '12345703', 1, 1, 1, 2),
('O Livro dos Espíritos', '12345704', 1, 1, 1, 1),
('A Revolução dos Bichos', '12345705', 1, 1, 1, 3),
('O Apanhador no Campo de Centeio', '12345706', 1, 1, 1, 4),
('O Pequeno Príncipe', '12345707', 1, 1, 12, 1),
('Harry Potter e a Pedra Filosofal', '12345708', 1, 1, 3, 2),
('O Senhor dos Anéis: A Sociedade do Anel', '12345709', 1, 1, 3, 1),
('A Menina que Roubava Livros', '12345710', 1, 1, 1, 3),
('O Mágico de Oz', '12345711', 1, 1, 12, 1),
('A Guerra dos Mundos', '12345712', 1, 1, 11, 3),
('Drácula', '12345713', 1, 1, 1, 2),
('A Metamorfose', '12345714', 1, 1, 1, 3),
('A Trilogia da Fundação', '12345715', 1, 1, 1, 2),
('O Processo', '12345716', 1, 1, 1, 1),
('O Diário de Anne Frank', '12345717', 1, 1, 1, 3),
('Os Miseráveis', '12345718', 1, 1, 1, 2),
('Fahrenheit 451', '12345719', 1, 1, 1, 1),
('O Fim da Eternidade', '12345720', 1, 1, 1, 2),
('A Lógica do Cisne Negro', '12345721', 1, 1, 11, 3),
('O Livro dos Espíritos', '12345722', 1, 1, 1, 4),
('O Fabuloso Destino de Amélie Poulain', '12345723', 1, 1, 1, 2),
('Cem Anos de Solidão', '12345724', 1, 1, 1, 1),
('A Culpa é das Estrelas', '12345725', 1, 1, 1, 3),
('A História Sem Fim', '12345726', 1, 1, 3, 1),
('O Hobbit', '12345727', 1, 1, 3, 2);


INSERT INTO exemplar (status, id_livro) VALUES
('1', 1),
('1', 2),
('1', 3),
('1', 4),
('0', 5),
('1', 6),
('1', 7),
('2', 8),
('1', 9),
('0', 10),
('1', 11),
('1', 12),
('1', 13),
('2', 14),
('1', 15),
('1', 16),
('1', 17),
('0', 18),
('1', 19),
('1', 20),
('1', 21),
('1', 22),
('2', 23),
('1', 24),
('1', 25),
('1', 26),
('1', 27),
('0', 28),
('1', 29),
('1', 30),
('1', 31),
('1', 32),
('2', 33),
('1', 34),
('1', 35),
('1', 36),
('1', 37),
('1', 38),
('0', 39),
('1', 40),
('1', 41),
('2', 42),
('1', 43),
('1', 44),
('1', 45),
('1', 46),
('1', 47),
('0', 48),
('1', 49),
('2', 50);


INSERT INTO autoria (id_livro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49),
(50, 50);



INSERT INTO emprestimo (data_emprestimo, data_entrega, prazo, id_usuario, id_exemplar) VALUES
('2024-10-01', '2024-10-31', 30, 1, 1),  -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 2, 2),  -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 3, 6),  -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 4, 3),  -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 5, 5),  -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 6, 6),  -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 7, 7),  -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 8, 8),  -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 9, 9),  -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 10, 11), -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 11, 12), -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 12, 13), -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 13, 14), -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 14, 15), -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 15, 16), -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 16, 17), -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 17, 18), -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 18, 19), -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 19, 20), -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 20, 21), -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 21, 22), -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 22, 23), -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 23, 24), -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 24, 25), -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 25, 26), -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 26, 27), -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 27, 28), -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 28, 29), -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 29, 30), -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 30, 31), -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 1, 5),   -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 2, 10),  -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 3, 15),  -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 4, 20),  -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 5, 25),  -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 6, 30),  -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 7, 35),  -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 8, 40),  -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 9, 1),    -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 10, 2),   -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 11, 3),   -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 12, 4),   -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 13, 5),   -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 14, 6),   -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 15, 7),   -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 16, 8),   -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 17, 9),   -- Usuário Premium
('2024-10-01', '2025-01-01', 90, 18, 10),  -- Bibliotecário
('2024-10-01', '2024-10-31', 30, 19, 11),  -- Usuário Comum
('2024-10-01', '2024-12-01', 60, 20, 12);  -- Usuário Premium

#########################################################################################
########################## DQL - SELEÇÃO DE REGISTROS  ##################################
#########################################################################################