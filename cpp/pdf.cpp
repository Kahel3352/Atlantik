#include "pdf.h"
#include <QTextDocument>
#include <QPdfWriter>

Pdf::Pdf(QString nomDocument)
{
    cout<<"Pdf::Pdf(QString nomDocument)"<<endl;
    this->nomDocument = nomDocument;
}

QString Pdf::ecrireTexte()
{
    cout<<"void Pdf::ecrireTexte()"<<endl;
    string chaine;

    chaine+="<!doctype html> <html lang=\"fr\"> <head> <meta charset=\"utf-8\"> <title>Titre de la page</title> <link rel=\"stylesheet\" href=\"style.css\"> <script src=\"script.js\"></script> </head> <body>";

    vector<BateauVoyageur> lesBateaux = Passerelle::chargerLesBateauxVoyageurs();
    for(uint i = 0; i < lesBateaux.size(); i++)
    {
        chaine+=chargerImage(lesBateaux[i].getImage())+"<br>";
        chaine+=lesBateaux[i].versChaine()+"<br>";
    }

    chaine += "</body> </html>";
    return QString::fromStdString(chaine);
}

string Pdf::chargerImage(string image)
{
    return "<div align=\"center\"><img src=\"img/"+image+"\" height=150 width=250></div>";
}

void Pdf::imprimer()
{
    cout<<"void Pdf::imprimer()"<<endl;

    QPdfWriter* pdfWriter = new QPdfWriter(this->nomDocument);
    QTextDocument textDocument;
    textDocument.setHtml(this->ecrireTexte());
    textDocument.print(pdfWriter);

    delete pdfWriter;
}
