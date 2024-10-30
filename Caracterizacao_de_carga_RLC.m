% Circuito RLC com três capacitores senoidal - CPT

clc;
clear all;
close all;

% Comando de interação MatLab e Simulink
sim('Circuito_RLCCC_senoidal.slx')

sinalTensao = ans.yout.getElement('vfonte');
t = sinalTensao.Values.Time;
SaidaTensao = sinalTensao.Values.Data;

sinalCorrente = ans.yout.getElement('ifonte');
t2 = sinalCorrente.Values.Time;
SaidaCorrente = sinalCorrente.Values.Data;

sinalCorrente_ia = ans.yout.getElement('ia');
t3 = sinalCorrente_ia.Values.Time;
SaidaCorrente_ia = sinalCorrente_ia.Values.Data;

sinalCorrente_ir = ans.yout.getElement('ir');
t4 = sinalCorrente_ir.Values.Time;
SaidaCorrente_ir = sinalCorrente_ir.Values.Data;

sinalCorrente_iv = ans.yout.getElement('iv');
t5 = sinalCorrente_iv.Values.Time;
SaidaCorrente_iv = sinalCorrente_iv.Values.Data;

% Primeiro Plot (v,i)
% 0 a 0.25 segundo
subplot(5, 4, 1)
plot(t, SaidaTensao,'r', 'LineWidth', 1)
hold on
grid minor;
set(gca, 'FontWeight', 'bold');
xlim([0.1 0.15]);
xlabel('tempo [s]', 'FontSize', 12, 'FontWeight','bold');
ylim([-220 220]);
ylabel('v [V]', 'FontSize', 14, 'FontWeight', 'bold');

yyaxis("right")
plot(t, SaidaCorrente,'b', 'LineWidth', 1);
ylim([-100 100]);
hold on
ylabel('i [A]', 'FontSize', 14, 'FontWeight', 'bold');

% 0.25 a 0.5 segundo
subplot(5, 4, 2)
plot(t, SaidaTensao,'r', 'LineWidth', 1)
hold on
grid minor;
set(gca, 'FontWeight', 'bold');
xlim([0.3 0.35]);
xlabel('tempo [s]', 'FontSize', 12, 'FontWeight','bold');
ylim([-220 220]);
ylabel('v [V]', 'FontSize', 14, 'FontWeight', 'bold');

yyaxis("right")
plot(t, SaidaCorrente,'b', 'LineWidth', 1);
ylim([-100 100]);
hold on
ylabel('i [A]', 'FontSize', 14, 'FontWeight', 'bold');

% 0.5 a 0.75 segundo
subplot(5, 4, 3)
plot(t, SaidaTensao,'r', 'LineWidth', 1)
hold on
grid minor;
set(gca, 'FontWeight', 'bold');
xlim([0.6 0.65]);
xlabel('tempo [s]', 'FontSize', 12, 'FontWeight','bold');
ylim([-220 220]);
ylabel('v [V]', 'FontSize', 14, 'FontWeight', 'bold');

yyaxis("right")
plot(t, SaidaCorrente,'b', 'LineWidth', 1)
ylim([-100 100])
hold on
ylabel('i [A]', 'FontSize', 14, 'FontWeight', 'bold');

% 0.75 a 1 segundo
subplot(5, 4, 4)
plot(t, SaidaTensao,'r', 'LineWidth', 1)
hold on
grid minor;
set(gca, 'FontWeight', 'bold');
xlim([0.8 0.85]);
xlabel('tempo [s]', 'FontSize', 12, 'FontWeight','bold');
ylim([-220 220]);
ylabel('v [V]', 'FontSize', 14, 'FontWeight', 'bold');

yyaxis("right")
plot(t, SaidaCorrente,'b', 'LineWidth', 1)
ylim([-100 100])
hold on
ylabel('i [A]', 'FontSize', 14, 'FontWeight', 'bold');

% Segundo Plot (Tensão e corrente)
subplot(5, 1, 2)
plot(t, SaidaTensao,'r', 'LineWidth', 1)
grid minor;
set(gca,'FontSize', 12, 'FontWeight', 'bold');
set(gca,'XTicklabels',[]);
xlim([0.1 1]);
ylim([-220 220])
ylabel('v [V]', 'FontSize', 14, 'FontWeight', 'bold');

yyaxis("right")
plot(t, SaidaCorrente,'b', 'LineWidth', 1);
ylim([-100 100]);
hold on
ylabel('i [A]', 'FontSize', 14, 'FontWeight', 'bold');

% Terceiro Plot (ia)
subplot(5, 1, 3)
plot(t, SaidaCorrente_ia,'b', 'LineWidth', 1.5)
grid minor;
set(gca,'FontSize', 12, 'FontWeight', 'bold');
set(gca,'XTicklabels',[]);
xlim([0.1 1]);
ylim([-100 100])
ylabel('i_a [A]', 'FontSize', 14, 'FontWeight', 'bold');

% Quarto Plot (ir)
subplot(5, 1, 4)
plot(t, SaidaCorrente_ir,'b', 'LineWidth', 1.5)
grid minor;
set(gca,'FontSize', 12, 'FontWeight', 'bold'); % valores dos eixos
set(gca,'XTicklabels',[]); % tirar valores do eixo x
xlim([0.1 1]);
ylim([-50 50]);
ylabel('i_r [A]', 'FontSize', 14, 'FontWeight', 'bold');

% Quinto Plot (iv)
subplot(5, 1, 5)
plot(t, SaidaCorrente_iv,'b', 'LineWidth', 1.5)
grid minor;
set(gca,'FontSize', 12, 'FontWeight', 'bold');
xlabel('tempo [s]', 'FontSize', 14, 'FontWeight','bold');
xlim([0.1 1]);
ylim([-60 60]);
ylabel('i_v [A]', 'FontSize', 14, 'FontWeight', 'bold');