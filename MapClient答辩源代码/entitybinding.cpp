#include "entitybinding.h"
#include <QDebug>
EntityBinding::EntityBinding(QObject *parent) : QObject(parent)
{

}

EntityBinding* EntityBinding::instance()
{
    static EntityBinding* pInstance = new EntityBinding();
    return pInstance;
}

void EntityBinding::setCurrentEntity(QString currentEntity)
{
    m_currentEntity = currentEntity;
    emit currentEntityChanged(m_currentEntity);
}

void EntityBinding::setCurrentProperty(QJsonObject currentProperty)
{
    if(m_currentEntity == "")
    {
        return;
    }
    m_currentProperty = currentProperty;
    emit currentPropertyChanged(m_currentProperty);
}

void EntityBinding::setCurrentValue(QString currentValue)
{
    if(m_currentValueId == "")
        return;

    m_currentValue = currentValue;
    emit currentValueChanged(m_currentValue);
}

void EntityBinding::setCurrentValueId(QString currentValueId)
{
    m_currentValueId = currentValueId;
    emit currentValueIdChanged(m_currentValueId);
}

void EntityBinding::setRunningInfo(QString runningInfo)
{
    m_runningInfo = runningInfo;
    emit runningInfoChanged(runningInfo);
}
