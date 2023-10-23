library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_7_Segmente is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD : out  STD_LOGIC_VECTOR (6 downto 0));
end BCD_7_Segmente;

architecture behavioral of BCD_7_Segmente is

begin
	--BCD(0) <= A(0) or A(2) or (A(1) and A(3)) or (not(A(1))and not(A(3)));
--	BCD(1) <= not(A(1)) or (not(A(2)) and not(A(3))) or (A(2) and A(3));
--	BCD(2) <= (A(1) or not(A(2)) or A(3));
--	BCD(3) <= (not(A(1)) and not(A(3))) or(A(2) and not(A(3))) or (A(1) and not(A(2)) and A(3)) or (not(A(1)) and A(2)) or A(0);
--	BCD(4) <= (not(A(1)) and not(A(3))) or (A(2) and not(A(3)));
--	BCD(5) <= A(0) or (not(A(2)) and not(A(3))) or (A(1) and not(A(2))) or (A(1) and not(A(3)));
--	BCD(6) <= A(0) or (A(1) and not(A(2))) or (not(A(1)) and A(2)) or (A(2) and not(A(3)));	 
process(A)
begin
case A is
    when "0000" => BCD <= "0000001"; -- "0"     
    when "0001" => BCD <= "1001111"; -- "1" 
    when "0010" => BCD <= "0010010"; -- "2" 
    when "0011" => BCD <= "0000110"; -- "3" 
    when "0100" => BCD <= "1001100"; -- "4" 
    when "0101" => BCD <= "0100100"; -- "5" 
    when "0110" => BCD <= "0100000"; -- "6" 
    when "0111" => BCD <= "0001111"; -- "7" 
    when "1000" => BCD <= "0000000"; -- "8"     
    when "1001" => BCD <= "0000100"; -- "9"  
	when others => BCD <= "1111111";
	end case;
end process;	
end behavioral;

