library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITh.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fin is
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
end fin;  

architecture behavioral of fin is	 
--numaratoarele 
	
	component cresc0_9 is
		generic(n: natural := 4);
		Port(
				En: in STD_LOGIC; 
				R: in STD_LOGIC;
				CLK: in STD_LOGIC; 
				i: in STD_LOGIC_VECTOR(n - 1 downto 0);
				PL: in STD_LOGIC;  
				Cr: out STD_LOGIC;
				LED: out STD_LOGIC_VECTOR(n - 1 downto 0)
			);
	end component;
	
	component cresc0_5 is
		generic(n: natural := 4);
		Port(
				En: in STD_LOGIC; 
				R: in STD_LOGIC; 
				CLK: in STD_LOGIC; 
				i: in STD_LOGIC_VECTOR(n - 1 downto 0);
				PL: in STD_LOGIC;   
				Cr: out STD_LOGIC;	
				LED: out STD_LOGIC_VECTOR(n - 1 downto 0)
			);
	end component;	
	
	component cresc0_3 is
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
	end component; 
	
	component cresc0_3_var1 is
		generic(n: natural := 4);
		Port(
				En: in STD_LOGIC; 
				R: in STD_LOGIC;
				CLK: in STD_LOGIC; 
				i: in STD_LOGIC_VECTOR(n - 1 downto 0);
				PL: in STD_LOGIC;  
				Cr: out STD_LOGIC;
				LED: out STD_LOGIC_VECTOR(n - 1 downto 0)
			);
	end component;
	
	component cresc0_3_var2 is
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
	end component;
	
	component cresc0_2 is
		generic(n: natural := 4);
		Port(
				En: in STD_LOGIC; 
				R: in STD_LOGIC;
				CLK: in STD_LOGIC; 
				i: in STD_LOGIC_VECTOR(n - 1 downto 0);
				PL: in STD_LOGIC;   
				Cr: out STD_LOGIC;
				LED: out STD_LOGIC_VECTOR(n - 1 downto 0) 
			);
	end component; 
	
	component cresc0_1 is
		generic(n: natural := 4);
		Port(
				En: in STD_LOGIC; 
				R: in STD_LOGIC;
				CLK: in STD_LOGIC; 
				i: in STD_LOGIC_VECTOR(n - 1 downto 0);
				PL: in STD_LOGIC;   
				Cr: out STD_LOGIC;
				LED: out STD_LOGIC_VECTOR(n - 1 downto 0)
			);
	end component; 
	
	component cresc0_1_var2 is
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
	end component; 
	
	--generatorul de temperatura
	component generator is	 
		generic(n: natural :=4);
		Port ( mode : in  STD_LOGIC;
	           R : in  STD_LOGIC;
	           CLK1: in  STD_LOGIC;	
			   LED_G : out STD_LOGIC_VECTOR(n-1 downto 0)
			);	
	end component;
	
	--BCD 7 segmente pentru afisare	 
	component BCD_7_Segmente is
	    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
	           BCD : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	--semnale	   
	--pentru min-> q1, q2
	--pentru ora-> q3, q4
	--pentru zi-> q5, q6   
	--pentru luna-> q7, q8
	--pentru temo-> t1, t2
	signal q1, q2, q3, q4, q5, q6, q7, q8, q9, q10: STD_LOGIC_VECTOR (3 downto 0);
	signal e1, e2, e3, e4, e5, e6, e7, e8, t1, t2: STD_LOGIC;
	begin 
		--ORA
		--minute
		min_unit: cresc0_9 port map (En, R, CLK, Min_Uni_In, En, e1, q1);
	   	min_zeci: cresc0_5 port map (e1, R, CLK, Min_Zec_In, En, e2, q2); 
		--ora
		ora_unit: cresc0_3 port map (e2, R, CLK, Ora_Uni_In, En, e3, e4, q3); 
		ora_zeci: cresc0_2 port map (e3, R, CLK, Ora_Zec_In, En, e4, q4);
		--DATA
		--zi
		zi_unit: cresc0_3_var2 port map(e4, R, CLK, Zi_Uni_In, En, e5, e6, q5);
		zi_zeci: cresc0_3_var1 port map(e5, R, CLK, Zi_Zec_In, En, e6, q6);
		--luna
		luna_unit: cresc0_1_var2 port map(e6, R, CLK, Luna_Uni_In, En, e7, e8, q7);
		luna_zeci: cresc0_3_var1 port map(e7, R, CLK, Luna_Zec_In, En, e8, q8);
		
		--TEMPERATURA
		temp_unit:	generator port map(En, R, CLK, q9);
		temp_zeci:	generator port map(En, R, CLK, q10); 
	
		--Afisare/simulare pe BCD
		min_afis_unit: BCD_7_Segmente port map(q1, Min_Uni_Out);
		min_afis_zeci: BCD_7_Segmente port map(q2, Min_Zec_Out);
		
		ora_afis_unit: BCD_7_Segmente port map(q3, Ora_Uni_Out);
		ora_afis_zeci: BCD_7_Segmente port map(q4, Ora_Zec_Out);
		
		zi_afis_unit: BCD_7_Segmente port map(q5, Zi_Uni_Out);
		zi_afis_zeci: BCD_7_Segmente port map(q6, Zi_Zec_Out);
		
		luna_afis_unit:	BCD_7_Segmente port map(q7, Luna_Uni_Out);
		luna_afis_zeci: BCD_7_Segmente port map(q8, Luna_Zec_Out);
		
		temp_afis_unit: BCD_7_Segmente port map(q9, Temp_Uni_Out);
		temp_afis_zeci: BCD_7_Segmente port map(q10, Temp_Zec_Out);
		
end behavioral;