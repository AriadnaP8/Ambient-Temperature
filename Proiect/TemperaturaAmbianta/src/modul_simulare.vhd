---------------------------------------------------------------------------------------------------
--
-- Title       : ms
-- Design      : TemperaturaAmbianta
-- Author      : 40784732130
-- Company     : asd
--
---------------------------------------------------------------------------------------------------
--
-- File        : modul_simulare.vhd
-- Generated   : Tue May 31 03:18:36 2022
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ms} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ms is
end ms;

--}} End of automatically maintained section

architecture behavioral of ms is   
	component fin is
		generic(n: natural := 21);
		Port(  
				--intrarile (din cutia neagra)
				Min_Zec_In: in STD_LOGIC_VECTOR (3 downto 0); 
				Min_Uni_In: in STD_LOGIC_VECTOR (3 downto 0);
				Ora_Zec_In: in STD_LOGIC_VECTOR (3 downto 0); 
				Ora_Uni_In: in STD_LOGIC_VECTOR (3 downto 0);
				Zi_Zec_In: in STD_LOGIC_VECTOR (3 downto 0);	 
				Zi_Uni_In: in STD_LOGIC_VECTOR (3 downto 0);
				Luna_Zec_In: in STD_LOGIC_VECTOR (3 downto 0);
				Luna_Uni_In: in STD_LOGIC_VECTOR (3 downto 0);
				R: in STD_LOGIC;
				CLK: in STD_LOGIC;
				EN: in STD_LOGIC; 
				--iesirile
				Min_Zec_Out: out STD_LOGIC_VECTOR (6 downto 0); 
				Min_Uni_Out: out STD_LOGIC_VECTOR (6 downto 0);
				Ora_Zec_Out: out STD_LOGIC_VECTOR (6 downto 0); 
				Ora_Uni_Out: out STD_LOGIC_VECTOR (6 downto 0);
				Zi_Zec_Out: out STD_LOGIC_VECTOR (6 downto 0);	 
				Zi_Uni_Out: out STD_LOGIC_VECTOR (6 downto 0);
				Luna_Zec_Out: out STD_LOGIC_VECTOR (6 downto 0);
				Luna_Uni_Out: out STD_LOGIC_VECTOR (6 downto 0);
				Temp_Uni_Out: out STD_LOGIC_VECTOR (6 downto 0); 
				Temp_Zec_Out: out STD_LOGIC_VECTOR (6 downto 0)
			);
	end component; 
	
	signal Min_Zec_In, Min_Uni_In, Ora_Zec_In, Ora_Uni_In, Zi_Zec_In, Zi_Uni_In, Luna_Zec_In, Luna_Uni_In: STD_LOGIC_VECTOR(3 downto 0);
	signal R, CLK, En:STD_LOGIC:='0';  
	signal	Min_Zec_Out, Min_Uni_Out, Ora_Zec_Out, Ora_Uni_Out, Zi_Zec_Out, Zi_Uni_Out, Luna_Zec_Out, Luna_Uni_Out, Temp_Uni_Out, Temp_Zec_Out: STD_LOGIC_VECTOR(6 downto 0);
	
begin
	-- enter your statements here --	
	ust: fin port map(Min_Zec_In, Min_Uni_In, Ora_Zec_In, Ora_Uni_In, Zi_Zec_In, Zi_Uni_In, Luna_Zec_In, Luna_Uni_In, R, CLK, En, Min_Zec_Out, Min_Uni_Out, Ora_Zec_Out, Ora_Uni_Out, Zi_Zec_Out, Zi_Uni_Out, Luna_Zec_Out, Luna_Uni_Out, Temp_Uni_Out, Temp_Zec_Out);
	ceas: process 
	begin
		CLK <= not (CLK) ;
		wait for 10 ns;
	end process; 
	
	En <= '1';  
	R <= '0';
	
	Min_Zec_In <= "0011";
	min_uni_in <= "0101";
	ora_zec_in <= "0001";
	ora_uni_in <= "0111";
	zi_zec_in <= "0000";
	zi_uni_in <= "1000";
	luna_zec_in <= "0000";
	luna_uni_in <= "0010";	 
	
end behavioral;
