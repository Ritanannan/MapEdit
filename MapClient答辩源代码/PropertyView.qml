import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import DesktopControls 0.1

Rectangle {
    id: root
    width: 300

    signal itemChanged(string id, string value)

    onItemChanged: {
        _entityBinding.setCurrentValueId(id)
        _entityBinding.setCurrentValue(value)
    }

    function updateContent(c){
        Object.keys(map).forEach(function(k){
            if (c && c.hasOwnProperty(k)) {
                map[k].setValue(c[k])
            }
        })
    }

    Connections {
        target: _entityBinding
        onCurrentPropertyChanged: {
            updateContent(currentProperty)
        }
    }

    property var map: {
        "name": name,
        "valueX": valueX,
        "valueY": valueY,
        "valueZ": valueZ,
        "valueScale": valueScale
    }

    Column{
        anchors{
            left: parent.left
            right: parent.right
        }
        Section{
            anchors{
                left: parent.left
                right: parent.right
            }
            caption: "Basic Infomation"
            SectionLayout{
                anchors{
                    left: parent.left
                    right: parent.right
                }
                columns: 2
                PropertyEditLabel{
                    width: 100
                    text: "Module Name"
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignRight
                }

                PropertyEditTextField{
                    id: name
                    enabled: true
                    Layout.preferredHeight: 35
                    Layout.fillWidth: true
                    objectName: "name"
                    onItemChanged: root.itemChanged(id, value)
                }
                PropertyEditLabel{
                    width: 100
                    text: "ValueX"
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignRight
                }
                PropertyEditDoubleSpinBox{
                    id: valueX
                    enabled: true
                    Layout.preferredHeight: 35
                    Layout.fillWidth: true
                    objectName: "valueX"
                    onItemChanged: root.itemChanged(id, value)
                    from: -100000
                    to: 100000
                }

                PropertyEditLabel{
                    width: 100
                    text: "ValueY"
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignRight
                }
                PropertyEditDoubleSpinBox{
                    id: valueY
                    enabled: true
                    Layout.preferredHeight: 35
                    Layout.fillWidth: true
                    objectName: "valueY"
                    onItemChanged: root.itemChanged(id, value)
                    from: -100000
                    to: 100000
                }

                PropertyEditLabel{
                    width: 100
                    text: "ValueZ"
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignRight
                }
                PropertyEditDoubleSpinBox{
                    id: valueZ
                    enabled: true
                    Layout.preferredHeight: 35
                    Layout.fillWidth: true
                    objectName: "valueZ"
                    onItemChanged: root.itemChanged(id, value)
                    from: -100000
                    to: 100000
                }

                PropertyEditLabel{
                    width: 100
                    text: "ValueScale"
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignRight
                }
                PropertyEditDoubleSpinBox{
                    id: valueScale
                    enabled: true
                    Layout.preferredHeight: 35
                    Layout.fillWidth: true
                    objectName: "valueScale"
                    onItemChanged: root.itemChanged(id, value)
                    from: 0
                    to: 100000
                }
            }
        }
    }
}
