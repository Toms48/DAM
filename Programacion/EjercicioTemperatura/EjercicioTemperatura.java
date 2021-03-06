import java.util.*;

public class claseCalendario {
	
	Random random = new Random();
	int aleatorio = 0;
	
	/* Atributos básicos:
	 * 		+Array bidimensional
	 * 			-consultable: Sí --->  get	--->  calendario getCalendario();
	 * 			-modificable: No
	 * 	
	 * 		+Array unidimensional
	 * 			-consultable: Sí --->  get  ---> fecha getFecha();
	 * 			-modificable: No
	 */
	
	//Atributos básicos
	private int [][] calendario = new int [12][31]; 
	
	//Constructor por defecto
	public claseCalendario(){
        for(int i=0; i<calendario.length; i++){
            for(int j=0; j<calendario[i].length; j++){
                calendario[i][j] = 2;
            }
        }
    }
	
	//Constructor con parámetros
	public claseCalendario(int aleatorio){
		for(int i=0; i<calendario.length; i++){
			for(int j=0; j<calendario[i].length; j++){
				
				//Sería de 0 a 45 grados
				aleatorio = random.nextInt(46);
				calendario[i][j] = aleatorio;
			}
		}
	}
	
	//Gets   ñawoejfgqwoitfogawoefjawoìeaowerigawoiegh
	public claseCalendario getCalendario(){
		
		int i=0;
		int j=0;
		
		return calendario[i][j];
	}

	
}

