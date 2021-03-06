import java.util.*;

public class TestClasePelicula {
	
	public static void main (String args[]) {
		
		Scanner teclado = new Scanner(System.in);
		
		System.out.println("-------------Constructor por defecto----------------");
		System.out.println(" ");
		
		ClasePelicula pelicula0 = new ClasePelicula();
		System.out.println(pelicula0.toString());
		
		System.out.println(" ");
		System.out.println("-------------Constructor con parametros----------------");
		System.out.println(" ");
		
		ClasePelicula pelicula1 = new ClasePelicula("Pelicula Mieo", 1998);
		System.out.println(pelicula1.toString());
		System.out.println(" ");
		
		ClasePelicula pelicula2 = new ClasePelicula("V de vendetta", 2005);
		System.out.println(pelicula2.toString());
		
		System.out.println(" ");
		System.out.println("-------------Gets----------------");
		System.out.println(" ");
		
		System.out.println("Nombre de la pelicula 1: "  +pelicula1.getNombrePelicula());
		System.out.println("A\u00f1o de estreno de la pelicula 1: " +pelicula1.getAnioEstreno());
		
		System.out.println(" ");
		
		System.out.println("Nombre de la pelicula 2: "  +pelicula2.getNombrePelicula());
		System.out.println("A\u00f1o de estreno de la pelicula 2: " +pelicula2.getAnioEstreno());
		
		System.out.println(" ");
		System.out.println("-------------Sets----------------");
		System.out.println(" ");
		
		System.out.println(pelicula1.toString()); //pelicula sin modificar
		
		pelicula1.setNombrePelicula("Moulin Rouge!"); //Cambiamos el nombre
		pelicula1.setAnioEstreno(2001); //Cambiamos el año de estreno
		
		System.out.println(" ");
		
		System.out.println("El nuevo nombre es: " +pelicula1.getNombrePelicula());
		System.out.println("El nuevo a\u00f1o es: " +pelicula1.getAnioEstreno());
		
		System.out.println(" ");
		
		System.out.println(pelicula1.toString());
		
		System.out.println(" ");
		System.out.println("-------------Hash code----------------");
		System.out.println(" ");
		
		System.out.println("Hash code de " +pelicula1.getNombrePelicula() +": " +pelicula1.hashCode());
		System.out.println("Hash code de " +pelicula2.getNombrePelicula() +": " +pelicula2.hashCode());
		
		System.out.println(" ");
		System.out.println("-------------Clone----------------");
		System.out.println(" ");
		
		ClasePelicula copiaPelicula2 = null;
		
		copiaPelicula2 = pelicula2.clone();
		
		System.out.println(copiaPelicula2.toString());
		
		System.out.println(" ");
		System.out.println("-------------Compare to----------------");
		System.out.println(" ");
		
		System.out.println("Comparando la pelicula 2 con su copia:");
		System.out.println(pelicula2.compareTo(copiaPelicula2));
		System.out.println(" ");
		System.out.println("Comparando la pelicula 1 con la copia de la pelicula 2:");
		System.out.println(pelicula1.compareTo(copiaPelicula2));
		System.out.println(" ");
		System.out.println("Comparando la pelicula 2 con la pelicula 1:");
		System.out.println(pelicula2.compareTo(pelicula1));
		
		System.out.println(" ");
		System.out.println("-------------Equals----------------");
		System.out.println(" ");
		
		System.out.print("Son iguales la pelicula 2 y su copia?  --->  ");
		System.out.println(pelicula2.equals(copiaPelicula2));
		
		System.out.println(" ");
		System.out.print("Son iguales la pelicula 1 y la pelicula 1?  --->  ");
		System.out.println(pelicula1.equals(pelicula1));
		
		System.out.println(" ");
		System.out.print("Son iguales la pelicula 2 y la pelicula 1?  --->  ");
		System.out.println(pelicula2.equals(pelicula1));
		
		System.out.println(" ");
		System.out.println("-------------Array----------------");
		
		
		ClasePelicula [] array5Peliculas = new ClasePelicula [5];
		
		for(int i=0; i<5; i++){
			
			ClasePelicula pelicula = new ClasePelicula();
			
			System.out.println(" ");
			System.out.print("Introduzca el nombre de la pelicula numero " +(i+1) +": ");
			pelicula.setNombrePelicula(teclado.nextLine());
			
			System.out.print("Introduzca el a\u00f1o de su estreno: ");
			pelicula.setAnioEstreno(teclado.nextInt());
			
			teclado.nextLine();
			
			array5Peliculas [i] = pelicula;
		}
		
		System.out.println(" ");
		System.out.println("----------------Mostrar Array de 5 peliculas----------------");
		for(int i=0; i<array5Peliculas.length; i++){
			System.out.println(array5Peliculas[i]);
			System.out.println(" ");
		}
				
	}
}

