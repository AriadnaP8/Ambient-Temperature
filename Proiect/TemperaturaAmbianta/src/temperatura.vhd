library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITh.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity generator is	 
	generic(n: natural := 4);
	Port ( mode : in  STD_LOGIC;
           R : in  STD_LOGIC;
           CLK1: in  STD_LOGIC;	
		   LED_G : out STD_LOGIC_VECTOR(n-1 downto 0)
		);	
end generator;
		
architecture Behavioral of generator is
signal temp: std_logic_vector(n-1 downto 0) :="0001";
signal i: std_logic :='0';
begin				   			  
	gn: process(mode, CLK1, R)
	begin
		if(R ='1') then temp <= "0001";
		elsif (mode='1') then
			i <= temp(n-1)xor temp(0);
			temp <= temp(n-2 downto 0) & i;	
			
		end if;
		end process;
		LED_G <= temp; 
end Behavioral;