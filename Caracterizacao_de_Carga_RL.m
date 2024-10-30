% Circuito RL para Caracterização de Carga até 9ª harmônica

clc;
clear all;
close all;

% Comando de interação MatLab e Simulink
sim('Caracterizacao_RL.slx')

sinal_G1 = ans.yout.getElement('G1');
t = sinal_G1.Values.Time;
Saida_G1 = sinal_G1.Values.Data;

sinal_L1 = ans.yout.getElement('L1');
Saida_L1 = sinal_L1.Values.Data;

sinal_jh = ans.yout.getElement('jh');
Saida_jh = sinal_jh.Values.Data;

sinal_R1 = ans.yout.getElement('R1');
Saida_R1 = sinal_R1.Values.Data;

sinal_C1 = ans.yout.getElement('C1');
Saida_C1 = sinal_C1.Values.Data;

sinal_eh = ans.yout.getElement('eh');
Saida_eh = sinal_eh.Values.Data;

%---------------------------------FIGURA 1---------------------------------
figure()
% Primeiro Plot (G1)
subplot(4, 5, (1:5))
plot(t, Saida_G1,'b', 'LineWidth', 1.5)
hold on
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
set(gca,'XTicklabels',[]);
xlim([0.5 3]);
ylim([0 0.3]);
ylabel('G_1 [S]', 'FontSize', 14, 'FontWeight', 'bold');

% Segundo Plot (L1)
subplot(4, 5, (6:10))
plot(t, Saida_L1,'b', 'LineWidth', 1.5);
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
set(gca,'XTicklabels',[]);
xlim([0.5 3]);
ylim([0 0.05]);
ylabel('L_1 [H]', 'FontSize', 14, 'FontWeight', 'bold');

% Terceiro Plot (jh)
subplot(4, 5, (11:15))
plot(t, Saida_jh,'b', 'LineWidth', 1.5);
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
% xlabel('tempo [s]', 'FontSize', 14, 'FontWeight','bold');
xlim([0.5 3]);
ylim([-50 50]);
ylabel('j_h [A]', 'FontSize', 14, 'FontWeight', 'bold');

% Zoom 1
subplot(4, 5, 16)
plot(t, Saida_jh,'b', 'LineWidth', 1.5);
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
xlabel('tempo [s]', 'FontSize', 14, 'FontWeight','bold');
xlim([0.7 0.74]);
ylim([-50 50]);
ylabel('Zoom j_h [A]', 'FontSize', 14, 'FontWeight', 'bold');

% Zoom 2
subplot(4, 5, 17)
plot(t, Saida_jh,'b', 'LineWidth', 1.5);
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
xlabel('tempo [s]', 'FontSize', 14, 'FontWeight','bold');
xlim([1.2 1.24]);
ylim([-50 50]);
ylabel('Zoom j_h [A]', 'FontSize', 14, 'FontWeight', 'bold');

% Zoom 3
subplot(4, 5, 18)
plot(t, Saida_jh,'b', 'LineWidth', 1.5);
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
xlabel('tempo [s]', 'FontSize', 14, 'FontWeight','bold');
xlim([1.7 1.74]);
ylim([-50 50]);
ylabel('Zoom j_h [A]', 'FontSize', 14, 'FontWeight', 'bold');

% Zoom 4
subplot(4, 5, 19)
plot(t, Saida_jh,'b', 'LineWidth', 1.5);
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
xlabel('tempo [s]', 'FontSize', 14, 'FontWeight','bold');
xlim([2.2 2.24]);
ylim([-50 50]);
ylabel('Zoom j_h [A]', 'FontSize', 14, 'FontWeight', 'bold');

% Zoom 5
subplot(4, 5, 20)
plot(t, Saida_jh,'b', 'LineWidth', 1.5);
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
xlabel('tempo [s]', 'FontSize', 14, 'FontWeight','bold');
xlim([2.7 2.74]);
ylim([-50 50]);
ylabel('Zoom j_h [A]', 'FontSize', 14, 'FontWeight', 'bold');

%---------------------------------FIGURA 2---------------------------------
figure()
% Primeiro Plot (R1)
subplot(3, 1, 1)
plot(t, Saida_R1,'b', 'LineWidth', 1.5)
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
set(gca,'XTicklabels',[]);
xlim([0.5 3]);
ylim([0 3.5]);
ylabel('R_1 [\Omega]', 'FontSize', 14, 'FontWeight', 'bold');

% Segundo Plot (C1)
subplot(3, 1, 2)
plot(t, Saida_C1,'b', 'LineWidth', 1.5)
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
set(gca,'XTicklabels',[]);
xlim([0.5 3]);
ylim([-0.003 0]);
ylabel('C_1 [F]', 'FontSize', 14, 'FontWeight', 'bold');

% Terceiro Plot
subplot(3, 1, 3)
plot(t, Saida_eh,'b', 'LineWidth', 1.5)
grid minor;
set(gca, 'FontSize', 10, 'FontWeight', 'bold');
xlabel('tempo [s]', 'FontSize', 14, 'FontWeight','bold');
xlim([0.5 3]);
ylim([-100 100]);
ylabel('e_h [V]', 'FontSize', 14, 'FontWeight', 'bold');