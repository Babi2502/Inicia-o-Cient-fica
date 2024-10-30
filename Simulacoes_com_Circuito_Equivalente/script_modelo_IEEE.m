clc; clear all; close all;

% Carrega o modelo Simulink
mode = 'simulacao_modelo_IEEE';
load_system(mode);

% Define os valores de resietncia e indutancia
R_est = 2.8;
X_est = 7.96;
X_mag = 273.04;
R_rot = 2.12;
X_rot = 7.96;

% Define o vetor de valores do escorregamento
s_values = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];  
n = length(s_values);

% Inicializa os vetores para as variáveis
G1 = zeros(1, n);
L1 = zeros(1, n);
R1 = zeros(1, n);

Z_trad = zeros(1, n);
Z_CPT = zeros(1, n);

% Loop para simular o modelo para cada valor de 's'
for i = 1:n
    % Define o valor de 's' no workspace do Simulink
    assignin('base', 's', s_values(i));
    
    % Executa a simulação
    simOut = sim(mode, 'StopTime', '10');  % Ajuste o 'StopTime' conforme necessário
    
    % Extrai os valores das variáveis no formato de estrutura
    G1_struct = simOut.get('G1');  
    L1_struct = simOut.get('L1');  
    
    % Extrai o último valor 
    G1(i) = G1_struct.signals.values(end);
    L1(i) = L1_struct.signals.values(end);

    % Calculo da resistencia 
    R1(i) = 1/G1(i);
end

% Fecha o modelo Simulink
close_system(mode);

% Cria uma tabela com os resultados
results_simulacao = table(s_values', G1', L1', R1', 'VariableNames', {'s', 'G1', 'L1', 'R1'});

% Exibe a tabela
disp(results_simulacao);

% Comprovação da similaradade dos modelos 
for i = 1:n
    % Calcula a impedancia total do sistema pelo metodo tradicional
    Z_th = (X_mag*1i * (R_est + X_est*1i))/(R_est + 1i*(X_mag + X_est));
    Z_trad(i) = Z_th + (R_rot/s_values(i)) + X_rot*1i;

    % Calcula a impedancia total do sistema pelo metodo CPT
    Z_CPT(i) = (R1(i) * L1(i)*1i * 2*pi*60)/(R1(i) + L1(i)*1i * 2*pi*60);
end

% Cria uma tabela com os resultados
results_comprovacao = table(Z_trad', Z_CPT', 'VariableNames', {'Tradicional', 'CPT'});

% Exibe a tabela
disp(results_comprovacao);

% Salva a tabela em um arquivo CSV (opcional)
% writetable(results_table, 'resultados_simulacao.csv');
