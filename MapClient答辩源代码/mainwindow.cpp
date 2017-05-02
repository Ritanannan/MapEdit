#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "entitybinding.h"
#include <QOpenGLContext>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    EntityBinding* entityBinding = EntityBinding::instance();
    view.engine()->qmlEngine()->rootContext()->setContextProperty("_entityBinding", entityBinding);
    view.setSource(QUrl("qrc:/main.qml"));

    QVBoxLayout* l = qobject_cast<QVBoxLayout*>( ui->centralwidget->layout( ) );
    l->insertWidget( 0, QWidget::createWindowContainer( &view ) );
}

MainWindow::~MainWindow()
{
    delete ui;
}
