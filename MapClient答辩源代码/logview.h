#ifndef LOGVIEW_H
#define LOGVIEW_H

#include <QQuickWidget>
#include <QQmlContext>
#include <QQuickItem>

class LogView : public QQuickWidget
{
    Q_OBJECT

public:
    explicit LogView(QWidget *parent = 0);
    ~LogView();


public:
    void showEvent(QShowEvent *e);
    void hideEvent(QHideEvent *e);
    void resizeEvent(QResizeEvent *e);

};

#endif // LOGVIEW_H
