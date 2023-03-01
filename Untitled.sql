CREATE TABLE `curso` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(100),
  `id_unidade` varchar(255)
);

CREATE TABLE `turma` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `codigo` int(3),
  `nome` varchar(100),
  `id_curso` varchar(100)
);

CREATE TABLE `aluno` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(100),
  `cpf` int(11),
  `telefone` int(12),
  `email` varchar(100),
  `id_turma` int
);

CREATE TABLE `facilitador` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(100),
  `cpf` int(11),
  `telefone` int(12),
  `email` varchar(100)
);

CREATE TABLE `projeto` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `modulo` int,
  `nota` int
);

CREATE TABLE `monitor` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(100),
  `cpf` int(11),
  `telefone` int(12),
  `email` varchar(100)
);

CREATE TABLE `unidade` (
  `id` unidade,
  `nome` varchar(100),
  `endereco` varchar(100)
);

ALTER TABLE `curso` ADD FOREIGN KEY (`id_unidade`) REFERENCES `unidade` (`id`);

ALTER TABLE `turma` ADD FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`);

ALTER TABLE `aluno` ADD FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`);

CREATE TABLE `turma_facilitador` (
  `turma_id` int,
  `facilitador_id` int,
  PRIMARY KEY (`turma_id`, `facilitador_id`)
);

ALTER TABLE `turma_facilitador` ADD FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`);

ALTER TABLE `turma_facilitador` ADD FOREIGN KEY (`facilitador_id`) REFERENCES `facilitador` (`id`);


CREATE TABLE `aluno_projeto` (
  `aluno_id` int,
  `projeto_id` int,
  PRIMARY KEY (`aluno_id`, `projeto_id`)
);

ALTER TABLE `aluno_projeto` ADD FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`);

ALTER TABLE `aluno_projeto` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`id`);


CREATE TABLE `turma_monitor` (
  `turma_id` int,
  `monitor_id` int,
  PRIMARY KEY (`turma_id`, `monitor_id`)
);

ALTER TABLE `turma_monitor` ADD FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`);

ALTER TABLE `turma_monitor` ADD FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`);

