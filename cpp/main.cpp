#include <iostream>
#include "bateauvoyageur.h"
#include "equipement.h"
#include "passerelle.h"
#include "pdf.h"
#include <QtSql>
#include <QGuiApplication>

using namespace std;

int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);
    //on initialise la base de données
    Passerelle::setDatabase();

    //on créer le pdf
    Pdf pdf("test.pdf");

    //on l'écris
    pdf.imprimer();

    return 0;
}
