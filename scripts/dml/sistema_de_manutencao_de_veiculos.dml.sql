INSERT INTO clientes(cpf, nome, telefone, email, estado, cidade, rua, numero, cep) 
VALUES
('85195374805', 'Lucas Silva', '5511934718960', 'lucas.silva@gmail.com', 'SP', 'São Paulo', 'Avenida Paulista', '699', '01311200'),
('90534291740', 'Maria Oliveira', '5521946708287', 'maria.oliveira@gmail.com', 'RJ', 'Rio de Janeiro', 'Avenida Atlântica', '220', '22021001'),
('81574145630', 'Pedro Santos', '5531973445777', 'pedro.santos@gmail.com', 'MG', 'Belo Horizonte', 'Avenida Afonso Pena', '90', '30130002'),
('30814825001', 'Ana Souza', '5551973897374', 'ana.souza@gmail.com', 'RS', 'Porto Alegre', 'Avenida Borges de Medeiros', '87', '90020021'),
('69545781939', 'Carlos Lima', '5541988299980', 'carlos.lima@gmail.com', 'PR', 'Curitiba', 'Rua XV de Novembro', '1393', '80020310'),
('99727671918', 'Julia Pereira', '5548995763193', 'julia.pereira@gmail.com', 'SC', 'Florianópolis', 'Avenida Beira Mar Norte', '91', '88015000'),
('18718026524', 'Bruno Costa', '5571933063376', 'bruno.costa@gmail.com', 'BA', 'Salvador', 'Avenida Sete de Setembro', '886', '40060001'),
('17940050303', 'Camila Rodrigues', '5585979003738', 'camila.rodrigues@gmail.com', 'CE', 'Fortaleza', 'Avenida Beira Mar', '230', '60165121'),
('49169393443', 'Diego Almeida', '5581988793749', 'diego.almeida@gmail.com', 'PE', 'Recife', 'Avenida Boa Viagem', '1473', '51011000'),
('22753298114', 'Amanda Ribeiro', '5562924914617', 'amanda.ribeiro@gmail.com', 'GO', 'Goiânia', 'Avenida Goiás', '653', '74010010'),
('12338956712', 'João Pedro Lima', '5548945673214', 'joaolima@gmail.com', 'RJ', 'Niterói', 'Rua Moreira César', '330', ' 24230050');
GO

INSERT INTO colaboradores(nome, cpf, funcao, estado, cidade, rua, numero, cep, status, dt_cadastro, dt_demissao)
VALUES
('Ricardo Mendes', '40285136890', 'Mecânico Sênior', 'SP', 'São Paulo', 'Rua Augusta', '1200', '01304-001', 1, '2022-05-15 08:00:00.00', NULL),
('André Santos', '21596473852', 'Mecânico Pleno', 'SP', 'São Paulo', 'Alameda Santos', '450', '01419-000', 1, '2022-09-28 09:15:00.00', NULL),
('Marcos Oliveira', '10938475821', 'Eletricista Automotivo', 'SP', 'São Paulo', 'Rua Vergueiro', '2500', '04102-000', 1, '2023-04-14 07:30:00.00', NULL),
('Lucas Ferreira', '32481596847', 'Auxiliar de Mecânica', 'SP', 'São Paulo', 'Avenida Jabaquara', '1100', '04045-001', 0, '2023-05-05 10:00:00.00', '2024-12-20 17:00:00.00'),
('Thiago Silva', '85214796830', 'Especialista em Geometria', 'SP', 'São Paulo', 'Rua Domingos de Morais', '850', '04010-100', 1, '2024-06-29 08:00:00.00', NULL),
('Felipe Albuquerque', '96325814875', 'Mecânico Sênior', 'SP', 'São Paulo', 'Avenida Paulista', '2000', '01310-300', 1, '2026-05-28 07:45:00.00', NULL),
('Roberto Antunes', '14725836814', 'Mecânico Sênior', 'SP', 'São Paulo', 'Rua Pamplona', '312', '01405-000', 1, '2022-06-10 08:30:00.00', NULL),
('Marcelo Vieira', '36925814825', 'Alinhador', 'SP', 'São Paulo', 'Rua Bela Cintra', '745', '01415-000', 1, '2022-06-15 09:00:00.00', NULL),
('Rodrigo Souza', '25814736836', 'Lanterneiro', 'SP', 'São Paulo', 'Rua Haddock Lobo', '110', '01414-001', 0, '2022-07-01 07:45:00.00', '2023-11-30 18:00:00.00'),
('Alexandre Costa', '78945612801', 'Mecânico Pleno', 'SP', 'São Paulo', 'Avenida Brig. Luís Antônio', '2300', '01318-002', 1, '2023-08-10 08:00:00.00', NULL),
('Gabriel Lima', '45612378859', 'Auxiliar de Mecânica', 'SP', 'São Paulo', 'Rua Conselheiro Ramalho', '54', '01325-000', 1, '2023-10-30 10:30:00.00', NULL),
('Fabio Junior', '12378945868', 'Eletricista Automotivo', 'SP', 'São Paulo', 'Rua Frei Caneca', '900', '01307-001', 1, '2023-11-01 07:30:00.00', NULL),
('Carlos Eduardo', '98765432822', 'Mecânico Sênior', 'SP', 'São Paulo', 'Avenida Rebouças', '1500', '05402-200', 1, '2024-01-10 08:00:00.00', NULL),
('Daniel Rezende', '15975348863', 'Preparador de Pintura', 'SP', 'São Paulo', 'Rua Teodoro Sampaio', '820', '05406-000', 0, '2024-03-12 08:15:00.00', '2025-05-10 17:30:00.00'),
('Gustavo Borges', '75395146841', 'Pintor Automotivo', 'SP', 'São Paulo', 'Rua Cardeal Arcoverde', '1200', '05408-001', 1, '2024-03-15 08:00:00.00', NULL),
('Leonardo Mello', '85296374852', 'Mecânico Pleno', 'SP', 'São Paulo', 'Rua Fradique Coutinho', '410', '05416-000', 1, '2024-07-01 08:45:00.00', NULL),
('Vinicius Prates', '96385274880', 'Auxiliar de Mecânica', 'SP', 'São Paulo', 'Rua Mourato Coelho', '630', '05417-001', 1, '2024-12-01 08:00:00.00', NULL),
('Murilo Henrique', '14736925899', 'Mecânico Sênior', 'SP', 'São Paulo', 'Rua Clélia', '1400', '05042-000', 1, '2025-01-15 07:50:00.00', NULL),
('Douglas Neves', '36914725800', 'Alinhador', 'SP', 'São Paulo', 'Rua Guaicurus', '320', '05033-001', 1, '2025-04-01 08:00:00.00', NULL),
('Arthur Zanetti', '25836914811', 'Auxiliar de Mecânica', 'SP', 'São Paulo', 'Avenida São João', '1800', '01211-000', 1, '2026-05-25 08:00:00.00', NULL);
GO

INSERT INTO veiculos(placa, tp_veiculo, marca, modelo, ano, tp_combustivel, cliente_id)
VALUES
('BRA1A12', 'carro', 'Chevrolet', 'Onix', 2022, 'gasolina', 1),
('KRM4E45', 'moto', 'Honda', 'CG 160 Titan', 2021, 'gasolina', 1),
('RIO2B34', 'carro', 'Volkswagen', 'Polo', 2023, 'gasolina', 2),
('NXT5F67', 'moto', 'Yamaha', 'FZ25 Fazer', 2022, 'gasolina', 2),
('MCO9H12', 'carro', 'BYD', 'Dolphin', 2024, 'elétrico', 2),
('BHZ3C56', 'carro', 'Fiat', 'Fastback', 2023, 'gasolina', 3),
('POA4D78', 'carro', 'Hyundai', 'HB20', 2021, 'gasolina', 4),
('CWB5E90', 'carro', 'Jeep', 'Compass', 2022, 'diesel', 5),
('ZXC8M45', 'moto', 'Honda', 'XRE 300', 2019, 'gasolina', 5),
('XSE4P12', 'carro', 'Caoa Chery', 'Tiggo 7 Pro Hyflux', 2023, 'híbrido', 6),
('SSA7G34', 'carro', 'Fiat', 'Argo', 2022, 'gasolina', 7),
('POI2Q34', 'moto', 'Honda', 'CB 300F Twister', 2023, 'gasolina', 7),
('MKJ5R56', 'carro', 'Ford', 'Ranger', 2022, 'diesel', 7),
('FOR8H56', 'carro', 'Nissan', 'Kicks', 2021, 'gasolina', 8),
('REC9I78', 'carro', 'Peugeot', '208', 2023, 'gasolina', 9),
('REW3U12', 'moto', 'Shineray', 'Worker 125', 2021, 'gasolina', 9),
('VBH6V34', 'carro', 'BMW', 'iX3', 2024, 'elétrico', 9),
('GYN0J90', 'carro', 'Honda', 'HR-V', 2023, 'gasolina', 10),
('WSX5X78', 'carro', 'Toyota', 'Corolla Altis', 2023, 'híbrido', 10);
GO

INSERT INTO ordem_de_servico(odometro, dt_inicio, dt_fim, veiculo_id)
VALUES
(12500, '2023-05-10', '2023-05-12', 1),
(28400, '2024-11-15', '2024-11-16', 1),
(18200, '2023-08-20', '2023-08-22', 2),
(35100, '2025-02-10', '2025-02-11', 2),
(3400,  '2024-07-05', '2024-07-05', 3),
(15200, '2025-06-01', '2025-06-03', 3),
(8900,  '2024-01-15', '2024-01-16', 4),
(22100, '2025-01-20', '2025-01-22', 4),
(14300, '2023-11-10', '2023-11-12', 5),
(31200, '2025-04-05', '2025-04-07', 5),
(42000, '2022-09-14', '2022-09-15', 6),
(68500, '2024-10-22', '2024-10-24', 6),
(5200,  '2024-03-18', '2024-03-19', 7),
(19800, '2025-05-12', '2025-05-13', 7),
(33100, '2022-07-08', '2022-07-10', 8),
(64200, '2024-05-19', '2024-05-21', 8),
(11500, '2022-10-05', '2022-10-06', 9),
(24300, '2024-08-11', '2024-08-12', 10),
(48900, '2023-04-20', '2023-04-22', 11),
(8500,  '2024-12-01', '2024-12-02', 12),
(18200, '2026-06-03', NULL, 13),
(32400, '2026-06-04', NULL, 14),
(51300, '2026-06-05', NULL, 15),
(9400,  '2026-06-05', NULL, 16),
(14100, '2026-06-06', NULL, 17),
(6100,  '2026-06-06', NULL, 18),
(22900, '2026-06-07', NULL, 19);
GO

INSERT INTO colaboradores_os(colaboradores_id, ordem_de_servico_id)
VALUES
(1, 1),
(1, 2),
(4, 2),
(2, 3),
(3, 3),
(10, 4),
(5, 4),
(13, 5),
(16, 6),
(19, 6),
(2, 7),
(10, 8),
(17, 8),
(9, 9),
(15, 9),
(7, 10),
(1, 11),
(8, 11),
(7, 12),
(11, 12),
(12, 12),
(2, 13),
(13, 14),
(8, 15),
(5, 16),
(11, 16),
(2, 17),
(10, 18),
(3, 19),
(16, 20),
(6, 21),
(20, 21),
(12, 22),
(18, 23),
(17, 23),
(19, 23),
(7, 24),
(5, 25),
(15, 25),
(10, 26),
(6, 27);
GO

INSERT INTO fornecedores(
    cnpj, nome, estado, cidade, rua, numero, cep, complemento, status
) VALUES 
('12345678000195', 'Freios e Amortecedores Líder Ltda', 'SP', 'São Paulo', 'Avenida Paulista', '1000', '01311-100', 'Andar 4 Sala 42', 1),
('98765432000110', 'Sul Motores e Motopeças Distribuidora', 'RS', 'Porto Alegre', 'Rua dos Andradas', '500', '90020-002', 'Galpão B', 2),
('45678912000130', 'TecnoInjeção Distribuidora de Autopeças', 'RJ', 'Rio de Janeiro', 'Avenida Rio Branco', '123', '20040-001', 'Bloco A', 1),
('11223344000155', 'Metalúrgica Central de Pistões e Bielas', 'MG', 'Belo Horizonte', 'Avenida Afonso Pena', '2500', '30130-009', 'Sala 101', 1),
('55667788000122', 'Paraná Rolamentos e Retentores', 'PR', 'Curitiba', 'Rua XV de Novembro', '850', '80020-310', 'Fundos', 0),
('99887766000144', 'EletroPartes Componentes Elétricos', 'SC', 'Blumenau', 'Rua XV de Novembro', '1200', '89010-002', 'Portão 3', 2),
('33445566000188', 'Atacadista Norte de Radiadores e Arrefecimento', 'PA', 'Belém', 'Avenida Presidente Vargas', '450', '66017-000', 'Loja 02', 1),
('22334455000177', 'Brisa Escapamentos e Suspensões', 'BA', 'Salvador', 'Avenida Sete de Setembro', '3100', '40060-001', 'Térreo', 1),
('77889900000111', 'Goiás Embreagens e Transmissões', 'GO', 'Goiânia', 'Avenida Anhanguera', '5500', '74043-012', 'Quadra 12 Lote 5', 1),
('88990011000133', 'Distrito Lanternas e Latarias S.A.', 'DF', 'Brasília', 'Setor Comercial Sul', 'Q 4', '70304-000', 'Bloco A Loja 15', 1);
GO

INSERT INTO pecas (
    nome, preco, quantidade, dt_compra, fornecedores_id
) VALUES 
('Pastilha de Freio Cerâmica Dianteira', 349.90, 15, '2026-05-10', 1),
('Amortecedor Pressurizado Turbogás Dianteiro', 620.00, 8,  '2026-05-12', 1),
('Kit Transmissão Completo (Corrente/Coroa/Pinhão) - Moto', 180.00, 25, '2026-05-14', 2),
('Filtro de Óleo do Motor Linha Leve', 95.00,  40, '2026-05-14', 2),
('Bico Injetor Multiponto Flex', 189.50, 25, '2026-05-15', 3),
('Sensor de Fluxo de Ar (MAF)', 299.00, 10, '2026-05-16', 3),
('Jogo de Pistões do Motor com Anéis Std', 890.00, 5,  '2026-05-18', 4),
('Kit de Bielas Forjadas de Alta Performance', 540.00, 6,  '2026-05-18', 4),
('Rolamento de Roda Traseira Blindado', 120.00, 40, '2026-05-20', 5),
('Retentor de Vedação do Virabrequim', 45.00,  60, '2026-05-20', 5),
('Alternador de Ignição 90A', 420.00, 7,  '2026-05-22', 6),
('Bobina de Ignição Eletrônica', 180.00, 20, '2026-05-22', 6),
('Radiador de Água do Motor Brasado', 380.00, 10, '2026-05-25', 7),
('Válvula Termostática de Arrefecimento', 85.00,  30, '2026-05-25', 7),
('Abafador de Escapamento Silencioso Traseiro', 310.00, 14, '2026-05-28', 8),
('Bucha de Poliuretano da Balança Dianteira', 150.00, 22, '2026-05-28', 8),
('Kit de Embreagem Completo (Platô/Disco/Rolamento)', 750.00, 6,  '2026-06-01', 9),
('Cabo de Acionamento da Embreagem', 195.00, 15, '2026-06-01', 9),
('Lanterna Traseira Acrílica Lado Direito', 280.00, 8,  '2026-06-04', 10),
('Parachoque Dianteiro com Furo para Milha', 410.00, 4,  '2026-06-05', 10);
GO

INSERT INTO servicos (nome) VALUES 
('Substituição de Pastilhas e Discos de Freio'),
('Troca de Amortecedores e Molas Dianteiras'),
('Substituição de Kit Transmissão (Relação) de Moto'),
('Revisão Geral de Moto com Troca de Filtros e Óleo'),
('Limpeza e Diagnóstico de Bicos Injetores'),
('Mapeamento e Diagnóstico de Sensores de Injeção'),
('Retífica Completa do Bloco do Motor'),
('Substituição de Pistões, Bielas e Anéis do Motor'),
('Troca de Rolamento de Roda e Cubo'),
('Substituição de Retentores e Vedação do Motor'),
('Manutenção e Troca de Alternador'),
('Diagnóstico de Sistema de Ignição e Bobinas'),
('Limpeza de Sistema de Arrefecimento e Troca de Radiador'),
('Substituição de Abafador e Tubulação de Escapamento'),
('Substituição de Kit de Embreagem Completo');
GO

INSERT INTO itens_inventario (
    nome, descricao, status, dt_compra, dt_baixa
) VALUES 
('Elevador Automotivo Hidráulico 4T', 'Elevador trifásico para carros e SUVs até 4 toneladas', 1, '2012-03-15', NULL),
('Elevador Hidráulico para Motos', 'Plataforma pneumática/hidráulica para manutenção de motocicletas', 1, '2014-06-20', NULL),
('Scanner de Diagnóstico Automotivo OBD2', 'Scanner antigo com atualização de software via cabo - Descontinuado', 0, '2011-02-10', '2019-11-30'),
('Jogo de Chaves de Impacto Pneumática', 'Chave de impacto de 1/2 polegada com jogo de soquetes de cromo vanádio', 1, '2015-08-05', NULL),
('Torquímetro de Estalo 1/2', 'Torquímetro de precisão para aperto de cabeçotes e rodas (40-210 Nm)', 1, '2016-04-12', NULL),
('Compressor de Ar Direto 20 PCM', 'Compressor de ar com reservatório de 200 litros para ferramentas pneumáticas', 1, '2012-03-22', NULL),
('Carregador e Auxiliar de Partida 12V/24V', 'Equipamento para carga rápida de baterias e auxílio de partida', 1, '2013-09-18', NULL),
('Analisador de Gases de Escapamento', 'Equipamento para teste de emissões de motores a combustão', 1, '2017-07-02', NULL),
('Mesa de Trabalho com Morsa de Bancada', 'Bancada de aço reforçada com morsa articulada de 6 polegadas', 1, '2012-01-20', NULL),
('Carrinho de Ferramentas Completo', 'Carrinho organizador com 7 gavetas contendo chaves fixas, combinadas e fendas', 1, '2015-02-10', NULL);
GO

INSERT INTO servicos_os (
    descricao, preco, servicos_id, ordem_de_servico_id
) VALUES 
('Substituição de pastilhas de freio dianteiras', 120.00, 1, 1),
('Troca de amortecedores dianteiros e batentes', 280.00, 2, 2),
('Troca de óleo do motor e filtro de combustível', 80.00, 4, 3),
('Substituição de pastilhas traseiras', 110.00, 1, 4),
('Revisão geral e troca de fluido de freio', 150.00, 4, 5),
('Limpeza de bicos injetores via ultrassom', 180.00, 5, 6),
('Troca do sensor MAF e varredura de erros', 120.00, 6, 7),
('Substituição de pistões e anéis do bloco', 1200.00, 8, 8),
('Retífica completa do bloco do motor', 2200.00, 7, 8),
('Substituição de retentor do virabrequim', 350.00, 10, 9),
('Troca de rolamento de roda dianteira esquerda', 130.00, 9, 10),
('Manutenção preventiva no alternador', 190.00, 11, 11),
('Substituição de bobina de ignição falhando', 90.00, 12, 12),
('Limpeza de arrefecimento e troca de radiador', 250.00, 13, 13),
('Substituição de abafador de escapamento', 120.00, 14, 14),
('Instalação de kit de embreagem completo', 450.00, 15, 15),
('Troca de kit transmissão/relação de moto', 90.00, 3, 16),
('Revisão de moto e regulagem de válvulas', 200.00, 4, 17),
('Substituição de pastilha de freio', 120.00, 1, 18),
('Troca de amortecedor pressurizado', 280.00, 2, 18),
('Mapeamento e diagnóstico de sensores', 150.00, 6, 19),
('Limpeza de bicos injetores e troca de filtros', 180.00, 5, 20),
('Troca de rolamento de cubo traseiro', 140.00, 9, 21),
('Substituição de retentores de válvulas', 400.00, 10, 22),
('Troca de alternador avariado', 220.00, 11, 23),
('Substituição de bobinas de ignição', 90.00, 12, 24),
('Substituição de radiador com vazamento', 250.00, 13, 25),
('Troca de abafador esportivo', 130.00, 14, 26),
('Troca de embreagem e atuador hidráulico', 500.00, 15, 27),
('Retífica de cabeçote por superaquecimento', 1800.00, 7, 5),
('Substituição de bielas e bronzinas', 950.00, 8, 12),
('Diagnóstico elétrico de ignição', 100.00, 12, 3),
('Troca de rolamento de roda oposta', 130.00, 9, 10),
('Substituição de pastilhas de freio cerâmica', 140.00, 1, 15),
('Substituição de amortecedores traseiros', 260.00, 2, 15),
('Limpeza de bicos complementares', 180.00, 5, 22),
('Troca de óleo de bengala e retentores', 150.00, 10, 16),
('Remapeamento de injeção eletrônica', 300.00, 6, 17),
('Substituição de catalisador e escapamento', 200.00, 14, 2),
('Revisão do sistema elétrico do alternador', 190.00, 11, 24);
GO

INSERT INTO servicos_os_pecas(
    quantidade, preco_venda, servicos_os_id, pecas_id
) VALUES 
(1, 410.00, 1, 1),
(2, 720.00, 2, 2),
(1, 120.00, 3, 4),
(1, 410.00, 4, 1),
(4, 220.00, 6, 5),
(1, 350.00, 7, 6),
(1, 990.00, 8, 7),
(1, 620.00, 8, 8),
(1, 65.00, 9, 10),
(1, 150.00, 10, 9),
(1, 490.00, 11, 11),
(1, 210.00, 12, 12),
(1, 440.00, 13, 13),
(1, 110.00, 13, 14),
(1, 380.00, 14, 15),
(1, 890.00, 15, 17),
(1, 240.00, 15, 18),
(1, 220.00, 16, 3),
(1, 120.00, 17, 4),
(1, 150.00, 21, 9),
(1, 490.00, 23, 11),
(2, 210.00, 24, 12),
(1, 440.00, 25, 13),
(1, 380.00, 26, 15),
(1, 890.00, 27, 17);
GO
