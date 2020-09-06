library IEEE;
use IEEE.std_logic_1164.all;


entity muxbus61 is

 port(
                s       : in    std_logic_vector(2 downto 0);
                d0      : in    std_logic_vector(7 downto 0);
                d1      : in    std_logic_vector(7 downto 0);
                d2      : in    std_logic_vector(7 downto 0);
                d3      : in    std_logic_vector(7 downto 0);
					 d4      : in    std_logic_vector(7 downto 0);
                d5      : in    std_logic_vector(7 downto 0);
                y       : out   std_logic_vector(7 downto 0)
        );

end muxbus61;


architecture arch1 of muxbus61 is

begin

  -- Your VHDL code defining the model goes here
  -- Selected signal assignment
  with s select y <= d0 when "000",
                     d1 when "001",
                     d2 when "010",
                     d3 when "011",
							d4 when "100",
							d5 when "101",
							"00000000" when "110",
							"00000000" when "111";
end arch1;
