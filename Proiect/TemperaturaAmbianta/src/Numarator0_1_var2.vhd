library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITh.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--alt numarator 0-1 pentru luna, ca sa numere pana la 12(sa apara lunile de 10, 11, 12)
entity cresc0_1_var2 is
	generic(n: natural := 4);
	Port(
			En: in STD_LOGIC; 
			R: in STD_LOGIC;
			CLK: in STD_LOGIC;		
			i: in STD_LOGIC_VECTOR(n - 1 downto 0);
			PL: in STD_LOGIC;
			verif: in STD_LOGIC;  
			Cr: out STD_LOGIC;	 
			LED: out STD_LOGIC_VECTOR(n - 1 downto 0)
		);
end cresc0_1_var2;

architecture Behavioral of cresc0_1_var2 is
	signal tmp: std_logic_vector(n - 1 downto 0) := (others => '0');
	begin	
		nr: process(R, CLK, En)
		begin
			if(R = '1') then tmp <= X"0";
			elsif (rising_edge(CLK)) then 
					if(PL = '1') then tmp <= i;
					elsif (PL = '0') then
						if(En = '1') then
						tmp <= tmp + 1; 
					end if;
				end if;
				if(verif <= '0' and tmp = "1001") then tmp <= X"0001";	Cr <= '1';
					elsif (verif <= '1') then tmp <= X"0"; Cr <= '1';
				end if;
			end if;
		end process;
	LED <= tmp;
end Behavioral;
