library ieee;
use ieee.std_logic_1164.all;

entity demux18 is
port ( i : in std_logic;
	    s : in std_logic_vector (2 downto 0);
       o : out std_logic_vector (7 downto 0));
end demux18;

architecture demux_archi of demux18 is
begin
  process (i,s)
begin
     o <= "00000000";
	case s is
		when "000" => o(0)<= i;
		when "001" => o(1)<= i;
		when "010" => o(2)<= i;
		when "011" => o(3)<= i;
		when "100" => o(4)<= i;
		when "101" => o(5)<= i;
		when "110" => o(6)<= i;
		when "111" => o(7)<= i;
        when others => o<= "00000000";
	end case;
end process;
end demux_archi;