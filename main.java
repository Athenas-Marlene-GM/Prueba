import java.util.ArrayList;
import java.util.Scanner;
import java.io.*;
import java.util.Comparator;
import java.util.List;
import java.util.Collections;

public class main{
   
    static Scanner lectura = new Scanner(System.in);
    static Scanner num = new Scanner(System.in);
    static ArrayList<Alumno> alumnos=new ArrayList<Alumno>();

    public static void main(String[] args) throws Exception{

        String nomUniversidad,asignatura,tipoClase,nombre,apellidoP,apellidoM,nombreArchivo;
        int numalumnos,ban;

        System.out.println("Que Universidad es: ");
        nomUniversidad=lectura.nextLine();

        System.out.println("Que aignatura es");
        asignatura=lectura.nextLine();
        System.out.println("Cupo maximo de el grupo");
        numalumnos=num.nextInt();

        llenaralumno(numalumnos);
        System.out.printf("%nPorceso de llenado de alumnos terminado%n");

        System.out.println("Cual es el nombre del profe: ");
        nombre=lectura.nextLine();
        System.out.println("Cual es el apellido paterno del profe ");
        apellidoP=lectura.nextLine();
        System.out.println("Cual es el apellido materno del profe");
        apellidoM=lectura.nextLine();

        System.out.println("Que tipo de clase es (presencial o virtual)");
        tipoClase=lectura.nextLine();
        Profesor profe=new Profesor(asignatura, tipoClase, nombre, apellidoP, apellidoM);
        
        profe.calificar(alumnos);

        System.out.println("Quieres exportar los datos de el grupo a un archivo nuevo .txt marca 1 para si");
        ban=num.nextInt();
        if(ban==1){
            System.out.println("Como se llama tu archivo con extencion .txt ejemplo lala.txt");
            nombreArchivo=lectura.nextLine();
            File file=new File(nombreArchivo);
            System.out.println(file.getAbsolutePath());


            try {

                FileWriter nr = new FileWriter(file);

                PrintWriter pw = new PrintWriter(nr);
    
                pw.println("******"+nomUniversidad+"******");
                pw.println("Esta es la grupo de "+asignatura+" con un cupo maximo de alumnos de "+numalumnos+ " con la modalidad "+tipoClase);
                pw.println("La clase la imparte el profesor"+profe.nombre+" "+profe.apellidoP+" " +profe.apellidoM);
                for(int i =0;i<alumnos.size();i++){
                    if((alumnos.get(i).examen+alumnos.get(i).practica)/2>6){
                        pw.println(i+": "+alumnos.get(i).nombre+" "+alumnos.get(i).apellidoP+" "+alumnos.get(i).apellidoM+"---------------> Aprobado");
                    }
                    else{
                        pw.println(i+": "+alumnos.get(i).nombre+" "+alumnos.get(i).apellidoP+" "+alumnos.get(i).apellidoM+"--------------->  Reprobado");
                    }
                    
                }
                pw.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

   }
   public static void llenaralumno(int j){
        String nombre,apellidoP,apellidoM;
        int ban=1;
        int ban2=0;
        do{
            
            System.out.println("Cual es el nombre de tu alumno: ");
            nombre=lectura.nextLine();
            System.out.println("Cual es el apellido paterno de tu alumno ");
            apellidoP=lectura.nextLine();
            System.out.println("Cual es el apellido materno de tu alumno");
            apellidoM=lectura.nextLine();
            Alumno alumno=new Alumno(nombre,apellidoP,apellidoM);
            alumnos.add(alumno);
            System.out.println("Quieres agregar otro usuario ingresa 1 para si: ");
            ban=num.nextInt();
            
            if(ban2==j-1){
                System.out.printf("%nCupo lleno%n");
            }

            ban2++;
        }while(ban==1 && ban2<j);
   }

}
