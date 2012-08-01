Feature: Numeros Romanos
	In order convertir numeros romanos
	As a usuario
	I Want convetir numeros romando

	Scenario Outline: Convertir <arabigo>
		Given un conversor
		When le paso <arabigo>
		Then lo convierto a <romano>

		Examples:
			| arabigo | romano |
			| 1		  | I	   |
			| 2		  | II	   |
			| 3		  | III	   |
			| 4		  | IV	   |
			| 5		  | V	   |
			| 6		  | VI	   |
			| 7		  | VII	   |
			| 8		  | VII	   |
			| 9		  | VIII   |
			| 10	  | X	   |
			| 11	  | XI	   |
			| 12	  | XII	   |
			| 13	  | XIII   |
			| 14	  | XIV	   |
			| 15	  | XV	   |
			| 16	  | XVI	   |
			| 17	  | XVIII  |
			| 18	  | XVII   |
			| 19	  | XVIII  |
			| 20	  | XX	   |

	Scenario Outline: numeros enteros no convertibles devuelven nil
		Given que <arabigo> es un numero no convertible a romano
		When convierto a romano
		Then el resultado romano es nil
		
		Examples:
			| arabigo |
			| -10 |
			| 0 |
			| 4000 |
			| 4100 |

	Esquema del escenario: numeros romanos inválidos devuelven nil
		Given que el número romano es <valor romano>
		When convierto a entero
		Then el resultado entero es nil

		Examples:
			| valor romano |
			| IIII |
			| VIV |
			| |
			| IA |
			| HOLA |
			| i |
			| v |
