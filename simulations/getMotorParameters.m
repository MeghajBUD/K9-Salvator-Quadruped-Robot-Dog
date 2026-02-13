function pmsm = getMotorParameters(motorName)

    pmsm = struct();

    switch motorName
        case 'AK45_10_KV75'
            % Intermediate Variables
            Ke_datasheet = 13.33; % Back-EMF constant from datasheet (V/krpm)
            Ke_SI = Ke_datasheet / (1000*2*pi/60); % Same constant in SI units for MatLab (Vs / rad)
            Kt = Ke_SI; % Torque Constant (Nm/A)
            %gearRatio = 36;

            % Metadata
            pmsm.model = 'AK45_10_KV75';
            pmsm.sn = '-1';

            % Electrical Parameters
            pmsm.Rs = 1.5 * 2.2; % Phase resistance (Ohms)
            pmsm.Ld = 1.5 * 1330e-6; % d-axis inductance (Henries)
            pmsm.Lq = 1.5 * 1330e-6; % q-axis inductance (Henries)
            pmsm.p = 14; % Pole pairs
            pmsm.FluxPM = Ke_SI / pmsm.p; % Permanent magnet flux linkage (Vs / rad)

            % Mechanical Parameters
            pmsm.J = 89e-7; % Rotor inertia (kg/m^2)
            pmsm.B = 0; %  Damping coefficient
            pmsm.T_rated = Kt * pmsm.p;
    
            % Rated Values
            pmsm.I_rated = 2.1; % Rated current
            pmsm.N_max = 1800; % Max mechanical speed (rpm)
        
        otherwise
            error('Motor not recognized, is it in our list?')
    end
end
