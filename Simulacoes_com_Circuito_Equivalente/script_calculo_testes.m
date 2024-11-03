clc; clear all; close all;

% Define os valores de resietncia e indutancia
R_est = 2.8;
X_est = 7.96;
X_mag = 273.04;
R_rot = 2.12;
X_rot = 7.96;

% Dados obtidos por simulação
G1 = [3.545173e-5, 0.017365];
L1 = [0.745444, 0.046059];
R1 = [0, 0];

% Impedancias do sistema
Z_trad = [0, 0];
Z_CPT = [0, 0];

% Calculo dos Rs por CPT
R1(1) = 1/G1(1);
R1(2) = 1/G1(2);

% Calcula a impedancia no testa a vazio 
Z_trad(1) = R_est + X_est*1i + X_mag*1i;
Z_CPT(1) = (R1(1) * L1(1)*1i * 2*pi*60)/(R1(1) + L1(1)*1i * 2*pi*60);

% Calcula a impedancia no testa de rotor bloqueado
Z_trad(2) = R_est + X_est*1i + R_rot + X_rot*1i;
Z_CPT(2) = (R1(2) * L1(2)*1i * 2*pi*60)/(R1(2) + L1(2)*1i * 2*pi*60);

% Cria uma tabela com os resultados
results_comprovacao = table(Z_trad', Z_CPT', 'VariableNames', {'Tradicional', 'CPT'});

% Exibe a tabela
disp(results_comprovacao);