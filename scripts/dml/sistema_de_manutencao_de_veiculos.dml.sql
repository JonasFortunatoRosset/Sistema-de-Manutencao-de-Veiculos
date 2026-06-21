
INSERT INTO tipos_de_pagamento (nome)
VALUES
('Dinheiro'), ('Cartão de Débito'), ('Cartão de Crédito'), ('PIX'), 
('Boleto Bancário'), ('Transferência Bancária'), ('Crediário Próprio'), ('Cheque');
GO

INSERT INTO cargos (nome)
VALUES 
('Mecânico Sênior'), ('Mecânico Pleno'), ('Eletricista Automotivo'), 
('Auxiliar de Mecânica'), ('Especialista em Geometria'), ('Alinhador'), 
('Lanterneiro'), ('Preparador de Pintura'), ('Pintor Automotivo');
GO

INSERT INTO tipo_veiculo (nome)
VALUES 
('carro'), ('moto'), ('caminhão');
GO

INSERT INTO marca_veiculo (nome)
VALUES 
('Chevrolet'), ('Honda'), ('Volkswagen'), ('Yamaha'), ('BYD'), 
('Fiat'), ('Hyundai'), ('Jeep'), ('Caoa Chery'), ('Ford'), 
('Nissan'), ('Peugeot'), ('Shineray'), ('BMW'), ('Toyota'), ('Volvo');
GO

INSERT INTO modelo_veiculo (nome)
VALUES 
('Onix'), ('CG 160 Titan'), ('Polo'), ('FZ25 Fazer'), ('Dolphin'), 
('Fastback'), ('HB20'), ('Compass'), ('XRE 300'), ('Tiggo 7 Pro Hyflux'), 
('Argo'), ('CB 300F Twister'), ('Ranger'), ('Kicks'), ('208'), 
('Worker 125'), ('iX3'), ('HR-V'), ('Corolla Altis'), ('FH 540 Globetrotter');
GO

INSERT INTO clientes(cpf, nome, telefone, email, estado, cidade, rua, numero, cep) 
VALUES
('85195374805', 'Lucas Silva', '5548934718960', 'lucas.silva@gmail.com', 'SC', 'Florianópolis', 'Avenida Beira Mar Norte', '699', '88015000'),
('90534291740', 'Maria Oliveira', '5547946708287', 'maria.oliveira@gmail.com', 'SC', 'Joinville', 'Rua Príncipe', '220', '89201001'),
('81574145630', 'Pedro Santos', '5547973445777', 'pedro.santos@gmail.com', 'SC', 'Blumenau', 'Rua XV de Novembro', '90', '89010002'),
('30814825001', 'Ana Souza', '5548973897374', 'ana.souza@gmail.com', 'SC', 'São José', 'Avenida Lédio João Martins', '87', '88101100'),
('69545781939', 'Carlos Lima', '5549988299980', 'carlos.lima@gmail.com', 'SC', 'Chapecó', 'Avenida Getúlio Vargas', '1393', '89801001'),
('99727671918', 'Julia Pereira', '5548995763193', 'julia.pereira@gmail.com', 'SC', 'Florianópolis', 'Avenida Beira Mar Norte', '91', '88015000'),
('18718026524', 'Bruno Costa', '5548933063376', 'bruno.costa@gmail.com', 'SC', 'Palhoça', 'Avenida Barão do Rio Branco', '886', '88130101'),
('17940050303', 'Camila Rodrigues', '5547979003738', 'camila.rodrigues@gmail.com', 'SC', 'Balneário Camboriú', 'Avenida Atlântica', '230', '88330009'),
('49169393443', 'Diego Almeida', '5547988793749', 'diego.almeida@gmail.com', 'SC', 'Itajaí', 'Rua Hercílio Luz', '1473', '88301001'),
('22753298114', 'Amanda Ribeiro', '5548924914617', 'amanda.ribeiro@gmail.com', 'SC', 'Criciúma', 'Avenida Centenário', '653', '88801000'),
('12338956712', 'João Pedro Lima', '5547945673214', 'joaolima@gmail.com', 'SC', 'Joinville', 'Rua das Palmeiras', '330', '89201110');
GO

INSERT INTO colaboradores(nome, cpf, estado, cidade, rua, numero, cep, complemento, salario, status, dt_cadastro, dt_demissao, cargo_id)
VALUES
('Ricardo Mendes', '40285136890', 'SC', 'Criciúma', 'Rua Coronel Pedro Benedet', '1200', '88801-250', NULL, 4500.00, 1, '2022-05-15 08:00:00.00', NULL, 1),
('André Santos', '21596473852', 'SC', 'Içara', 'Rua Altamiro Guimarães', '450', '88820-000', NULL, 3500.00, 1, '2022-09-28 09:15:00.00', NULL, 2),
('Marcos Oliveira', '10938475821', 'SC', 'Forquilhinha', 'Avenida Professor Eurico Back', '2500', '88850-000', NULL, 3800.00, 1, '2023-04-14 07:30:00.00', NULL, 3),
('Lucas Ferreira', '32481596847', 'SC', 'Criciúma', 'Rua Henrique Lage', '1100', '88801-010', NULL, 2000.00, 0, '2023-05-05 10:00:00.00', '2024-12-20 17:00:00.00', 4),
('Thiago Silva', '85214796830', 'SC', 'Nova Veneza', 'Rua Dos Imigrantes', '850', '88865-000', NULL, 4000.00, 1, '2024-06-29 08:00:00.00', NULL, 5),
('Felipe Albuquerque', '96325814875', 'SC', 'Siderópolis', 'Avenida Presidente Dutra', '2000', '88860-000', NULL, 4500.00, 1, '2026-05-28 07:45:00.00', NULL, 1),
('Roberto Antunes', '14725836814', 'SC', 'Criciúma', 'Rua Desembargador Pedro Silva', '312', '88802-100', NULL, 4500.00, 1, '2022-06-10 08:30:00.00', NULL, 1),
('Marcelo Vieira', '36925814825', 'SC', 'Maracajá', 'Avenida Nossa Senhora da Conceição', '745', '88915-000', NULL, 3200.00, 1, '2022-06-15 09:00:00.00', NULL, 6),
('Rodrigo Souza', '25814736836', 'SC', 'Içara', 'Rua Vitória', '110', '88820-000', NULL, 3500.00, 0, '2022-07-01 07:45:00.00', '2023-11-30 18:00:00.00', 7),
('Alexandre Costa', '78945612801', 'SC', 'Criciúma', 'Rua Felipe Schmidt', '2300', '88801-240', NULL, 3500.00, 1, '2023-08-10 08:00:00.00', NULL, 2),
('Gabriel Lima', '45612378859', 'SC', 'Forquilhinha', 'Rua Josefina Lodetti Back', '54', '88850-000', NULL, 2000.00, 1, '2023-10-30 10:30:00.00', NULL, 4),
('Fabio Junior', '12378945868', 'SC', 'Criciúma', 'Rua Conselheiro João Zanette', '900', '88801-130', NULL, 3800.00, 1, '2023-11-01 07:30:00.00', NULL, 3),
('Carlos Eduardo', '98765432822', 'SC', 'Nova Veneza', 'Rua Alfredo Pessi', '1500', '88865-000', NULL, 4500.00, 1, '2024-01-10 08:00:00.00', NULL, 1),
('Daniel Rezende', '15975348863', 'SC', 'Siderópolis', 'Rua Diomício Freitas', '820', '88860-000', NULL, 3000.00, 0, '2024-03-12 08:15:00.00', '2025-05-10 17:30:00.00', 8),
('Gustavo Borges', '75395146841', 'SC', 'Criciúma', 'Rua Giacomo Sônego', '1200', '88801-440', NULL, 3500.00, 1, '2024-03-15 08:00:00.00', NULL, 9),
('Leonardo Mello', '85296374852', 'SC', 'Içara', 'Rua João Menegaro', '410', '88820-000', NULL, 3500.00, 1, '2024-07-01 08:45:00.00', NULL, 2),
('Vinicius Prates', '96385274880', 'SC', 'Criciúma', 'Rua Lauro Müller', '630', '88801-410', NULL, 2000.00, 1, '2024-12-01 08:00:00.00', NULL, 4),
('Murilo Henrique', '14736925899', 'SC', 'Maracajá', 'Rua Pedro João de Souza', '1400', '88915-000', NULL, 4500.00, 1, '2025-01-15 07:50:00.00', NULL, 1),
('Douglas Neves', '36914725800', 'SC', 'Forquilhinha', 'Rua Gabriel Eyng', '320', '88850-000', NULL, 3200.00, 1, '2025-04-01 08:00:00.00', NULL, 6),
('Arthur Zanetti', '25836914811', 'SC', 'Criciúma', 'Rua Hercílio Luz', '1800', '88801-020', NULL, 2000.00, 1, '2026-05-25 08:00:00.00', NULL, 4);
GO

INSERT INTO veiculos(placa, ano, tp_combustivel, cliente_id, tipo_veiculo_id, marca_veiculo_id, modelo_veiculo_id)
VALUES
('BRA1A12', 2022, 'gasolina', 1,  1, 1,  1),   
('KRM4E45', 2021, 'gasolina', 1,  2, 2,  2),   
('RIO2B34', 2023, 'gasolina', 2,  1, 3,  3),   
('NXT5F67', 2022, 'gasolina', 2,  2, 4,  4),   
('MCO9H12', 2024, 'elétrico', 2,  1, 5,  5),   
('BHZ3C56', 2023, 'gasolina', 3,  1, 6,  6),   
('POA4D78', 2021, 'gasolina', 4,  1, 7,  7),   
('CWB5E90', 2022, 'diesel',   5,  1, 8,  8),   
('ZXC8M45', 2019, 'gasolina', 5,  2, 2,  9),   
('XSE4P12', 2023, 'híbrido',  6,  1, 9,  10),  
('SSA7G34', 2022, 'gasolina', 7,  1, 6,  11),  
('POI2Q34', 2023, 'gasolina', 7,  2, 2,  12),  
('MKJ5R56', 2022, 'diesel',   7,  1, 10, 13),  
('FOR8H56', 2021, 'gasolina', 8,  1, 11, 14),  
('REC9I78', 2023, 'gasolina', 9,  1, 12, 15),  
('REW3U12', 2021, 'gasolina', 9,  2, 13, 16),  
('VBH6V34', 2024, 'elétrico', 9,  1, 14, 17),  
('GYN0J90', 2023, 'gasolina', 10, 1, 2,  18),  
('WSX5X78', 2023, 'diesel',   10, 3, 16, 20);  
GO

INSERT INTO ordem_de_servico(odometro, dt_inicio, dt_fim, veiculo_id, status)
VALUES
(12500, '2023-05-10', '2023-05-12', 1, 1),
(28400, '2024-11-15', '2024-11-16', 1, 1),
(18200, '2023-08-20', '2023-08-22', 2, 1),
(35100, '2025-02-10', '2025-02-11', 2, 1),
(3400,  '2024-07-05', '2024-07-05', 3, 1),
(15200, '2025-06-01', '2025-06-03', 3, 1),
(8900,  '2024-01-15', '2024-01-16', 4, 1),
(22100, '2025-01-20', '2025-01-22', 4, 1),
(14300, '2023-11-10', '2023-11-12', 5, 1),
(31200, '2025-04-05', '2025-04-07', 5, 1),
(42000, '2022-09-14', '2022-09-15', 6, 1),
(68500, '2024-10-22', '2024-10-24', 6, 1),
(5200,  '2024-03-18', '2024-03-19', 7, 1),
(19800, '2025-05-12', '2025-05-13', 7, 1),
(33100, '2022-07-08', '2022-07-10', 8, 1),
(64200, '2024-05-19', '2024-05-21', 8, 1),
(11500, '2022-10-05', '2022-10-06', 9, 1),
(24300, '2024-08-11', '2024-08-12', 10, 1),
(48900, '2023-04-20', '2023-04-22', 11, 1),
(8500,  '2024-12-01', '2024-12-02', 12, 1),
(18200, '2026-06-03', NULL, 13, 0), 
(32400, '2026-06-04', NULL, 14, 0), 
(51300, '2026-06-05', NULL, 15, 0), 
(9400,  '2026-06-05', NULL, 16, 0), 
(14100, '2026-06-06', NULL, 17, 0), 
(6100,  '2026-06-06', NULL, 18, 0), 
(22900, '2026-06-07', NULL, 19, 0); 
GO

INSERT INTO colaboradores_os(colaboradores_id, ordem_de_servico_id)
VALUES
(1, 1), (1, 2), (4, 2), (2, 3), (3, 3), (10, 4), (5, 4), (13, 5), (16, 6), (19, 6),
(2, 7), (10, 8), (17, 8), (9, 9), (15, 9), (7, 10), (1, 11), (8, 11), (7, 12), (11, 12),
(12, 12), (2, 13), (13, 14), (8, 15), (5, 16), (11, 16), (2, 17), (10, 18), (3, 19), (16, 20),
(6, 21), (20, 21), (12, 22), (18, 23), (17, 23), (19, 23), (7, 24), (5, 25), (15, 25), (10, 26),
(6, 27);
GO

INSERT INTO pecas (nome, preco, quantidade, dt_compra) 
VALUES  
('Pastilha de Freio Cerâmica Dianteira', 349.90, 15, '2026-05-10'),
('Amortecedor Pressurizado Turbogás Dianteiro', 620.00, 8,  '2026-05-12'),
('Kit Transmissão Completo (Corrente/Coroa/Pinhão) - Moto', 180.00, 25, '2026-05-14'),
('Filtro de Óleo do Motor Linha Leve', 95.00,  40, '2026-05-14'),
('Bico Injetor Multiponto Flex', 189.50, 25, '2026-05-15'),
('Sensor de Fluxo de Ar (MAF)', 299.00, 10, '2026-05-16'),
('Jogo de Pistões do Motor com Anéis Std', 890.00, 5,  '2026-05-18'),
('Kit de Bielas Forjadas de Alta Performance', 540.00, 6,  '2026-05-18'),
('Rolamento de Roda Traseira Blindado', 120.00, 40, '2026-05-20'),
('Retentor de Vedação do Virabrequim', 45.00,  60, '2026-05-20'),
('Alternador de Ignição 90A', 420.00, 7,  '2026-05-22'),
('Bobina de Ignição Eletrônica', 180.00, 20, '2026-05-22'),
('Radiador de Água do Motor Brasado', 380.00, 10, '2026-05-25'),
('Válvula Termostática de Arrefecimento', 85.00,  30, '2026-05-25'),
('Abafador de Escapamento Silencioso Traseiro', 310.00, 14, '2026-05-28'),
('Bucha de Poliuretano da Balança Dianteira', 150.00, 22, '2026-05-28'),
('Kit de Embreagem Completo (Platô/Disco/Rolamento)', 750.00, 6,  '2026-06-01'),
('Cabo de Acionamento da Embreagem', 195.00, 15, '2026-06-01'),
('Lanterna Traseira Acrílica Lado Direito', 280.00, 8,  '2026-06-04'),
('Parachoque Dianteiro com Furo para Milha', 410.00, 4,  '2026-06-05');
GO

INSERT INTO servicos (nome, preco) VALUES  
('Substituição de Pastilhas e Discos de Freio', 120.00),
('Troca de Amortecedores e Molas Dianteiras', 280.00),
('Substituição de Kit Transmissão (Relação) de Moto', 90.00),
('Revisão Geral de Moto com Troca de Filtros e Óleo', 150.00),
('Limpeza e Diagnóstico de Bicos Injetores', 180.00),
('Mapeamento e Diagnóstico de Sensores de Injeção', 150.00),
('Retífica Completa do Bloco do Motor', 2200.00),
('Substituição de Pistões, Bielas e Anéis do Motor', 1200.00),
('Troca de Rolamento de Roda e Cubo', 130.00),
('Substituição de Retentores e Vedação do Motor', 350.00),
('Manutenção e Troca de Alternador', 190.00),
('Diagnóstico de Sistema de Ignição e Bobinas', 90.00),
('Limpeza de Sistema de Arrefecimento e Troca de Radiador', 250.00),
('Substituição de Abafador e Tubulação de Escapamento', 120.00),
('Substituição de Kit de Embreagem Completo', 450.00);
GO

INSERT INTO itens_inventario (nome, descricao, status, dt_compra, dt_baixa) 
VALUES  
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

INSERT INTO servicos_os (descricao, preco_servico, servicos_id, ordem_de_servico_id) 
VALUES  
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

INSERT INTO servicos_os_pecas(quantidade, preco_venda, servicos_os_id, pecas_id) 
VALUES  
(1, 410.00, 1, 1), (2, 720.00, 2, 2), (1, 120.00, 3, 4), (1, 410.00, 4, 1), (4, 220.00, 6, 5),
(1, 350.00, 7, 6), (1, 990.00, 8, 7), (1, 620.00, 8, 8), (1, 65.00, 9, 10), (1, 150.00, 10, 9),
(1, 490.00, 11, 11), (1, 210.00, 12, 12), (1, 440.00, 13, 13), (1, 110.00, 13, 14), (1, 380.00, 14, 15),
(1, 890.00, 15, 17), (1, 240.00, 15, 18), (1, 220.00, 16, 3), (1, 120.00, 17, 4), (1, 150.00, 21, 9),
(1, 490.00, 23, 11), (2, 210.00, 24, 12), (1, 440.00, 25, 13), (1, 380.00, 26, 15), (1, 890.00, 27, 17);
GO

INSERT INTO faturas (ordem_de_servico_id, tipo_de_pagamento_id)
VALUES 
(1, 4), (2, 3), (3, 1), (4, 2), (5, 4), (6, 3), (7, 1), (8, 4), (9, 2), (10, 3),
(11, 1), (12, 4), (13, 2), (14, 3), (15, 4), (16, 1), (17, 3), (18, 4), (19, 2), (20, 1);
GO