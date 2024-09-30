clear
clc
close all

%% Parametri modello

mm = 1000; % massa carico [kg]
mc = 300;  % massa carrello [kg]
cm = 100;  % coefficiente attrito carico [N/(m/s)]
cc = 5e3;  % coefficiente attrito carrello [N/(m/s)]
L = 2.5;   % Lunghezza cavo rigido [m]
g = 9.81;  % Accelerazione di gravità [m/s^2]

% Tempo di simulazione
dt = 0.01;        % Tempo di campionamento [s]
tempo = 0:dt:30;  % Vettore tempo di simulazione [s]

%% Inizializzazione Stato 
alpha_0 = 80 * pi / 180;   % Condizione iniziale alpha
alpha_dot_0 = 0;  % Condizione iniziale velocità angolare
xc_0 = 0;         % Condizione iniziale posizione carrello
xc_dot_0 = 0;     % Condizione iniziale velocità carrello


%% Inizializzazione Stato all'equilibrio
alpha_0_eq = pi/2;   % Condizione iniziale alpha
alpha_dot_0_eq = 0;  % Condizione iniziale velocità angolare
xc_0_eq = 0;         % Condizione iniziale posizione carrello
xc_dot_0_eq = 0;     % Condizione iniziale velocità carrello

%% Lancio Simulazione per Linearizzazione
sim('modello_linearizzazione.slx');

%% Estraggo le matrici (A, B, C, D) del sistema linearizzato

A = modello_linearizzazione_Timed_Based_Linearization.a;
B = modello_linearizzazione_Timed_Based_Linearization.b;
C = modello_linearizzazione_Timed_Based_Linearization.c;
D = modello_linearizzazione_Timed_Based_Linearization.d;