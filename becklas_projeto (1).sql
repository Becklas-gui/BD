-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/04/2025 às 14:20
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `becklas_projeto`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `cpf` varchar(15) NOT NULL,
  `rm` int(8) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `turma_id_fk` int(3) DEFAULT NULL,
  `projeto_id_fk` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

CREATE TABLE `curso` (
  `id` int(3) NOT NULL,
  `nome` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `curso`
--

INSERT INTO `curso` (`id`, `nome`) VALUES
(1, 'DS'),
(2, 'ELT'),
(3, 'ADM');

-- --------------------------------------------------------

--
-- Estrutura para tabela `projetos`
--

CREATE TABLE `projetos` (
  `id` int(3) NOT NULL,
  `titulo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `projetos`
--

INSERT INTO `projetos` (`id`, `titulo`) VALUES
(1, 'Alimentador de cavalos automatico'),
(2, 'Sistema de Defesa de Hortas'),
(3, 'Motor a combustao');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` int(3) NOT NULL,
  `serie` int(1) DEFAULT NULL,
  `curso_id_fk` int(3) DEFAULT NULL,
  `turno_id_fk` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turnos`
--

CREATE TABLE `turnos` (
  `id` int(3) NOT NULL,
  `periodo` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turnos`
--

INSERT INTO `turnos` (`id`, `periodo`) VALUES
(0, 'manha'),
(1, 'manha'),
(2, 'tarde');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD KEY `turma_id_fk` (`turma_id_fk`),
  ADD KEY `projeto_id_fk` (`projeto_id_fk`);

--
-- Índices de tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turno_id_fk` (`turno_id_fk`),
  ADD KEY `curso_id_fk` (`curso_id_fk`);

--
-- Índices de tabela `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`turma_id_fk`) REFERENCES `turmas` (`id`),
  ADD CONSTRAINT `alunos_ibfk_2` FOREIGN KEY (`projeto_id_fk`) REFERENCES `projetos` (`id`);

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`turno_id_fk`) REFERENCES `turnos` (`id`),
  ADD CONSTRAINT `turmas_ibfk_2` FOREIGN KEY (`curso_id_fk`) REFERENCES `curso` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
