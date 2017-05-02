#include "logview.h"
#include "entitybinding.h"

LogView::LogView(QWidget *parent) :
    QQuickWidget(parent)
{
    EntityBinding* entityBinding = EntityBinding::instance();
    this->rootContext()->setContextProperty("_entityBinding", entityBinding);

    this->setSource(QUrl("qrc:/LogView.qml"));
}

LogView::~LogView()
{
}

void LogView::showEvent(QShowEvent *e)
{
    QQuickWidget::showEvent(e);
}

void LogView::hideEvent(QHideEvent *e)
{
    QQuickWidget::hideEvent(e);
}

void LogView::resizeEvent(QResizeEvent *e)
{
    this->rootObject()->setProperty("width",this->width());
    this->rootObject()->setProperty("height",this->height());
    QQuickWidget::resizeEvent(e);
}
