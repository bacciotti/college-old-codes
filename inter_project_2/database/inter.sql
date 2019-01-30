-- phpMyAdmin SQL Dump
-- version 2.10.1
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tempo de Geração: Nov 18, 2010 as 11:23 AM
-- Versão do Servidor: 5.0.45
-- Versão do PHP: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Banco de Dados: `inter`
-- 

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `admin`
-- 

CREATE TABLE `admin` (
  `usuario` varchar(15) NOT NULL,
  `senha` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `admin`
-- 

INSERT INTO `admin` (`usuario`, `senha`) VALUES 
('admin', 'admin');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `doadores`
-- 

CREATE TABLE `doadores` (
  `nome` varchar(30) NOT NULL,
  `endereco` varchar(30) NOT NULL,
  `idade` int(2) NOT NULL,
  `tiposangue` varchar(5) NOT NULL,
  `exames` varchar(50) NOT NULL,
  `dataultima` date NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `doadores`
-- 

INSERT INTO `doadores` (`nome`, `endereco`, `idade`, `tiposangue`, `exames`, `dataultima`, `email`) VALUES 
('Quimzim', 'Venids 26, 890', 65, 'o-', 'hemogranam urina', '2010-11-02', 'uimm@hiu.net'),
('Lucas', 'avenida 29', 14, 'ab+', 'hemiograma completo', '2010-11-10', 'lucas@baciotti.com'),
('andriely', 'eweqwewqe', 22, 'o+', 'dasdasdasd', '2009-05-05', 'dsd@dasda.net');
