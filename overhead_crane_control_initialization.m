clear; 
close all;
clc;

%% Caricamento in memoria dei parametri del sistema
% Parametri da definire: 
%  . mc (massa carrello) e mm (massa sospesa)
%  . cc e cm (costanti di smorzamento)
%  . L (lunghezza cavo)
%  . g (costante gravitazionale)
mm = 1000;  % kg
mc = 300;   % kg
cc = 5000;  % N*s/m
cm = 100;   % N*s/m
L = 2.5;    % m
g = 9.81;   % m/s^2

%% Definizione delle condizioni iniziali
% Definire condizioni iniziali per gli stati del sistema.
% Per esempio, si può prendere l'equilibrio stabile come condizione iniziale 
xc_0 = 0;               % m
xc_dot_0 = 0;           % m/s
alpha_0 = 80 * pi/180;  % rad
alpha_dot_0 = 0;        % rad/s

%% Definizione condizioni iniziali per linearizzazione
alpha_dot_eq = 0;
alpha_eq = pi/2;
xc_dot_eq = 0;
xc_eq = 0;

%% Lancio simulink per linearizzazione
sim('overhead_crane_linearization_model.slx');

%% Estraggo le matrici (A, B, C, D) del sistema linearizzato
A = overhead_crane_linearization_model_Timed_Based_Linearization.a;
B = overhead_crane_linearization_model_Timed_Based_Linearization.b;
C = overhead_crane_linearization_model_Timed_Based_Linearization.c;
D = overhead_crane_linearization_model_Timed_Based_Linearization.d;

sys = ss(A, B, C, D);
G = tf(sys);

bode(sys);

%% Poli e zeri
Galpha = G(1, 1);
Gx = G(2, 1);

figure;
pzmap(Galpha)

figure;
pzmap(Gx);

%% Task 1: Progettare un controllore Proporzionale 

% Sul file simulink modello_carroponte_controllo, create un controllore P 
% Fate il tuning a mano
open("Overhead_Crane_control_model.slx");

%% Task 2: Tuning del controllore con pidTuner 
pidTuner;

%% Task 3: Progetto di un regolatore con Cancellazione poli-zeri

% Troviamo zeri e poli complessi coniugati della funzione di
% trasferimento
[z,p,k] = zpkdata(Gx,'v');

% Proviamo a cancellare zeri e poli definendo una TF con poli e zeri
% dove vogliamo noi

% Hint: una soluzione comoda richiede l'uso dell'unità immaginaria i 
i = sqrt(-1);

% Una volta progettato il regolatore, lo esportiamo e lo testiamo tramite il simulatore
% C = zpk(p,z,8000);
% 
% s=tf('s');
% C = (s-p1)*(s-p2)/(s-z1)*(s-z2);

%C = 8000*tf([1 0.9122 4.208],[1 0.1 3.924]);


%% Task 4: Implementazione su simulink!

% Create un secondo anello di feedback e confrontate i risultati!
open("Overhead_Crane_control_model.slx"); 
