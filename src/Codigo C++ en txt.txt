#include <iostream>
#include <fstream>
#include <string>

using namespace std;

// Lista del curso
string listaCurso[39] = {
    "Acosta Hanna", "Andrade Hugo", "Atiencia Josue", "Balarrezo Diego",
    "Barrionuevo Job", "Bedoya Juan", "Bravo Samuel", "Cajiao Paulo",
    "Calvopina Brandon", "Castelo Katherine", "Chacha Victor", "Chiluiza Steed",
    "Dominguez Daniel", "Freire Alan", "Gualle Abisag", "Guaman Alexander",
    "Guanga Sebastian", "Guanotoa Karla", "Landeta Edison", "Lara Karen",
    "Loor Jhon", "Lopez Washington", "Miranda Imanol", "Monar Jhair",
    "Muyulema Mateo", "Narvaez Antonella", "Nunez Bryan", "Pilco Mario",
    "Pomaquero Katherine", "Quevedo Gina", "Rivadeneyra Matias", "Rocha Carolina",
    "Sanchez Isaac", "Segovia Joseph", "Supe Joan", "Toapanta Matias",
    "Verdesoto Kevin", "Villacres Alejandro", "Viteri Shantal"
};

// Arreglos para guardar notas y promedios de cada estudiante
float notas[39][5];
float promedios[39];
bool tieneNotas[39];

int totalEstudiantes = 39;

// Variables para operaciones
float resultadoOperacion = 0;
bool hayOperacion = false;
bool hayNotas = false;

// Funcion para operaciones basicas
void operacionesBasicas() {
    int opcion;
    float num1, num2;

    cout << "\n--- OPERACIONES BASICAS ---" << endl;
    cout << "1. Suma" << endl;
    cout << "2. Resta" << endl;
    cout << "3. Multiplicacion" << endl;
    cout << "4. Division" << endl;
    cout << "Elige una opcion: ";
    cin >> opcion;

    cout << "Ingresa el primer numero: ";
    cin >> num1;
    cout << "Ingresa el segundo numero: ";
    cin >> num2;

    if (opcion == 1) {
        resultadoOperacion = num1 + num2;
        cout << "Resultado: " << num1 << " + " << num2 << " = " << resultadoOperacion << endl;
        hayOperacion = true;
    } else if (opcion == 2) {
        resultadoOperacion = num1 - num2;
        cout << "Resultado: " << num1 << " - " << num2 << " = " << resultadoOperacion << endl;
        hayOperacion = true;
    } else if (opcion == 3) {
        resultadoOperacion = num1 * num2;
        cout << "Resultado: " << num1 << " * " << num2 << " = " << resultadoOperacion << endl;
        hayOperacion = true;
    } else if (opcion == 4) {
        if (num2 == 0) {
            cout << "Error: No se puede dividir para cero." << endl;
        } else {
            resultadoOperacion = num1 / num2;
            cout << "Resultado: " << num1 << " / " << num2 << " = " << resultadoOperacion << endl;
            hayOperacion = true;
        }
    } else {
        cout << "Opcion no valida." << endl;
    }
}

// Funcion para registrar notas
void registroDeNotas() {
    int numeroLista;
    char continuar;

    do {

        cout << "\n--- LISTA DEL CURSO ---" << endl;
        for (int i = 0; i < totalEstudiantes; i++) {
            cout << i + 1 << ". " << listaCurso[i];
            if (tieneNotas[i]) {
                cout << "  [YA REGISTRADO]";
            }
            cout << endl;
        }

        cout << "\nIngresa el numero de lista del estudiante: ";
        cin >> numeroLista;

        if (numeroLista < 1 || numeroLista > totalEstudiantes) {
            cout << "Numero de lista no valido." << endl;
            return;
        }

        int indice = numeroLista - 1;

        cout << "\nIngresando notas para: " << listaCurso[indice] << endl;

        float suma = 0;
        for (int i = 0; i < 5; i++) {
            cout << "Nota " << i + 1 << ": ";
            cin >> notas[indice][i];
            suma = suma + notas[indice][i];
        }

        promedios[indice] = suma / 5;
        tieneNotas[indice] = true;
        hayNotas = true;

        cout << "\nNotas registradas para " << listaCurso[indice] << endl;
        cout << "Promedio: " << promedios[indice] << endl;

        if (promedios[indice] >= 7) {
            cout << "Estado: APROBADO" << endl;
        } else {
            cout << "Estado: REPROBADO" << endl;
        }

        cout << "\nDeseas ingresar las notas de otro estudiante? (s/n): ";
        cin >> continuar;

    } while (continuar == 's' || continuar == 'S');
}

// Funcion para guardar en archivo
void guardarResultados() {
    cout << "\n--- GUARDAR RESULTADOS ---" << endl;

    ofstream archivo("resultados.txt");

    if (archivo.is_open()) {
        archivo << "================================" << endl;
        archivo << "     RESULTADOS DEL PROGRAMA" << endl;
        archivo << "================================" << endl;
        archivo << "Estudiante: Matias Rivadeneyra" << endl;
        archivo << "Fecha: 2026" << endl;
        archivo << "Lenguaje: C++" << endl;
        archivo << "--------------------------------" << endl;

        if (hayOperacion) {
            archivo << "OPERACION MATEMATICA:" << endl;
            archivo << "Resultado = " << resultadoOperacion << endl;
            archivo << "--------------------------------" << endl;
        }

        archivo << "LISTA DEL CURSO:" << endl;
        archivo << "--------------------------------" << endl;

        int aprobados = 0;
        int reprobados = 0;

        for (int i = 0; i < totalEstudiantes; i++) {
            archivo << i + 1 << ". " << listaCurso[i];

            if (tieneNotas[i]) {
                archivo << "  |  Notas: ";
                for (int j = 0; j < 5; j++) {
                    archivo << notas[i][j];
                    if (j < 4) archivo << ", ";
                }
                archivo << "  |  Promedio: " << promedios[i];

                if (promedios[i] >= 7) {
                    archivo << "  |  APROBADO" << endl;
                    aprobados = aprobados + 1;
                } else {
                    archivo << "  |  REPROBADO" << endl;
                    reprobados = reprobados + 1;
                }
            } else {
                archivo << "  |  Sin notas registradas" << endl;
            }
        }

        archivo << "--------------------------------" << endl;
        archivo << "Total aprobados:  " << aprobados << endl;
        archivo << "Total reprobados: " << reprobados << endl;
        archivo << "================================" << endl;

        archivo.close();
        cout << "Resultados guardados en resultados.txt" << endl;
    } else {
        cout << "Error al abrir el archivo." << endl;
    }
}

int main() {
    int opcion;

    // Inicializar arreglos
    for (int i = 0; i < totalEstudiantes; i++) {
        tieneNotas[i] = false;
        promedios[i] = 0;
    }

    cout << "Bienvenido al programa de Matias Rivadeneyra" << endl;
    do {
        cout << "\n==============================" << endl;
        cout << "       MENU PRINCIPAL" << endl;
        cout << "==============================" << endl;
        cout << "1. Operaciones basicas" << endl;
        cout << "2. Registro de notas" << endl;
        cout << "3. Guardar resultados" << endl;
        cout << "4. Salir" << endl;
        cout << "Elige una opcion: ";
        cin >> opcion;

        if (opcion == 1) {
            operacionesBasicas();
        } else if (opcion == 2) {
            registroDeNotas();
        } else if (opcion == 3) {
            guardarResultados();
        } else if (opcion == 4) {
            cout << "Saliendo del programa..." << endl;
        } else {
            cout << "Opcion no valida. Intenta de nuevo." << endl;
        }

    } while (opcion != 4);

    return 0;
}
