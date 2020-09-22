library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY ControlUnit_SM IS
   PORT(
		clkCPU   : IN   STD_LOGIC;
		reset    : IN   STD_LOGIC;
		
      ProgramCounter   : OUT  STD_LOGIC_VECTOR(4 downto 0);
		MemRead  : OUT   STD_LOGIC;
		
		Instr      : in    std_logic_vector(15 downto 0); --Registro de intrucción
		
		ClkReg   : OUT   STD_LOGIC;
	   selBus      : out    std_logic;
	   cIn         : out    std_logic;
	   M           : out    std_logic;
	   S           : out    std_logic_vector(3 downto 0);
	   selDest     : out    std_logic_vector(2 downto 0);
	   selOpA      : out    std_logic_vector(2 downto 0);
	   selOpB      : out    std_logic_vector(2 downto 0);
	   dataIN      : out    std_logic_vector(7 downto 0)
		);
END ControlUnit_SM;

ARCHITECTURE a OF ControlUnit_SM IS
   TYPE STATE_TYPE IS (Fetch, Decode, Execute);
   SIGNAL state   : STATE_TYPE;
	SIGNAL PCtemp  : STD_LOGIC_VECTOR(4 downto 0);
BEGIN
   PROCESS (clkCPU)
   BEGIN
      IF reset = '1' THEN
         state <= Fetch;
			PCtemp<="00000";
			
      ELSIF (clkCPU'EVENT AND clkCPU = '1') THEN
         CASE state IS
            WHEN Fetch=>
						MemRead<='1';
						ClkReg <='0';
                  state <= Decode;
						PCtemp	<= PCtemp + 1;	
					
            WHEN Decode=>
              

						MemRead<='0';
						ClkReg <='0';  
                  state <= Execute;	

			
						IF (Instr(15)='1') THEN
	
							selBus <=  Instr(15); --type
							selDest <= Instr(14 downto 12);
							dataIn <=  Instr(7 downto 0);
							
							cIn <= '0';
							M <= '0';
							S <= "0000";
							selOpA <= "000";
							selOpB <= "000";
							
						ELSIF (Instr(15)='0') THEN --register
							
							selBus <=  Instr(15);
							cIn    <=  Instr(14);
							M      <=  Instr(13);
							S      <=  Instr(12 downto 9);
							selDest <= Instr(8 downto 6);
							selOpA  <= Instr(5 downto 3);
							selOpB  <= Instr(2 downto 0);
							
							dataIn <= "00000000";
						end if;
										
            WHEN Execute=>
               
                  MemRead<='0';
						ClkReg <='1';  
						state <= Fetch;
               
         END CASE;
      END IF;
   END PROCESS;
   
   PROCESS (state)
   BEGIN
      CASE state IS
         WHEN Fetch =>
            ProgramCounter <= PCtemp;
         WHEN Decode =>
            ProgramCounter <= PCtemp;
         WHEN Execute =>
            ProgramCounter <= PCtemp;
      END CASE;
   END PROCESS;
   
END a;