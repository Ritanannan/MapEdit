#ifndef PROPERTYVIEW_H
#define PROPERTYVIEW_H

#include <QQuickWidget>
#include <QQmlContext>
#include <QQuickItem>

class PropertyView : public QQuickWidget
{
    Q_OBJECT

public:
    explicit PropertyView(QWidget *parent = 0);
    ~PropertyView();


public:
    void showEvent(QShowEvent *e);
    void hideEvent(QHideEvent *e);
    void resizeEvent(QResizeEvent *e);

};

#endif // PROPERTYVIEW_H
