#include "propertyview.h"
#include "entitybinding.h"

PropertyView::PropertyView(QWidget *parent) :
    QQuickWidget(parent)
{
    EntityBinding* entityBinding = EntityBinding::instance();
    this->rootContext()->setContextProperty("_entityBinding", entityBinding);

    this->setSource(QUrl("qrc:/PropertyView.qml"));
}

PropertyView::~PropertyView()
{
}

void PropertyView::showEvent(QShowEvent *e)
{
    QQuickWidget::showEvent(e);
}

void PropertyView::hideEvent(QHideEvent *e)
{
    QQuickWidget::hideEvent(e);
}

void PropertyView::resizeEvent(QResizeEvent *e)
{
    this->rootObject()->setProperty("width",this->width());
    this->rootObject()->setProperty("height",this->height());
    QQuickWidget::resizeEvent(e);
}
