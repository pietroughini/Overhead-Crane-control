# Overhead-Crane-control
Control of the linear displacement of an Overhead crane

# Files 
1. **Overhead_Crane_control** → It is the main file and represents an overall report of the project. It includes the procedure followed during the execution, the graphs representing the evolution of the variables over time, and Bode plots of the transfer functions.
2. **linearization_simulink_initialization**, **overhead_crane_linearization_model** → contain, respectively, the MATLAB script and the Simulink model related to the linearization of the system, around an equilibrium state. After saving the assumed initial conditions and the necessary parameters in the workspace, the system is linearized using the *time based linearization* block applied to the physical system model.
3. **overhead_crane_control_initialization**, **Overhead_Crane_control_model** → represent the script and the model used for the control of the linear displacement of the overhead crane. To study and analyze the differences in the various types of responses in terms of both control action and output, a purely proportional controller and a real dynamic controller (pole-zero cancellation) have been employed.
