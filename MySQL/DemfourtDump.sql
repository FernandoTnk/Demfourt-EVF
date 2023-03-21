-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: demfourt
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `PK_cliente_id` int NOT NULL AUTO_INCREMENT,
  `data_de_cadastro` datetime NOT NULL,
  `data_de_atualização_de_cadastro` datetime NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `data_de_nascimento` datetime NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rua` varchar(200) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cep` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `observação` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PK_cliente_id`),
  UNIQUE KEY `PK_cliente_id_UNIQUE` (`PK_cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente__obra`
--

DROP TABLE IF EXISTS `cliente__obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente__obra` (
  `PK_obra_id` int NOT NULL AUTO_INCREMENT,
  `numero_de_referencia` varchar(100) NOT NULL,
  `data_de_adicionamento` datetime NOT NULL,
  `data_de_atualização` datetime NOT NULL,
  `numero_de_cadastro` varchar(100) NOT NULL,
  `matricula` varchar(100) NOT NULL,
  `rua` varchar(200) NOT NULL,
  `lote` varchar(150) NOT NULL,
  `quadra` varchar(150) NOT NULL,
  `cep` varchar(50) NOT NULL,
  `loteamento` varchar(200) NOT NULL,
  `art` varchar(200) NOT NULL,
  `area_terreno` varchar(150) NOT NULL,
  `area_construção` varchar(150) NOT NULL,
  `FK_cliente_obra` int NOT NULL,
  PRIMARY KEY (`PK_obra_id`),
  UNIQUE KEY `projeto_id_UNIQUE` (`PK_obra_id`),
  KEY `cliente_id_idx` (`FK_cliente_obra`),
  CONSTRAINT `FK_cliente_obra` FOREIGN KEY (`FK_cliente_obra`) REFERENCES `cliente` (`PK_cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composição__item`
--

DROP TABLE IF EXISTS `composição__item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composição__item` (
  `PK_item_id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `item` varchar(45) NOT NULL,
  `descrição_do_item` varchar(800) NOT NULL,
  `unidade` varchar(45) NOT NULL,
  `coeficiente` varchar(45) NOT NULL,
  `valor_do_material` varchar(100) DEFAULT NULL,
  `valor_do_frete` varchar(45) DEFAULT NULL,
  `valor_da_mão_de_obra` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `FK_composição_item` int NOT NULL,
  PRIMARY KEY (`PK_item_id`),
  KEY `FK_composição_serviço_idx` (`FK_composição_item`),
  CONSTRAINT `FK_composição_item` FOREIGN KEY (`FK_composição_item`) REFERENCES `objeto__composição` (`PK_composição_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composição_preset`
--

DROP TABLE IF EXISTS `composição_preset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composição_preset` (
  `PK_composição_preset_id` int NOT NULL AUTO_INCREMENT,
  `composição` varchar(45) NOT NULL,
  `descrição` varchar(800) NOT NULL,
  `unidade` varchar(45) NOT NULL,
  PRIMARY KEY (`PK_composição_preset_id`),
  UNIQUE KEY `composição_UNIQUE` (`composição`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composição_preset__item`
--

DROP TABLE IF EXISTS `composição_preset__item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composição_preset__item` (
  `PK_item_id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `item` varchar(45) NOT NULL,
  `descrição_do_item` varchar(800) NOT NULL,
  `unidade` varchar(45) NOT NULL,
  `coeficiente` varchar(45) NOT NULL,
  `FK_composiçãoPreset_composiçãoPresetItem` int NOT NULL,
  PRIMARY KEY (`PK_item_id`),
  KEY `FK_composiçãoPreset_composiçãoPresetItem_idx` (`FK_composiçãoPreset_composiçãoPresetItem`),
  CONSTRAINT `FK_composiçãoPreset_composiçãoPresetItem` FOREIGN KEY (`FK_composiçãoPreset_composiçãoPresetItem`) REFERENCES `composição_preset` (`PK_composição_preset_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotação__material`
--

DROP TABLE IF EXISTS `cotação__material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotação__material` (
  `PK_material_Id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(45) DEFAULT NULL,
  `numero_do_fornecedor` int NOT NULL,
  `fornecedor` varchar(100) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `frete` varchar(45) DEFAULT NULL,
  `FK_cotação_material` int NOT NULL,
  PRIMARY KEY (`PK_material_Id`),
  KEY `FK_material_orçamento_idx` (`FK_cotação_material`),
  CONSTRAINT `FK_cotação_material` FOREIGN KEY (`FK_cotação_material`) REFERENCES `obra__cotação` (`PK_cotação_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotação__mão_de_obra`
--

DROP TABLE IF EXISTS `cotação__mão_de_obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotação__mão_de_obra` (
  `PK_mão_de_obra_id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(45) DEFAULT NULL,
  `numero_do_fornecedor` int NOT NULL,
  `fornecedor` varchar(100) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `frete` varchar(45) DEFAULT NULL,
  `FK_cotação_mão_de_obra` int NOT NULL,
  PRIMARY KEY (`PK_mão_de_obra_id`),
  KEY `FK_orçamento_mo_idx` (`FK_cotação_mão_de_obra`),
  CONSTRAINT `FK_cotação_mão_de_obra` FOREIGN KEY (`FK_cotação_mão_de_obra`) REFERENCES `obra__cotação` (`PK_cotação_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etapa__subetapa`
--

DROP TABLE IF EXISTS `etapa__subetapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapa__subetapa` (
  `PK_subetapa_id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(45) NOT NULL,
  `serviço` varchar(300) NOT NULL,
  `unidade` varchar(45) DEFAULT NULL,
  `quantidade` varchar(45) DEFAULT NULL,
  `valor_do_material` varchar(100) DEFAULT NULL,
  `valor_do_frete` varchar(45) DEFAULT NULL,
  `valor_da_mão_de_obra` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `FK_etapa_subetapa` int NOT NULL,
  PRIMARY KEY (`PK_subetapa_id`),
  KEY `FK_etapa_subetapa_idx` (`FK_etapa_subetapa`),
  CONSTRAINT `FK_etapa_subetapa` FOREIGN KEY (`FK_etapa_subetapa`) REFERENCES `obra__etapa` (`PK_etapa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etapa_taxa`
--

DROP TABLE IF EXISTS `etapa_taxa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapa_taxa` (
  `PK_taxa_id` int NOT NULL AUTO_INCREMENT,
  `taxa` char(45) NOT NULL,
  `FK_etapa_taxa` int NOT NULL,
  PRIMARY KEY (`PK_taxa_id`),
  KEY `FK_etapa_taxa_idx` (`FK_etapa_taxa`),
  CONSTRAINT `FK_etapa_taxa` FOREIGN KEY (`FK_etapa_taxa`) REFERENCES `obra__etapa` (`PK_etapa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `PK_fornecedor_id` int NOT NULL AUTO_INCREMENT,
  `data_de_cadastro` datetime DEFAULT NULL,
  `data_de_atualização_do_cadastro` datetime DEFAULT NULL,
  `nome_fantasia` varchar(100) NOT NULL,
  `razão_social` varchar(100) NOT NULL,
  `cnpj_cpf` varchar(45) NOT NULL,
  `inscrição` varchar(45) DEFAULT NULL,
  `rua` varchar(200) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cep` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `atividade` varchar(100) DEFAULT NULL,
  `contato` varchar(100) DEFAULT NULL,
  `função` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(45) NOT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `desconto` varchar(45) DEFAULT NULL,
  `forma_de_pagamento` varchar(150) DEFAULT NULL,
  `pagamento_recorrente` varchar(45) DEFAULT NULL,
  `pagamento_parcelado` varchar(45) DEFAULT NULL,
  `observação` varchar(200) DEFAULT NULL,
  `ativo` tinyint DEFAULT NULL,
  PRIMARY KEY (`PK_fornecedor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fornecedor__composição`
--

DROP TABLE IF EXISTS `fornecedor__composição`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor__composição` (
  `PK_composição_id` int NOT NULL AUTO_INCREMENT,
  `data_de_adicionamento` datetime NOT NULL,
  `data_de_atualização` datetime NOT NULL,
  `composição` varchar(45) DEFAULT NULL,
  `descrição` varchar(800) DEFAULT NULL,
  `unidade` varchar(20) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `FK_fornecedor_composição` int NOT NULL,
  PRIMARY KEY (`PK_composição_id`),
  KEY `FK_fornecedor_composição_idx` (`FK_fornecedor_composição`),
  CONSTRAINT `FK_fornecedor_composição` FOREIGN KEY (`FK_fornecedor_composição`) REFERENCES `fornecedor` (`PK_fornecedor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fornecedor__insumo`
--

DROP TABLE IF EXISTS `fornecedor__insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor__insumo` (
  `PK_insumo_id` int NOT NULL AUTO_INCREMENT,
  `data_de_adicionamento` datetime NOT NULL,
  `data_de_atualização` datetime NOT NULL,
  `tipo_de_insumo` varchar(45) NOT NULL,
  `insumo` char(45) NOT NULL,
  `descrição` varchar(800) NOT NULL,
  `unidade` varchar(20) NOT NULL,
  `origem_do_valor` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  `FK_fornecedor_insumo` int NOT NULL,
  PRIMARY KEY (`PK_insumo_id`),
  KEY `fornecedor_id_idx` (`FK_fornecedor_insumo`),
  CONSTRAINT `FK_fornecedor_insumo` FOREIGN KEY (`FK_fornecedor_insumo`) REFERENCES `fornecedor` (`PK_fornecedor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumo_preset`
--

DROP TABLE IF EXISTS `insumo_preset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo_preset` (
  `PK_insumo_preset_id` int NOT NULL AUTO_INCREMENT,
  `insumo` varchar(45) NOT NULL,
  `descrição` varchar(800) NOT NULL,
  `unidade` varchar(45) NOT NULL,
  `valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PK_insumo_preset_id`),
  UNIQUE KEY `insumo_UNIQUE` (`insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `material__selecionado`
--

DROP TABLE IF EXISTS `material__selecionado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material__selecionado` (
  `PK_selecionado_id` int NOT NULL AUTO_INCREMENT,
  `FK_material_selecionado` int NOT NULL,
  PRIMARY KEY (`PK_selecionado_id`),
  UNIQUE KEY `FK_material_selecionado_UNIQUE` (`FK_material_selecionado`),
  KEY `FK_material_selecionado_idx` (`FK_material_selecionado`),
  CONSTRAINT `FK_material_selecionado` FOREIGN KEY (`FK_material_selecionado`) REFERENCES `cotação__material` (`PK_material_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mão_de_obra__selecionado`
--

DROP TABLE IF EXISTS `mão_de_obra__selecionado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mão_de_obra__selecionado` (
  `PK_selecionado_id` int NOT NULL AUTO_INCREMENT,
  `FK_mão_de_obra_selecionado` int NOT NULL,
  PRIMARY KEY (`PK_selecionado_id`),
  UNIQUE KEY `FK_mão_de_obra__selecionado_UNIQUE` (`FK_mão_de_obra_selecionado`),
  KEY `FK_mão_de_obra__selecionado_idx` (`FK_mão_de_obra_selecionado`),
  CONSTRAINT `FK_mão_de_obra_selecionado` FOREIGN KEY (`FK_mão_de_obra_selecionado`) REFERENCES `cotação__mão_de_obra` (`PK_mão_de_obra_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objeto__composição`
--

DROP TABLE IF EXISTS `objeto__composição`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objeto__composição` (
  `PK_composição_id` int NOT NULL AUTO_INCREMENT,
  `composição` varchar(45) DEFAULT NULL,
  `descrição` varchar(800) DEFAULT NULL,
  `unidade` varchar(45) DEFAULT NULL,
  `valor_do_material` varchar(100) DEFAULT NULL,
  `valor_do_frete` varchar(45) DEFAULT NULL,
  `valor_da_mão_de_obra` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `FK_objeto_composição` int NOT NULL,
  PRIMARY KEY (`PK_composição_id`),
  KEY `FK_objeto_composição_idx` (`FK_objeto_composição`),
  CONSTRAINT `FK_objeto_composição` FOREIGN KEY (`FK_objeto_composição`) REFERENCES `subetapa__objeto` (`PK_objeto_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objeto__insumo`
--

DROP TABLE IF EXISTS `objeto__insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objeto__insumo` (
  `PK_insumo_id` int NOT NULL AUTO_INCREMENT,
  `insumo` varchar(45) NOT NULL,
  `descrição` varchar(800) NOT NULL,
  `unidade` varchar(45) NOT NULL,
  `valor_do_material` varchar(100) DEFAULT NULL,
  `valor_do_frete` varchar(45) DEFAULT NULL,
  `valor_da_mão_de_obra` varchar(100) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `FK_objeto_insumo` int NOT NULL,
  PRIMARY KEY (`PK_insumo_id`),
  KEY `FK_objeto_insumo_idx` (`FK_objeto_insumo`),
  CONSTRAINT `FK_objeto_insumo` FOREIGN KEY (`FK_objeto_insumo`) REFERENCES `subetapa__objeto` (`PK_objeto_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obra__cotação`
--

DROP TABLE IF EXISTS `obra__cotação`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra__cotação` (
  `PK_cotação_id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(45) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `descrição` varchar(800) NOT NULL,
  `FK_obra_cotação` int NOT NULL,
  PRIMARY KEY (`PK_cotação_id`),
  KEY `FK_obra_material_idx` (`FK_obra_cotação`),
  CONSTRAINT `FK_obra_cotação` FOREIGN KEY (`FK_obra_cotação`) REFERENCES `cliente__obra` (`PK_obra_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obra__etapa`
--

DROP TABLE IF EXISTS `obra__etapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra__etapa` (
  `PK_etapa_id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(45) NOT NULL,
  `serviço` varchar(300) NOT NULL,
  `unidade` varchar(45) DEFAULT NULL,
  `quantidade` varchar(45) DEFAULT NULL,
  `valor_do_material` varchar(100) DEFAULT NULL,
  `valor_do_frete` varchar(45) DEFAULT NULL,
  `valor_da_mão_de_obra` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `FK_obra_etapa` int NOT NULL,
  PRIMARY KEY (`PK_etapa_id`),
  KEY `projeto_id_idx` (`FK_obra_etapa`),
  CONSTRAINT `FK_obra_etapa` FOREIGN KEY (`FK_obra_etapa`) REFERENCES `cliente__obra` (`PK_obra_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serviço`
--

DROP TABLE IF EXISTS `serviço`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviço` (
  `PK_serviço_id` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `serviço` varchar(300) NOT NULL,
  PRIMARY KEY (`PK_serviço_id`),
  UNIQUE KEY `serviço_UNIQUE` (`serviço`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subetapa__objeto`
--

DROP TABLE IF EXISTS `subetapa__objeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subetapa__objeto` (
  `PK_objeto_id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(45) NOT NULL,
  `quantidade` varchar(45) DEFAULT NULL,
  `total_geral` varchar(100) DEFAULT NULL,
  `FK_subetapa_objeto` int NOT NULL,
  PRIMARY KEY (`PK_objeto_id`),
  KEY `FK_subetapa_objeto_idx` (`FK_subetapa_objeto`),
  CONSTRAINT `FK_subetapa_objeto` FOREIGN KEY (`FK_subetapa_objeto`) REFERENCES `etapa__subetapa` (`PK_subetapa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-26  6:43:05
