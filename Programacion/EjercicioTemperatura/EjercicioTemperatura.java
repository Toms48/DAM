import java.util.*;

public class EjercicioTemperatura {
	
	Random random = new Random();
	int aleatorio = 0;
	
	/* Atributos básicos:
	 * 		+Array bidimensional
	 * 			-consultable: Sí
	 * 			-modificable: No
	 */
	
	//Atributos básicos
	private int [][] calendario = new int [12][31];
	
	//Constructor por defecto
	public EjercicioTemperatura(){
        for(int i=0; i<calendario.length; i++){
            for(int j=0; j<calendario[i].length; j++){
                calendario[i][j] = 2;
            }
        }
    }
	
	//Constructor con parámetros
	public EjercicioTemperatura(int aleatorio){
		for(int i=0; i<calendario.length; i++){
			for(int j=0; j<calendario[i].length; j++){
				
				//Sería de 0 a 45 grados
				aleatorio = random.nextInt(46);
				calendario[i][j] = aleatorio;
			}
		}
	}
	
//-------------------------------------------------------------------------------

	/* 
	 * Nombre: pintarCalendario
	 * Comentario: Imprimirá el calendario por pantalla
	 * Cabezera/Prototipo: void pintarCalendario()
	 * 
	 * Precondiciones: Nada
	 * Entradas: Ninguna
	 * Salidas: Calendario
	 * E/S: Ninguna
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: Nada
	 */
	
	public void pintarCalendario(){
		for(int i=0; i<calendario.length; i++){
			System.out.println("");
			System.out.println("Fila " +(i+1) +": ");
			
			for(int j=0; j<calendario[i].length; j++){
				System.out.print("|");
				System.out.print(calendario [i][j] +"|");
			}
			System.out.println("");
		}
	}
	
//-------------------------------------------------------------------------------

	/* 
	 * Nombre: mediaMes
	 * Comentario: Calculará la temperatura media de un mes
	 * Cabezera/Prototipo: double mediaMes(int [][] calendario)
	 * 
	 * Precondiciones: un número entero
	 * Entradas: número entero
	 * Salidas: la media de los días
	 * E/S:
	 * Postcondiciones: el número será un double
	 * 
	 * Restricciones: el número estará entre 1 y 12
	 */
	 
	public double mediaMes(int mes){
		
		double media = 0;
		double suma = 0;
		 
		for(int j=0; j<calendario[mes].length; j++){
			suma = suma + calendario[mes][j];
		}
		media = suma/31;
		return media;
	}
	
//-------------------------------------------------------------------------------
	
	/* 
	 * Nombre: minimaMes
	 * Comentario: Dirá cual es la temperatura más baja del mes indicado
	 * Cabezera/Prototipo: int minimaMes(int mes)
	 * 
	 * Precondiciones: un número entero (que indicará el mes)
	 * Entradas: un int
	 * Salidas: un int
	 * E/S: Nada
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: El mes tiene que estar entre 1 y 12
	 */
	
	public int minimaMes(int mes){
		
		int minima = null;
		
		for(int j=0; j<calendario[mes].length; j++){
			
			if(minima == null || calendario[mes][j] < minima){
				minima = calendario[mes][j];

			}
		}
		return minima;
	}
	
//-------------------------------------------------------------------------------
	
	/* 
	 * Nombre: maximaMes
	 * Comentario: Dirá cual es la temperatura más alta del mes indicado
	 * Cabezera/Prototipo: int maximaMes(int mes)
	 * 
	 * Precondiciones: un número entero (que indicará el mes)
	 * Entradas: un int
	 * Salidas: un int
	 * E/S: Nada
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: El mes tiene que estar entre 1 y 12
	 */
	
	public int maximaMes(int mes){
		
		int minima = 0;
		int maxima = 0;
		
		for(int j=0; j<calendario[mes].length; j++){
			
			if(calendario[mes][j] > minima){
				minima = calendario[mes][j];
				maxima = minima;
			}
		}
		return maxima;
	}
	
//-------------------------------------------------------------------------------

	/* 
	 * Nombre: diaMaximaTemperatura
	 * Comentario: 
	 * Cabezera/Prototipo: void maximaMinimaMes(int mes)
	 * 
	 * Precondiciones: un número entero (que indicará el mes)
	 * Entradas: un int
	 * Salidas: Nada
	 * E/S: Nada
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: El mes tiene que estar entre 1 y 12
	 */
	
}

