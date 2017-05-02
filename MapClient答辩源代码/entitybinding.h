#ifndef ENTITYBINDING_H
#define ENTITYBINDING_H

#include <QObject>

#include <QJsonObject>

class EntityBinding : public QObject
{
    Q_OBJECT

public:
    explicit EntityBinding(QObject *parent = 0);

    static EntityBinding* instance();

public slots:
    QString getCurrentEntity( void ) { return m_currentEntity; }
    void setCurrentEntity( QString currentEntity );

    QJsonObject getCurrentProperty( void ) { return m_currentProperty; }
    void setCurrentProperty( QJsonObject currentProperty );

    QString getCurrentValue() { return m_currentValue; }
    void setCurrentValue(QString value);

    QString getCurrentValueId() { return m_currentValueId; }
    void setCurrentValueId(QString valueId);

    QString getRunningInfo(){ return m_runningInfo; }
    void setRunningInfo(QString runningInfo);

signals:
    void currentEntityChanged(QString currentEntity);
    void currentPropertyChanged(QJsonObject currentProperty);

    void currentValueIdChanged(QString valueId);
    void currentValueChanged(QString value);

    void runningInfoChanged(QString runningInfo);


protected:
    QString m_currentEntity;
    QJsonObject m_currentProperty;

    QString m_currentValueId;
    QString m_currentValue;

    QString m_runningInfo;

};

#endif // ENTITYBINDING_H
